<#
.SYNOPSIS
    Docker-based Terraform module quality checker with comprehensive validation.

.DESCRIPTION
    This script builds a Docker image containing Terraform, tflint, and terraform-docs,
    then runs comprehensive quality checks on Terraform modules in an isolated environment.
    
    The script performs the following operations:
    • 🛠️  Builds or uses existing Docker image with all required tools
    • 📋 Validates Terraform syntax and formatting
    • 🔍 Runs linting checks with tflint
    • 📝 Optionally generates documentation with terraform-docs
    • ✅ Provides comprehensive completion summary

.PARAMETER ModulePath
    Specifies the path to the Terraform module directory to check.
    This parameter is mandatory and must point to a valid directory containing Terraform files.

.PARAMETER RebuildImage
    Forces rebuilding of the Docker image even if it already exists.
    Use this when you want to ensure the latest tools and dependencies are included.

.PARAMETER ImageName
    Specifies the name for the Docker image. Defaults to "terraform-quality-checks".
    Useful for managing multiple versions or custom configurations.

.PARAMETER GenerateDocumentation
    Controls whether terraform-docs should generate README documentation.
    When specified, creates or updates README_GENERATED.md in the module directory.
    When omitted, documentation generation is skipped for faster execution.

.PARAMETER Help
    Displays comprehensive help information including usage examples, features,
    troubleshooting guide, and Docker requirements.

.EXAMPLE
    .\run-checks-with-docker.ps1 -ModulePath "./modules/storage-account"
    
    Runs quality checks on the storage-account module without generating documentation.

.EXAMPLE
    .\run-checks-with-docker.ps1 -ModulePath "./modules/app-service" -GenerateDocumentation
    
    Runs quality checks and generates README documentation for the app-service module.

.EXAMPLE
    .\run-checks-with-docker.ps1 -ModulePath "./modules/network" -RebuildImage -GenerateDocumentation
    
    Rebuilds the Docker image and runs full checks with documentation generation.

.EXAMPLE
    .\run-checks-with-docker.ps1 -Help
    
    Displays comprehensive help information with visual formatting and examples.

.NOTES
    Author: Terraform Quality Assurance Team
    Version: 2.0.0
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
    [switch]$RebuildImage,
    
    [Parameter(Mandatory=$false, ParameterSetName='Run')]
    [ValidatePattern('^[a-zA-Z0-9][a-zA-Z0-9_.-]*$')]
    [string]$ImageName = "terraform-quality-checks",
    
    [Parameter(Mandatory=$false, ParameterSetName='Run')]
    [switch]$GenerateDocumentation,
    
    [Parameter(Mandatory=$false, ParameterSetName='Help')]
    [switch]$Help
)

#region Helper Functions

