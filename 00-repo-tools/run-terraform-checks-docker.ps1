<#
.SYNOPSIS
    Enhanced Docker-based Terraform module quality checker with comprehensive validation and terraform-docs integration.

.DESCRIPTION
    This script builds a Docker image containing Terraform, tflint, and terraform-docs,
    then runs comprehensive quality checks on Terraform modules in an isolated environment.
    
    The script performs the following operations:
    • 🛠️  Builds or uses existing Docker image with all required tools
    • 📋 Validates Terraform syntax and formatting
    • 🔍 Runs linting checks with tflint
    • 📝 Conditionally generates documentation with terraform-docs (OFF by default)
    • 🔧 Validates Azure Terraform Module Catalog Criterion compliance
    • ✅ Provides comprehensive completion summary

.PARAMETER ModulePath
    Specifies the path to the Terraform module directory to check.
    This parameter is mandatory and must point to a valid directory containing Terraform files.

.PARAMETER GenerateDocumentation
    Controls whether terraform-docs should generate README documentation.
    When specified, creates or updates README_GENERATED.md in the module directory.
    When omitted, documentation generation is skipped for faster execution.
    DEFAULT: OFF - Documentation generation is disabled by default for performance.

.PARAMETER RebuildImage
    Forces rebuilding of the Docker image even if it already exists.
    Use this when you want to ensure the latest tools and dependencies are included.

.PARAMETER ImageName
    Specifies the name for the Docker image. Defaults to "terraform-quality-checks".
    Useful for managing multiple versions or custom configurations.

.PARAMETER AzureModuleCheck
    Enables enhanced Azure Terraform Module Catalog Criterion compliance checking.
    When specified, performs additional validation against Azure module standards.

.PARAMETER SkipValidation
    Skips the basic module structure validation checks.
    Use this to focus only on formatting and linting without structure validation.

.PARAMETER Help
    Displays comprehensive help information including usage examples, features,
    troubleshooting guide, and Docker requirements.

.EXAMPLE
    .\run-terraform-checks-docker.ps1 -ModulePath "./modules/storage-account"
    
    Runs quality checks on the storage-account module without generating documentation.

.EXAMPLE
    .\run-terraform-checks-docker.ps1 -ModulePath "./modules/app-service" -GenerateDocumentation
    
    Runs quality checks and generates README documentation for the app-service module.

.EXAMPLE
    .\run-terraform-checks-docker.ps1 -ModulePath "./modules/network" -RebuildImage -GenerateDocumentation -AzureModuleCheck
    
    Rebuilds the Docker image and runs full checks with documentation generation and Azure compliance validation.

.EXAMPLE
    .\run-terraform-checks-docker.ps1 -Help
    
    Displays comprehensive help information with visual formatting and examples.

.NOTES
    Author: Terraform Quality Assurance Team
    Version: 2.1.0
    Requires: Docker Desktop or Docker Engine
    
    Docker Requirements:
    - Docker must be installed and running
    - Sufficient disk space for Docker image (~500MB)
    - Network access for downloading base images and tools
    
    Supported Platforms:
    - Windows PowerShell 5.1+
    - PowerShell Core 7.0+
    - Cross-platform Docker environments

.LINK
    https://developer.hashicorp.com/terraform/language/syntax/configuration
    https://github.com/terraform-linters/tflint
    https://terraform-docs.io/
#>

[CmdletBinding(DefaultParameterSetName='Run')]
param (
    [Parameter(Mandatory=$true, ParameterSetName='Run', Position=0)]
    [ValidateScript({
        if (-not (Test-Path $_ -PathType Container)) {
            throw "The specified module path '$_' does not exist or is not a directory."
        }
        $true
    })]
    [string]$ModulePath,
    
    [Parameter(Mandatory=$false, ParameterSetName='Run')]
    [switch]$GenerateDocumentation,
    
    [Parameter(Mandatory=$false, ParameterSetName='Run')]
    [switch]$RebuildImage,
    
    [Parameter(Mandatory=$false, ParameterSetName='Run')]
    [ValidatePattern('^[a-zA-Z0-9][a-zA-Z0-9_.-]*$')]
    [string]$ImageName = "terraform-quality-checks",
    
    [Parameter(Mandatory=$false, ParameterSetName='Run')]
    [switch]$AzureModuleCheck,
    
    [Parameter(Mandatory=$false, ParameterSetName='Run')]
    [switch]$SkipValidation,
    
    [Parameter(Mandatory=$false, ParameterSetName='Help')]
    [switch]$Help
)

# Set error action preference for better error handling
$ErrorActionPreference = "Stop"

# Initialize script variables
$ScriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path
$DockerfilePath = Join-Path $ScriptDir "Dockerfile"
$checkResults = @{
    TerraformFmt = $null
    TfLint = $null
    TerraformDocs = $null
    ModuleStructure = $null
    AzureCompliance = $null
}

# Function to display visual help information
function Show-DockerChecksHelp {
    Write-Host ""
    Write-Host "╔══════════════════════════════════════════════════════════════════════════════╗" -ForegroundColor Blue
    Write-Host "║                    🐳 DOCKER TERRAFORM QUALITY CHECKS 🐳                    ║" -ForegroundColor Blue
    Write-Host "║                         Enhanced Module Validation                          ║" -ForegroundColor Blue
    Write-Host "╚══════════════════════════════════════════════════════════════════════════════╝" -ForegroundColor Blue
    Write-Host ""
    
    Write-Host "📋 OVERVIEW" -ForegroundColor Green
    Write-Host "   This script runs comprehensive Terraform module quality checks using Docker." -ForegroundColor White
    Write-Host "   All tools are containerized for consistent, isolated execution." -ForegroundColor White
    Write-Host ""
    
    Write-Host "🔧 FEATURES" -ForegroundColor Green
    Write-Host "   • Terraform syntax validation and formatting" -ForegroundColor White
    Write-Host "   • Advanced linting with tflint" -ForegroundColor White
    Write-Host "   • Optional documentation generation with terraform-docs" -ForegroundColor White
    Write-Host "   • Azure Terraform Module Catalog Criterion compliance checking" -ForegroundColor White
    Write-Host "   • Comprehensive module structure validation" -ForegroundColor White
    Write-Host "   • Isolated Docker environment for consistent results" -ForegroundColor White
    Write-Host ""
    
    Write-Host "📝 BASIC USAGE" -ForegroundColor Green
    Write-Host "   .\run-terraform-checks-docker.ps1 -ModulePath `"./my-module`"" -ForegroundColor Cyan
    Write-Host ""
    
    Write-Host "🎛️  PARAMETERS" -ForegroundColor Green
    Write-Host "   -ModulePath          Path to Terraform module directory (Required)" -ForegroundColor White
    Write-Host "   -GenerateDocumentation Generate README with terraform-docs (Default: OFF)" -ForegroundColor Yellow
    Write-Host "   -RebuildImage        Force Docker image rebuild" -ForegroundColor White
    Write-Host "   -ImageName           Custom Docker image name (Default: terraform-quality-checks)" -ForegroundColor White
    Write-Host "   -AzureModuleCheck    Enable Azure compliance validation" -ForegroundColor White
    Write-Host "   -SkipValidation      Skip module structure validation" -ForegroundColor White
    Write-Host "   -Help                Show this help information" -ForegroundColor White
    Write-Host ""
    
    Write-Host "📚 EXAMPLES" -ForegroundColor Green
    Write-Host "   # Basic quality checks (no documentation)" -ForegroundColor Gray
    Write-Host "   .\run-terraform-checks-docker.ps1 -ModulePath `"./modules/storage`"" -ForegroundColor Cyan
    Write-Host ""
    Write-Host "   # Full validation with documentation and Azure compliance" -ForegroundColor Gray
    Write-Host "   .\run-terraform-checks-docker.ps1 -ModulePath `"./modules/app-service`" -GenerateDocumentation -AzureModuleCheck" -ForegroundColor Cyan
    Write-Host ""
    Write-Host "   # Force rebuild image and run comprehensive checks" -ForegroundColor Gray
    Write-Host "   .\run-terraform-checks-docker.ps1 -ModulePath `"./modules/network`" -RebuildImage -GenerateDocumentation" -ForegroundColor Cyan
    Write-Host ""
    
    Write-Host "📋 DOCUMENTATION GENERATION" -ForegroundColor Green
    Write-Host "   Documentation generation is " -ForegroundColor White -NoNewline
    Write-Host "OFF by default" -ForegroundColor Red -NoNewline
    Write-Host " for faster execution." -ForegroundColor White
    Write-Host "   Use " -ForegroundColor White -NoNewline
    Write-Host "-GenerateDocumentation" -ForegroundColor Cyan -NoNewline
    Write-Host " to enable terraform-docs README generation." -ForegroundColor White
    Write-Host ""
    
    Write-Host "🐳 DOCKER REQUIREMENTS" -ForegroundColor Green
    Write-Host "   • Docker Desktop or Docker Engine must be installed and running" -ForegroundColor White
    Write-Host "   • Minimum 2GB disk space for Docker image and containers" -ForegroundColor White
    Write-Host "   • Network access for downloading base images and tool binaries" -ForegroundColor White
    Write-Host "   • PowerShell 5.1+ or PowerShell Core 7.0+" -ForegroundColor White
    Write-Host ""
    
    Write-Host "🚨 TROUBLESHOOTING" -ForegroundColor Red
    Write-Host "   • Ensure Docker is running: " -ForegroundColor White -NoNewline
    Write-Host "docker info" -ForegroundColor Cyan
    Write-Host "   • Check module path exists and contains .tf files" -ForegroundColor White
    Write-Host "   • Use " -ForegroundColor White -NoNewline
    Write-Host "-RebuildImage" -ForegroundColor Cyan -NoNewline
    Write-Host " if tools are outdated" -ForegroundColor White
    Write-Host "   • Verify sufficient disk space for Docker operations" -ForegroundColor White
    Write-Host ""
    
    Write-Host "For more information, visit: " -ForegroundColor White -NoNewline
    Write-Host "https://terraform-docs.io/" -ForegroundColor Blue
    Write-Host ""
}