function Show-DockerChecksHelp {
    <#
    .SYNOPSIS
        Displays comprehensive help for the Docker-based Terraform checks script.
    #>
    
    # Clear screen for better presentation
    Clear-Host
    
    # ASCII Art Header
    Write-Host @"
╔══════════════════════════════════════════════════════════════════════════════╗
║                                                                              ║
║    ████████╗███████╗██████╗ ██████╗  █████╗ ███████╗ ██████╗ ██████╗ ███    ║
║    ╚══██╔══╝██╔════╝██╔══██╗██╔══██╗██╔══██╗██╔════╝██╔═══██╗██╔══██╗████   ║
║       ██║   █████╗  ██████╔╝██████╔╝███████║█████╗  ██║   ██║██████╔╝██╔█   ║
║       ██║   ██╔══╝  ██╔══██╗██╔══██╗██╔══██║██╔══╝  ██║   ██║██╔══██╗██║╚   ║
║       ██║   ███████╗██║  ██║██║  ██║██║  ██║██║     ╚██████╔╝██║  ██║██║    ║
║       ╚═╝   ╚══════╝╚═╝  ╚═╝╚═╝  ╚═╝╚═╝  ╚═╝╚═╝      ╚═════╝ ╚═╝  ╚═╝╚═╝    ║
║                                                                              ║
║                   🐳 DOCKER-BASED QUALITY CHECKS v2.0                       ║
║                                                                              ║
╚══════════════════════════════════════════════════════════════════════════════╝
"@ -ForegroundColor Cyan
    
    Write-Host ""
    Write-Host "🎯 " -ForegroundColor Green -NoNewline
    Write-Host "PURPOSE" -ForegroundColor White -BackgroundColor DarkGreen
    Write-Host "   Comprehensive Terraform module validation using Docker containers for consistent," -ForegroundColor Gray
    Write-Host "   isolated, and reproducible quality checks across different environments." -ForegroundColor Gray
    Write-Host ""
    
    # Quick Start Section
    Write-Host "🚀 " -ForegroundColor Yellow -NoNewline
    Write-Host "QUICK START" -ForegroundColor White -BackgroundColor DarkYellow
    Write-Host "   ┌─ Basic Usage (fastest):" -ForegroundColor Gray
    Write-Host "   │  .\run-checks-with-docker.ps1 -ModulePath `"./modules/storage`"" -ForegroundColor Cyan
    Write-Host "   │" -ForegroundColor Gray
    Write-Host "   ├─ With Documentation:" -ForegroundColor Gray
    Write-Host "   │  .\run-checks-with-docker.ps1 -ModulePath `"./modules/app-service`" -GenerateDocumentation" -ForegroundColor Cyan
    Write-Host "   │" -ForegroundColor Gray
    Write-Host "   └─ Force Rebuild & Full Checks:" -ForegroundColor Gray
    Write-Host "      .\run-checks-with-docker.ps1 -ModulePath `"./modules/network`" -RebuildImage -GenerateDocumentation" -ForegroundColor Cyan
    Write-Host ""
    
    # Parameters Section
    Write-Host "⚙️  " -ForegroundColor Blue -NoNewline
    Write-Host "PARAMETERS" -ForegroundColor White -BackgroundColor DarkBlue
    Write-Host "   -ModulePath           " -ForegroundColor Yellow -NoNewline
    Write-Host "Path to Terraform module (Required)" -ForegroundColor Gray
    Write-Host "   -RebuildImage         " -ForegroundColor Yellow -NoNewline
    Write-Host "Force Docker image rebuild" -ForegroundColor Gray
    Write-Host "   -ImageName            " -ForegroundColor Yellow -NoNewline
    Write-Host "Custom Docker image name" -ForegroundColor Gray
    Write-Host "   -GenerateDocumentation " -ForegroundColor Yellow -NoNewline
    Write-Host "Generate README with terraform-docs" -ForegroundColor Gray
    Write-Host "   -Help                 " -ForegroundColor Yellow -NoNewline
    Write-Host "Show this comprehensive help" -ForegroundColor Gray
    Write-Host ""    # Features Section
    Write-Host "✨ " -ForegroundColor Magenta -NoNewline
    Write-Host "KEY FEATURES" -ForegroundColor White -BackgroundColor DarkMagenta
    Write-Host "   🐳 Containerized Environment  - Consistent tools across platforms" -ForegroundColor Gray
    Write-Host "   🛠️  Automated Tool Management  - Pre-installed terraform, tflint, terraform-docs" -ForegroundColor Gray
    Write-Host "   📋 Syntax Validation          - terraform fmt and validate checks" -ForegroundColor Gray
    Write-Host "   🔍 Advanced Linting           - Comprehensive tflint analysis" -ForegroundColor Gray
    Write-Host "   🔧 Azure Compliance           - Module catalog criterion validation" -ForegroundColor Gray
    Write-Host "   📝 Conditional Documentation  - Optional README generation (controlled by parameter)" -ForegroundColor Gray
    Write-Host "   🧹 Automatic Cleanup          - Temporary files and containers removed" -ForegroundColor Gray
    Write-Host ""
    
    # Docker Requirements
    Write-Host "🐳 " -ForegroundColor Blue -NoNewline
    Write-Host "DOCKER REQUIREMENTS" -ForegroundColor White -BackgroundColor DarkBlue
    Write-Host "   ✅ Docker Desktop installed and running" -ForegroundColor Gray
    Write-Host "   ✅ Minimum 2GB available disk space for images" -ForegroundColor Gray
    Write-Host "   ✅ Network access for base image downloads" -ForegroundColor Gray
    Write-Host "   ✅ Permissions to mount volumes (required for file access)" -ForegroundColor Gray
    Write-Host ""
      # Advanced Usage
    Write-Host "🔧 " -ForegroundColor Red -NoNewline
    Write-Host "ADVANCED USAGE" -ForegroundColor White -BackgroundColor DarkRed
    Write-Host "   Custom Image Name:" -ForegroundColor Gray
    Write-Host "   .\run-checks-with-docker.ps1 -ModulePath `"./modules/app`" -ImageName `"my-tf-tools:v1.0`"" -ForegroundColor Cyan
    Write-Host ""
    Write-Host "   Development Workflow:" -ForegroundColor Gray
    Write-Host "   1. First run: Use -RebuildImage to ensure latest tools" -ForegroundColor DarkGray
    Write-Host "   2. Iterative: Run without -GenerateDocumentation for faster execution" -ForegroundColor DarkGray
    Write-Host "   3. Final: Add -GenerateDocumentation for complete output" -ForegroundColor DarkGray
    Write-Host "   4. Review: Check Azure compliance score and address any issues" -ForegroundColor DarkGray
    Write-Host ""
    
    # Troubleshooting
    Write-Host "🔧 " -ForegroundColor Red -NoNewline
    Write-Host "TROUBLESHOOTING" -ForegroundColor White -BackgroundColor DarkRed
    Write-Host "   Issue: Docker not running" -ForegroundColor Yellow
    Write-Host "   └─ Solution: Start Docker Desktop or Docker service" -ForegroundColor Gray
    Write-Host ""
    Write-Host "   Issue: Permission denied on mounted volumes" -ForegroundColor Yellow
    Write-Host "   └─ Solution: Ensure Docker has access to drive in Docker Desktop settings" -ForegroundColor Gray
    Write-Host ""
    Write-Host "   Issue: Build fails due to network issues" -ForegroundColor Yellow
    Write-Host "   └─ Solution: Check internet connection and proxy settings" -ForegroundColor Gray
    Write-Host ""
    Write-Host "   Issue: Module path not found" -ForegroundColor Yellow
    Write-Host "   └─ Solution: Use absolute paths or verify directory exists" -ForegroundColor Gray
    Write-Host ""
      # Footer
    Write-Host "💡 " -ForegroundColor Green -NoNewline
    Write-Host "PRO TIPS" -ForegroundColor White -BackgroundColor DarkGreen
    Write-Host "   • Use Get-Help .\run-checks-with-docker.ps1 -Full for PowerShell help" -ForegroundColor Gray
    Write-Host "   • Run without -GenerateDocumentation for faster iterative development" -ForegroundColor Gray
    Write-Host "   • terraform-docs generation is OFF by default - enable only when needed" -ForegroundColor Gray
    Write-Host "   • Azure compliance checks run automatically and show percentage score" -ForegroundColor Gray
    Write-Host "   • Keep Docker image updated with periodic -RebuildImage usage" -ForegroundColor Gray
    Write-Host "   • Check Docker logs if container execution fails" -ForegroundColor Gray
    Write-Host ""
    
    Write-Host "═══════════════════════════════════════════════════════════════════════════════" -ForegroundColor DarkGray
    Write-Host "For technical support, consult your DevOps team or Terraform documentation." -ForegroundColor DarkGray
    Write-Host "═══════════════════════════════════════════════════════════════════════════════" -ForegroundColor DarkGray
}