# Function to check if module follows Azure Terraform Module Catalog Criterion
function Test-AzureModuleCriterion {
    param (
        [string]$ModulePath,
        [string]$DockerPath,
        [string]$ImageName
    )
    
    Write-Host "`n🔍 Checking Azure Terraform Module Catalog Criterion compliance..." -ForegroundColor Yellow
    
    # Define comprehensive Azure module requirements
    $azureRequirements = @(
        @{ Name = "Provider Configuration"; File = "required_providers.tf"; Pattern = "required_providers"; Essential = $true },
        @{ Name = "Module Versioning"; File = "versions.tf"; Pattern = "required_version"; Essential = $true },
        @{ Name = "Variable Validation"; File = "variables.tf"; Pattern = "validation"; Essential = $false },
        @{ Name = "Variable Descriptions"; File = "variables.tf"; Pattern = "description"; Essential = $true },
        @{ Name = "Output Descriptions"; File = "outputs.tf"; Pattern = "description"; Essential = $true },
        @{ Name = "Examples Directory"; File = "examples"; IsDirectory = $true; Essential = $true },
        @{ Name = "Test Files"; File = "test"; IsDirectory = $true; Essential = $false },
        @{ Name = "README Documentation"; File = "README.md"; Pattern = "## Usage"; Essential = $true },
        @{ Name = "Architectural Diagram"; File = "diagram"; IsDirectory = $true; Essential = $false },
        @{ Name = "Main Configuration"; File = "main.tf"; Essential = $true },
        @{ Name = "Variable Definitions"; File = "variables.tf"; Essential = $true },
        @{ Name = "Output Definitions"; File = "outputs.tf"; Essential = $true },
        @{ Name = "License File"; File = "LICENSE"; Essential = $false },
        @{ Name = "Contributing Guidelines"; File = "CONTRIBUTING.md"; Essential = $false }
    )
    
    $passCount = 0
    $essentialPassCount = 0
    $totalCount = $azureRequirements.Count
    $essentialCount = ($azureRequirements | Where-Object { $_.Essential }).Count
    
    foreach ($req in $azureRequirements) {
        $status = "✗"
        $color = "Red"
        $passed = $false
        
        Write-Host "  Checking: $($req.Name)..." -ForegroundColor Cyan -NoNewline
        
        if ($req.IsDirectory) {
            # Directory check
            $result = docker run --rm -v "${ModulePath}:${DockerPath}" -w $DockerPath $ImageName sh -c "test -d '$($req.File)' && echo 'exists' || echo 'missing'" 2>$null
            if ($result -eq "exists") {
                $passed = $true
            }
        } else {
            # File check
            $result = docker run --rm -v "${ModulePath}:${DockerPath}" -w $DockerPath $ImageName sh -c "test -f '$($req.File)' && echo 'exists' || echo 'missing'" 2>$null
            
            if ($result -eq "exists") {
                if ($req.Pattern) {
                    # Pattern check within file
                    $patternResult = docker run --rm -v "${ModulePath}:${DockerPath}" -w $DockerPath $ImageName sh -c "grep -q '$($req.Pattern)' '$($req.File)' 2>/dev/null && echo 'found' || echo 'notfound'" 2>$null
                    if ($patternResult -eq "found") {
                        $passed = $true
                    }
                } else {
                    $passed = $true
                }
            }
        }
        
        if ($passed) {
            $status = "✓"
            $color = "Green"
            $passCount++
            if ($req.Essential) { $essentialPassCount++ }
        }
        
        $importance = if ($req.Essential) { " (Essential)" } else { " (Recommended)" }
        Write-Host " $status$importance" -ForegroundColor $color
    }
    
    # Calculate compliance scores
    $overallCompliance = [math]::Round(($passCount / $totalCount) * 100)
    $essentialCompliance = [math]::Round(($essentialPassCount / $essentialCount) * 100)
    
    Write-Host "`n📊 AZURE COMPLIANCE RESULTS:" -ForegroundColor White
    Write-Host "   Overall Compliance: $overallCompliance% ($passCount/$totalCount requirements met)" -ForegroundColor $(if ($overallCompliance -ge 80) { "Green" } elseif ($overallCompliance -ge 60) { "Yellow" } else { "Red" })
    Write-Host "   Essential Compliance: $essentialCompliance% ($essentialPassCount/$essentialCount essential requirements met)" -ForegroundColor $(if ($essentialCompliance -ge 90) { "Green" } elseif ($essentialCompliance -ge 70) { "Yellow" } else { "Red" })
    
    return @{
        OverallScore = $overallCompliance
        EssentialScore = $essentialCompliance
        Status = if ($essentialCompliance -ge 90 -and $overallCompliance -ge 80) { "Excellent" } 
                elseif ($essentialCompliance -ge 70 -and $overallCompliance -ge 60) { "Good" } 
                elseif ($essentialCompliance -ge 50) { "Needs Improvement" } 
                else { "Poor" }
    }
}

# Function to show completion summary
function Show-DockerCompletionSummary {
    param([hashtable]$Results)
    
    Write-Host "`n╔══════════════════════════════════════════════════════════════════════════════╗" -ForegroundColor Blue
    Write-Host "║                          🎯 DOCKER EXECUTION SUMMARY 🎯                     ║" -ForegroundColor Blue
    Write-Host "╚══════════════════════════════════════════════════════════════════════════════╝" -ForegroundColor Blue
    Write-Host ""
    
    Write-Host "📋 CHECKS COMPLETED:" -ForegroundColor Green
      # Terraform Format Check
    if ($null -ne $Results.TerraformFmt) {
        $status = if ($Results.TerraformFmt) { "✓ PASSED" } else { "⚠ ISSUES FOUND" }
        $color = if ($Results.TerraformFmt) { "Green" } else { "Yellow" }
        Write-Host "   • Terraform Format: $status" -ForegroundColor $color
    }
    
    # TfLint Check
    if ($null -ne $Results.TfLint) {
        $status = if ($Results.TfLint) { "✓ PASSED" } else { "⚠ ISSUES FOUND" }
        $color = if ($Results.TfLint) { "Green" } else { "Yellow" }
        Write-Host "   • TfLint Validation: $status" -ForegroundColor $color
    }
    
    # Terraform Docs
    if ($null -ne $Results.TerraformDocs) {
        if ($Results.TerraformDocs) {
            Write-Host "   • Documentation Generation: ✓ COMPLETED" -ForegroundColor Green
        } else {
            Write-Host "   • Documentation Generation: ✗ SKIPPED (Use -GenerateDocumentation to enable)" -ForegroundColor Gray
        }
    }
    
    # Module Structure
    if ($null -ne $Results.ModuleStructure) {
        $status = if ($Results.ModuleStructure) { "✓ VALIDATED" } else { "⚠ ISSUES FOUND" }
        $color = if ($Results.ModuleStructure) { "Green" } else { "Yellow" }
        Write-Host "   • Module Structure: $status" -ForegroundColor $color
    }
    
    # Azure Compliance
    if ($null -ne $Results.AzureCompliance) {
        $compliance = $Results.AzureCompliance
        Write-Host "   • Azure Compliance: $($compliance.Status) ($($compliance.OverallScore)%)" -ForegroundColor $(
            switch ($compliance.Status) {
                "Excellent" { "Green" }
                "Good" { "Yellow" }
                default { "Red" }
            }
        )
    }
    
    Write-Host ""
    Write-Host "🐳 Docker execution completed successfully!" -ForegroundColor Green
    Write-Host "📁 Module Location: $ModulePath" -ForegroundColor Cyan
    Write-Host "🕒 Execution Time: $((Get-Date) - $script:StartTime | Select-Object -ExpandProperty TotalSeconds) seconds" -ForegroundColor Cyan
    Write-Host ""
}