function Show-DockerCompletionSummary {
    param (
        [string]$ModulePath,
        [string]$ImageName,
        [bool]$RebuildImage,
        [bool]$GenerateDocumentation,
        [bool]$Success = $true
    )
    
    Write-Host ""
    Write-Host "╔══════════════════════════════════════════════════════════════════════════════╗" -ForegroundColor Cyan
    Write-Host "║                           🐳 DOCKER CHECKS COMPLETED                         ║" -ForegroundColor Cyan
    Write-Host "╚══════════════════════════════════════════════════════════════════════════════╝" -ForegroundColor Cyan
    Write-Host ""
    
    # Execution Summary
    Write-Host "📊 " -ForegroundColor Blue -NoNewline
    Write-Host "EXECUTION SUMMARY" -ForegroundColor White -BackgroundColor DarkBlue
    Write-Host "   Module Path:              $ModulePath" -ForegroundColor Gray
    Write-Host "   Docker Image:             $ImageName" -ForegroundColor Gray
    Write-Host "   Image Rebuilt:            $(if ($RebuildImage) { '✅ Yes' } else { '⏭️  No (used existing)' })" -ForegroundColor Gray
    Write-Host "   Documentation Generated:  $(if ($GenerateDocumentation) { '✅ Yes (README_GENERATED.md)' } else { '⏭️  No (skipped for speed)' })" -ForegroundColor Gray
    Write-Host "   Overall Status:           $(if ($Success) { '✅ SUCCESS' } else { '❌ FAILED' })" -ForegroundColor $(if ($Success) { 'Green' } else { 'Red' })
    Write-Host ""
    
    if ($Success) {        # What was completed
        Write-Host "✅ " -ForegroundColor Green -NoNewline
        Write-Host "COMPLETED CHECKS" -ForegroundColor White -BackgroundColor DarkGreen
        Write-Host "   🛠️  Docker Environment:     Container built/validated successfully" -ForegroundColor Gray
        Write-Host "   📋 Terraform Formatting:   Code style and syntax validated" -ForegroundColor Gray
        Write-Host "   🔍 Linting Analysis:        Advanced static analysis completed" -ForegroundColor Gray
        Write-Host "   🔧 Azure Compliance:        Module catalog criterion validation" -ForegroundColor Gray
        if ($GenerateDocumentation) {
            Write-Host "   📝 Documentation:           README_GENERATED.md created/updated" -ForegroundColor Gray
        } else {
            Write-Host "   📝 Documentation:           Skipped (use -GenerateDocumentation to enable)" -ForegroundColor DarkGray
        }
        Write-Host ""
        
        # Useful commands
        Write-Host "🛠️  " -ForegroundColor Yellow -NoNewline
        Write-Host "USEFUL COMMANDS" -ForegroundColor White -BackgroundColor DarkYellow
        Write-Host "   View Docker images:       docker images | findstr $ImageName" -ForegroundColor Cyan
        Write-Host "   Clean Docker cache:       docker system prune" -ForegroundColor Cyan
        Write-Host "   Container logs:           docker logs <container-id>" -ForegroundColor Cyan
        if ($GenerateDocumentation) {
            Write-Host "   View generated docs:      Get-Content `"$ModulePath\README_GENERATED.md`"" -ForegroundColor Cyan
        }
        Write-Host ""
          # Next steps
        Write-Host "🎯 " -ForegroundColor Blue -NoNewline
        Write-Host "RECOMMENDED NEXT STEPS" -ForegroundColor White -BackgroundColor DarkBlue
        Write-Host "   1. Review any warnings or issues identified during checks" -ForegroundColor Gray
        Write-Host "   2. Check Azure Terraform Module Catalog compliance score and address gaps" -ForegroundColor Gray
        if (-not $GenerateDocumentation) {
            Write-Host "   3. Run with -GenerateDocumentation to create module documentation" -ForegroundColor Gray
            Write-Host "   4. Commit changes to version control if everything looks good" -ForegroundColor Gray
        } else {
            Write-Host "   3. Commit changes to version control if everything looks good" -ForegroundColor Gray
        }
        Write-Host "   $(if ($GenerateDocumentation) { '4' } else { '5' }). Consider running additional security scans or compliance checks" -ForegroundColor Gray
        Write-Host ""
    } else {
        # Error guidance
        Write-Host "❌ " -ForegroundColor Red -NoNewline
        Write-Host "TROUBLESHOOTING GUIDANCE" -ForegroundColor White -BackgroundColor DarkRed
        Write-Host "   • Check Docker Desktop is running and accessible" -ForegroundColor Gray
        Write-Host "   • Verify the module path contains valid Terraform files" -ForegroundColor Gray
        Write-Host "   • Ensure sufficient disk space for Docker operations" -ForegroundColor Gray
        Write-Host "   • Try running with -RebuildImage to refresh the environment" -ForegroundColor Gray
        Write-Host "   • Check Docker logs for detailed error information" -ForegroundColor Gray
        Write-Host ""
    }
}

#endregion Helper Functions

# Handle Help parameter
if ($Help) {
    Show-DockerChecksHelp
    return
}

# Display script header
Write-Host ""
Write-Host "🐳 " -ForegroundColor Cyan -NoNewline
Write-Host "TERRAFORM DOCKER QUALITY CHECKS" -ForegroundColor White -BackgroundColor DarkCyan
Write-Host "   Starting comprehensive module validation in containerized environment..." -ForegroundColor Gray
Write-Host ""
# Step 1: Validate module directory
Write-Host "📁 " -ForegroundColor Blue -NoNewline
Write-Host "STEP 1: VALIDATING MODULE DIRECTORY" -ForegroundColor White -BackgroundColor DarkBlue
if (-not (Test-Path $ModulePath)) {
    Write-Host "   ❌ Error: Module path does not exist: $ModulePath" -ForegroundColor Red
    Write-Host "   💡 Tip: Ensure the path is correct and the directory exists" -ForegroundColor Yellow
    Show-DockerCompletionSummary -ModulePath $ModulePath -ImageName $ImageName -RebuildImage $RebuildImage -GenerateDocumentation $GenerateDocumentation -Success $false
    exit 1
}
Write-Host "   ✅ Module directory found: $ModulePath" -ForegroundColor Green
Write-Host ""

# Resolve to absolute path
$absoluteModulePath = (Resolve-Path $ModulePath).Path
$scriptDir = $PSScriptRoot

# Step 2: Check Docker availability
Write-Host "🐳 " -ForegroundColor Cyan -NoNewline
Write-Host "STEP 2: CHECKING DOCKER ENVIRONMENT" -ForegroundColor White -BackgroundColor DarkCyan
try {
    docker info 2>&1 | Out-Null
    if ($LASTEXITCODE -ne 0) {
        Write-Host "   ❌ Error: Docker is not running or not configured properly" -ForegroundColor Red
        Write-Host "   💡 Tip: Start Docker Desktop or check Docker service status" -ForegroundColor Yellow
        Show-DockerCompletionSummary -ModulePath $ModulePath -ImageName $ImageName -RebuildImage $RebuildImage -GenerateDocumentation $GenerateDocumentation -Success $false
        exit 1
    }
    
    Write-Host "   ✅ Docker is available and running" -ForegroundColor Green
} catch {
    Write-Host "   ❌ Error: Docker is not installed or not running" -ForegroundColor Red
    Write-Host "   💡 Exception: $_" -ForegroundColor Yellow
    Show-DockerCompletionSummary -ModulePath $ModulePath -ImageName $ImageName -RebuildImage $RebuildImage -GenerateDocumentation $GenerateDocumentation -Success $false
    exit 1
}
Write-Host ""

# Step 3: Build or use Docker image
Write-Host "🛠️  " -ForegroundColor Yellow -NoNewline
Write-Host "STEP 3: DOCKER IMAGE MANAGEMENT" -ForegroundColor White -BackgroundColor DarkYellow
$imageExists = docker images --format "{{.Repository}}" | Where-Object { $_ -eq $ImageName }

if (-not $imageExists -or $RebuildImage) {
    if ($RebuildImage -and $imageExists) {
        Write-Host "   🔄 Rebuilding existing Docker image: $ImageName..." -ForegroundColor Cyan
    } else {
        Write-Host "   🔨 Building new Docker image: $ImageName..." -ForegroundColor Cyan
    }
    
    docker build -t $ImageName -f "$scriptDir/Dockerfile" "$scriptDir"
    if ($LASTEXITCODE -ne 0) {
        Write-Host "   ❌ Error: Failed to build Docker image" -ForegroundColor Red
        Write-Host "   💡 Tip: Check Dockerfile exists and network connectivity" -ForegroundColor Yellow
        Show-DockerCompletionSummary -ModulePath $ModulePath -ImageName $ImageName -RebuildImage $RebuildImage -GenerateDocumentation $GenerateDocumentation -Success $false
        exit 1
    }
    Write-Host "   ✅ Docker image built successfully" -ForegroundColor Green
} else {
    Write-Host "   ✅ Using existing Docker image: $ImageName" -ForegroundColor Green
    Write-Host "   💡 Tip: Use -RebuildImage to ensure latest tools" -ForegroundColor DarkGray
}
Write-Host ""

# Step 4: Execute Docker container with quality checks
Write-Host "🔍 " -ForegroundColor Magenta -NoNewline
Write-Host "STEP 4: EXECUTING TERRAFORM QUALITY CHECKS" -ForegroundColor White -BackgroundColor DarkMagenta
Write-Host "   📁 Target module: $absoluteModulePath" -ForegroundColor Gray

# Create temporary output directory with full permissions
$tempOutputDir = Join-Path ([System.IO.Path]::GetTempPath()) ([System.Guid]::NewGuid().ToString())
New-Item -ItemType Directory -Path $tempOutputDir -Force | Out-Null
Write-Host "   📂 Created temporary output directory: $tempOutputDir" -ForegroundColor DarkGray

# Check if the shell script exists in the module directory
if (-not (Test-Path "$absoluteModulePath/run-terraform-checks.sh")) {
    Write-Host "   📋 Copying shell script to module directory..." -ForegroundColor DarkGray
    Copy-Item "$scriptDir/run-terraform-checks.sh" -Destination "$absoluteModulePath"
}

# Prepare Docker command with conditional documentation generation
$docFlag = if ($GenerateDocumentation) { "true" } else { "false" }
$dockerCmd = "docker run --rm -v `"${absoluteModulePath}:/workspace`" -v `"${tempOutputDir}:/output`" --user root -e GENERATE_DOCS=$docFlag $ImageName /bin/bash -c `"cd /workspace && chmod +x /workspace/run-terraform-checks.sh && /workspace/run-terraform-checks.sh /workspace`""

Write-Host "   🚀 Executing Docker container..." -ForegroundColor Cyan
Write-Host "   📝 Documentation generation: $(if ($GenerateDocumentation) { '✅ Enabled (terraform-docs will run)' } else { '⏭️  Disabled for speed (use -GenerateDocumentation to enable)' })" -ForegroundColor DarkGray
Write-Host "   🔧 Azure compliance checks: Enabled (per Azure Terraform Module Catalog Criterion)" -ForegroundColor DarkGray
Write-Host "   📊 Compliance validation: Full module structure and best practices review" -ForegroundColor DarkGray

# Run the Docker command
Invoke-Expression $dockerCmd
$dockerExitCode = $LASTEXITCODE

Write-Host ""

# Step 5: Handle documentation generation (conditional)
if ($GenerateDocumentation) {
    Write-Host "📝 " -ForegroundColor Green -NoNewline
    Write-Host "STEP 5: PROCESSING GENERATED DOCUMENTATION" -ForegroundColor White -BackgroundColor DarkGreen
    
    # Check if README_GENERATED.md was created in the temp output directory
    $tempReadmePath = Join-Path $tempOutputDir "README_GENERATED.md"
    if (Test-Path $tempReadmePath) {
        Write-Host "   ✅ README_GENERATED.md found in temp directory" -ForegroundColor Green
        Write-Host "   📁 Copying to module directory..." -ForegroundColor DarkGray
        Copy-Item -Path $tempReadmePath -Destination (Join-Path $absoluteModulePath "README_GENERATED.md") -Force
        Write-Host "   ✅ README_GENERATED.md successfully copied to module directory" -ForegroundColor Green
    } else {
        Write-Host "   🔍 README_GENERATED.md not found in temp directory" -ForegroundColor Yellow
        Write-Host "   🔍 Checking if it was created directly in the workspace..." -ForegroundColor DarkGray
        if (Test-Path (Join-Path $absoluteModulePath "README_GENERATED.md")) {
            Write-Host "   ✅ README_GENERATED.md found in workspace directory" -ForegroundColor Green
        } else {
            Write-Host "   ⚠️  Warning: README_GENERATED.md was not created" -ForegroundColor Red
            Write-Host "   💡 Tip: There might be an issue with terraform-docs or module structure" -ForegroundColor Yellow
        }
    }
} else {
    Write-Host "📝 " -ForegroundColor DarkGray -NoNewline
    Write-Host "STEP 5: DOCUMENTATION GENERATION SKIPPED" -ForegroundColor White -BackgroundColor DarkGray
    Write-Host "   ⏭️  Documentation generation disabled for faster execution" -ForegroundColor DarkGray
    Write-Host "   💡 Use -GenerateDocumentation parameter to enable README creation" -ForegroundColor DarkGray
}
Write-Host ""

# Step 6: Cleanup temporary files
Write-Host "🧹 " -ForegroundColor Yellow -NoNewline
Write-Host "STEP 6: CLEANUP OPERATIONS" -ForegroundColor White -BackgroundColor DarkYellow

# Clean up by removing the shell script if we copied it
if (Test-Path "$absoluteModulePath/run-terraform-checks.sh") {
    if ((Get-Item "$absoluteModulePath/run-terraform-checks.sh").CreationTime -gt (Get-Date).AddMinutes(-5)) {
        Write-Host "   🗑️  Removing temporary shell script..." -ForegroundColor DarkGray
        Remove-Item "$absoluteModulePath/run-terraform-checks.sh"
        Write-Host "   ✅ Temporary shell script removed" -ForegroundColor Green
    }
}

# Clean up the temporary output directory
if (Test-Path $tempOutputDir) {
    Write-Host "   🗑️  Cleaning up temporary output directory..." -ForegroundColor DarkGray
    Remove-Item -Path $tempOutputDir -Recurse -Force -ErrorAction SilentlyContinue
    Write-Host "   ✅ Temporary files cleaned up" -ForegroundColor Green
}
Write-Host ""

# Determine success based on Docker exit code
$success = ($dockerExitCode -eq 0)

# Display completion summary
Show-DockerCompletionSummary -ModulePath $ModulePath -ImageName $ImageName -RebuildImage $RebuildImage -GenerateDocumentation $GenerateDocumentation -Success $success

# Exit with appropriate code
if (-not $success) {
    Write-Host "❌ Quality checks failed. Please review the output above for details." -ForegroundColor Red
    exit $dockerExitCode
}

Write-Host "✅ All Docker-based quality checks completed successfully!" -ForegroundColor Green