# Initialize timing
$script:StartTime = Get-Date

# Display help if requested
if ($Help) {
    Show-DockerChecksHelp
    exit 0
}

Write-Host ""
Write-Host "🐳 Docker-based Terraform Module Quality Checker" -ForegroundColor Blue
Write-Host "📁 Module: $ModulePath" -ForegroundColor Cyan
Write-Host "🔧 Image: $ImageName" -ForegroundColor Cyan

if ($GenerateDocumentation) {
    Write-Host "📝 Documentation: " -ForegroundColor Cyan -NoNewline
    Write-Host "ENABLED" -ForegroundColor Green
} else {
    Write-Host "📝 Documentation: " -ForegroundColor Cyan -NoNewline
    Write-Host "DISABLED" -ForegroundColor Yellow -NoNewline
    Write-Host " (use -GenerateDocumentation to enable)" -ForegroundColor Gray
}

Write-Host ""

# Check if module directory exists
if (-not (Test-Path $ModulePath)) {
    Write-Host "❌ Error: Module path does not exist: $ModulePath" -ForegroundColor Red
    exit 1
}

# Check if Docker is installed and running
Write-Host "🔍 Checking Docker availability..." -ForegroundColor Yellow
try {
    docker info 2>&1 | Out-Null
    if ($LASTEXITCODE -ne 0) {
        Write-Host "❌ Error: Docker is not running or not configured properly." -ForegroundColor Red
        Write-Host "   Please start Docker Desktop or Docker Engine and try again." -ForegroundColor Red
        exit 1
    }
    Write-Host "✓ Docker is available and running." -ForegroundColor Green
} catch {
    Write-Host "❌ Error: Docker is not installed or not accessible." -ForegroundColor Red
    Write-Host "   Please install Docker Desktop and ensure it's running." -ForegroundColor Red
    exit 1
}

# Check if Dockerfile exists
if (-not (Test-Path $DockerfilePath)) {
    Write-Host "❌ Error: Dockerfile not found at: $DockerfilePath" -ForegroundColor Red
    Write-Host "   Please ensure the Dockerfile is present in the script directory." -ForegroundColor Red
    exit 1
}

# Build or check Docker image
Write-Host "🛠️  Preparing Docker image: $ImageName..." -ForegroundColor Yellow

$imageExists = docker images -q $ImageName 2>$null
if (-not $imageExists -or $RebuildImage) {
    if ($RebuildImage) {
        Write-Host "🔨 Rebuilding Docker image (forced rebuild)..." -ForegroundColor Cyan
    } else {
        Write-Host "🔨 Building Docker image (first time)..." -ForegroundColor Cyan
    }
    
    $buildOutput = docker build -t $ImageName $ScriptDir 2>&1
    if ($LASTEXITCODE -ne 0) {
        Write-Host "❌ Error: Failed to build Docker image." -ForegroundColor Red
        Write-Host $buildOutput -ForegroundColor Red
        exit 1
    }
    Write-Host "✓ Docker image built successfully." -ForegroundColor Green
} else {
    Write-Host "✓ Using existing Docker image." -ForegroundColor Green
}

# Normalize the module path for Docker
$absoluteModulePath = (Resolve-Path $ModulePath).Path
$dockerPath = "/workspace"
Write-Host "📂 Docker volume mapping: $absoluteModulePath => $dockerPath" -ForegroundColor Cyan

# Step 1: Run terraform fmt
Write-Host "`n1️⃣  Running terraform fmt check..." -ForegroundColor Yellow
try {
    $fmtOutput = docker run --rm -v "${absoluteModulePath}:${dockerPath}" -w $dockerPath $ImageName terraform fmt -recursive -check 2>&1
    $fmtStatus = $LASTEXITCODE
    
    if ($fmtStatus -ne 0) {
        Write-Host "⚠️  terraform fmt found formatting issues. Auto-fixing..." -ForegroundColor Yellow
        if ($fmtOutput) {
            Write-Host "Issues found: $fmtOutput" -ForegroundColor Gray
        }
        docker run --rm -v "${absoluteModulePath}:${dockerPath}" -w $dockerPath $ImageName terraform fmt -recursive 2>&1 | Out-Null
        Write-Host "✓ Formatting fixed with terraform fmt." -ForegroundColor Green
        $checkResults.TerraformFmt = $false # Issues were found but fixed
    } else {
        Write-Host "✓ terraform fmt check passed. No formatting issues found." -ForegroundColor Green
        $checkResults.TerraformFmt = $true
    }
} catch {
    Write-Host "❌ Error running terraform fmt: $_" -ForegroundColor Red
    $checkResults.TerraformFmt = $false
}

# Step 2: Run tflint
Write-Host "`n2️⃣  Running tflint validation..." -ForegroundColor Yellow
try {
    $tflintOutput = docker run --rm -v "${absoluteModulePath}:${dockerPath}" -w $dockerPath $ImageName tflint --recursive 2>&1
    $tflintStatus = $LASTEXITCODE
    
    if ($tflintOutput -and $tflintOutput -notmatch "No issues found") {
        Write-Host $tflintOutput -ForegroundColor Gray
    }
    
    if ($tflintStatus -ne 0) {
        Write-Host "⚠️  tflint found issues that should be addressed." -ForegroundColor Yellow
        $checkResults.TfLint = $false
    } else {
        Write-Host "✓ tflint validation passed with no issues." -ForegroundColor Green
        $checkResults.TfLint = $true
    }
} catch {
    Write-Host "❌ Error running tflint: $_" -ForegroundColor Red
    $checkResults.TfLint = $false
}

# Step 3: Run terraform-docs (conditional)
if ($GenerateDocumentation) {
    Write-Host "`n3️⃣  Running terraform-docs generation..." -ForegroundColor Yellow
    try {
        $docsOutput = docker run --rm -v "${absoluteModulePath}:${dockerPath}" -w $dockerPath $ImageName terraform-docs markdown table . 2>&1
        $docsStatus = $LASTEXITCODE
        
        if ($docsStatus -eq 0 -and $docsOutput) {
            # Write output to README_GENERATED.md
            $readmeGeneratedPath = Join-Path $absoluteModulePath "README_GENERATED.md"
            $docsOutput | Out-File -FilePath $readmeGeneratedPath -Encoding utf8
            Write-Host "✓ terraform-docs completed successfully." -ForegroundColor Green
            Write-Host "📄 Documentation generated: README_GENERATED.md" -ForegroundColor Cyan
            $checkResults.TerraformDocs = $true
        } else {
            Write-Host "⚠️  terraform-docs had issues: $docsOutput" -ForegroundColor Yellow
            $checkResults.TerraformDocs = $false
        }
    } catch {
        Write-Host "❌ Error running terraform-docs: $_" -ForegroundColor Red
        $checkResults.TerraformDocs = $false
    }
} else {
    Write-Host "`n3️⃣  terraform-docs generation: " -ForegroundColor Yellow -NoNewline
    Write-Host "SKIPPED" -ForegroundColor Gray -NoNewline
    Write-Host " (use -GenerateDocumentation to enable)" -ForegroundColor Gray
    $checkResults.TerraformDocs = $false
}

# Step 4: Validate module structure (if not skipped)
if (-not $SkipValidation) {
    Write-Host "`n4️⃣  Validating module structure..." -ForegroundColor Yellow
    try {
        $expectedFiles = @("main.tf", "variables.tf", "outputs.tf", "README.md")
        $recommendedFiles = @("required_providers.tf", "versions.tf")
        $recommendedDirs = @("examples", "test")
        
        $structureValid = $true
        
        # Check essential files
        Write-Host "   Checking essential files..." -ForegroundColor Cyan
        foreach ($file in $expectedFiles) {
            $fileExists = docker run --rm -v "${absoluteModulePath}:${dockerPath}" -w $dockerPath $ImageName sh -c "test -f '$file' && echo 'exists' || echo 'missing'" 2>$null
            if ($fileExists -eq "missing") {
                Write-Host "   ⚠️  Essential file '$file' is missing from the module." -ForegroundColor Yellow
                $structureValid = $false
            } else {
                Write-Host "   ✓ Essential file '$file' exists." -ForegroundColor Green
            }
        }
        
        # Check recommended files
        Write-Host "`n   Checking recommended files..." -ForegroundColor Cyan
        foreach ($file in $recommendedFiles) {
            $fileExists = docker run --rm -v "${absoluteModulePath}:${dockerPath}" -w $dockerPath $ImageName sh -c "test -f '$file' && echo 'exists' || echo 'missing'" 2>$null
            if ($fileExists -eq "missing") {
                Write-Host "   ℹ️  Recommended file '$file' is missing from the module." -ForegroundColor Gray
            } else {
                Write-Host "   ✓ Recommended file '$file' exists." -ForegroundColor Green
            }
        }
        
        # Check recommended directories
        Write-Host "`n   Checking recommended directories..." -ForegroundColor Cyan
        foreach ($dir in $recommendedDirs) {
            $dirExists = docker run --rm -v "${absoluteModulePath}:${dockerPath}" -w $dockerPath $ImageName sh -c "test -d '$dir' && echo 'exists' || echo 'missing'" 2>$null
            if ($dirExists -eq "missing") {
                Write-Host "   ℹ️  Recommended directory '$dir/' is missing from the module." -ForegroundColor Gray
            } else {
                Write-Host "   ✓ Recommended directory '$dir/' exists." -ForegroundColor Green
            }
        }
        
        if ($structureValid) {
            Write-Host "`n✓ Module structure validation completed successfully." -ForegroundColor Green
        } else {
            Write-Host "`n⚠️  Module structure validation found issues." -ForegroundColor Yellow
        }
        $checkResults.ModuleStructure = $structureValid
        
    } catch {
        Write-Host "❌ Error validating module structure: $_" -ForegroundColor Red
        $checkResults.ModuleStructure = $false
    }
} else {
    Write-Host "`n4️⃣  Module structure validation: " -ForegroundColor Yellow -NoNewline
    Write-Host "SKIPPED" -ForegroundColor Gray -NoNewline
    Write-Host " (disabled with -SkipValidation)" -ForegroundColor Gray
}

# Step 5: Run Azure Module check if specified
if ($AzureModuleCheck) {
    $complianceResult = Test-AzureModuleCriterion -ModulePath $absoluteModulePath -DockerPath $dockerPath -ImageName $ImageName
    $checkResults.AzureCompliance = $complianceResult
} else {
    Write-Host "`n5️⃣  Azure compliance validation: " -ForegroundColor Yellow -NoNewline
    Write-Host "SKIPPED" -ForegroundColor Gray -NoNewline
    Write-Host " (use -AzureModuleCheck to enable)" -ForegroundColor Gray
}

# Display completion summary
Show-DockerCompletionSummary -Results $checkResults

# Exit with appropriate code
$hasErrors = $checkResults.Values | Where-Object { $_ -eq $false } | Measure-Object | Select-Object -ExpandProperty Count
if ($hasErrors -gt 0) {
    Write-Host "⚠️  Some checks found issues. Please review the output above." -ForegroundColor Yellow
    exit 1
} else {
    Write-Host "🎉 All enabled checks completed successfully!" -ForegroundColor Green
    exit 0
}
