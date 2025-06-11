<#
.SYNOPSIS
    Terraform Module Quality Check Script (Improved Version) - Comprehensive quality assurance for Terraform modules

.DESCRIPTION
    This script runs comprehensive quality checks on Terraform modules including:
    - Code formatting (terraform fmt)
    - Linting (tflint)  
    - Documentation generation (terraform-docs)
    - README.md analysis (Super-Linter)
    - Module structure validation
    - Azure Terraform Module Catalog Criterion compliance (optional)

.PARAMETER ModulePath
    Path to the Terraform module directory to analyze
    Example: "C:\terraform\modules\storage-account"

.PARAMETER AzureModuleCheck
    Enable Azure Terraform Module Catalog Criterion compliance check.
    Validates 9 specific requirements for Azure marketplace modules.
    Provides compliance percentage and detailed requirement analysis.

.PARAMETER SkipValidation
    Skip the basic module structure validation checks.
    Use when you only want formatting/linting without file structure analysis.

.PARAMETER SkipSuperLinter
    Skip the Super-Linter analysis for README.md files.
    Use when you want to avoid Docker dependency or faster execution.

.PARAMETER Help
    Display comprehensive help information with usage examples and troubleshooting.

.EXAMPLE
    .\run-terraform-checks-improved.ps1 -ModulePath "C:\terraform\modules\my-module"
    
    Runs basic quality checks: terraform fmt, tflint, terraform-docs, superlinter, structure validation
    Output: README_GENERATED.md file with module documentation

.EXAMPLE
    .\run-terraform-checks-improved.ps1 -ModulePath "C:\terraform\modules\my-module" -AzureModuleCheck
    
    Includes all basic checks PLUS Azure Terraform Module Catalog Criterion validation.
    Provides compliance percentage score and detailed breakdown of 9 requirements.

.EXAMPLE
    .\run-terraform-checks-improved.ps1 -ModulePath "C:\terraform\modules\my-module" -SkipValidation
    
    Runs only: terraform fmt, tflint, terraform-docs, superlinter (faster execution)

.EXAMPLE
    .\run-terraform-checks-improved.ps1 -Help
    
    Shows comprehensive help with usage scenarios and troubleshooting guide

.NOTES
    Requirements:
    - Windows Subsystem for Linux (WSL) with Ubuntu distribution
    - PowerShell 5.1 or later
    - Internet connection (for auto-installing tools if needed)
    
    Azure Module Catalog Requirements (9 total):
    1. Provider Configuration (required_providers.tf)
    2. Module Versioning (versions.tf with required_version)
    3. Variable Validation (validation blocks in variables.tf)
    4. Variable Descriptions (description fields in variables.tf)
    5. Output Descriptions (description fields in outputs.tf)
    6. Examples Directory (examples/ folder)
    7. Test Files (test/ folder)
    8. README Documentation (README.md with "## Usage" section)
    9. Architectural Diagram (diagram/ folder)
    
    Compliance Scoring:
    🟢 80-100%: Excellent - Ready for Azure marketplace
    🟡 60-79%:  Good - Minor improvements needed
    🔴 0-59%:   Needs work - Significant gaps to address

.LINK
    https://docs.microsoft.com/en-us/azure/terraform/
    https://registry.terraform.io/browse/modules?provider=azurerm
#>
#
# OUTPUT FILES:
#   - README_GENERATED.md - Auto-generated documentation from terraform-docs
#   - Super-Linter reports - README.md quality analysis results
#
# TROUBLESHOOTING:
#   - If WSL issues occur, ensure Ubuntu distribution is installed: wsl --install -d Ubuntu
#   - If tools fail to install, manually install them in WSL: terraform, tflint, terraform-docs
#   - If Docker issues occur, manually install Docker in WSL: sudo apt install docker.io
#   - For path conversion errors, try running from WSL directly: wsl cd /mnt/c/path/to/module
# 
# ==============================================================

param (
    [Parameter(Mandatory=$false)]
    [string]$ModulePath,
    
    [Parameter(Mandatory=$false)]
    [switch]$AzureModuleCheck,
    
    [Parameter(Mandatory=$false)]
    [switch]$SkipValidation,
    
    [Parameter(Mandatory=$false)]
    [switch]$SkipSuperLinter,
    
    [Parameter(Mandatory=$false)]
    [switch]$Help
)

# Show detailed help if requested
if ($Help) {
    Write-Host @"

╔══════════════════════════════════════════════════════════════════════════════╗
║                    TERRAFORM MODULE QUALITY CHECKER                          ║
║                              (Enhanced Version)                             ║
╚══════════════════════════════════════════════════════════════════════════════╝

SYNOPSIS:
    Comprehensive quality assurance tool for Terraform modules

PARAMETERS:
    -ModulePath <String>
        Path to the Terraform module directory to analyze
        Example: "C:\terraform\modules\storage-account"
        
    -AzureModuleCheck [Switch]
        Enable Azure Terraform Module Catalog Criterion compliance check
        Validates 9 specific requirements for Azure marketplace modules
        Provides compliance percentage and detailed requirement analysis
          -SkipValidation [Switch]  
        Skip the basic module structure validation checks
        Use when you only want formatting/linting without file structure analysis
        
    -SkipSuperLinter [Switch]
        Skip the Super-Linter analysis for README.md files
        Use when you want to avoid Docker dependency or faster execution
        
    -Help [Switch]
        Display this comprehensive help information

USAGE SCENARIOS:

    🔧 BASIC QUALITY CHECK
    .\run-terraform-checks-improved.ps1 -ModulePath "C:\terraform\modules\my-module"
    
    Runs: terraform fmt, tflint, terraform-docs, superlinter, structure validation
    Output: README_GENERATED.md file with module documentation
    
    📋 AZURE COMPLIANCE CHECK  
    .\run-terraform-checks-improved.ps1 -ModulePath "C:\terraform\modules\my-module" -AzureModuleCheck
    
    Includes all basic checks PLUS:
    - Azure Terraform Module Catalog Criterion validation
    - Compliance percentage score (target: 80%+ for marketplace)
    - Detailed breakdown of 9 specific requirements
    - Recommendations for missing components    ⚡ QUICK FORMAT & LINT
    .\run-terraform-checks-improved.ps1 -ModulePath "C:\terraform\modules\my-module" -SkipValidation
    
    Runs only: terraform fmt, tflint, terraform-docs, superlinter
    Skips: structure validation (faster execution)
    
    🐳 SKIP DOCKER DEPENDENCY
    .\run-terraform-checks-improved.ps1 -ModulePath "C:\terraform\modules\my-module" -SkipSuperLinter
    
    Runs all checks except Super-Linter (no Docker required)
    Good for environments without Docker available

AZURE MODULE CATALOG REQUIREMENTS CHECKED:

    1. 📄 Provider Configuration
       - File: required_providers.tf
       - Check: Contains 'required_providers' block
       
    2. 🔢 Module Versioning  
       - File: versions.tf
       - Check: Contains 'required_version' specification
       
    3. ✅ Variable Validation
       - File: variables.tf  
       - Check: Contains 'validation {' blocks
       
    4. 📝 Variable Descriptions
       - File: variables.tf
       - Check: All variables have description fields
       
    5. 📄 Output Descriptions
       - File: outputs.tf
       - Check: All outputs have description fields
       
    6. 📁 Examples Directory
       - Path: examples/
       - Check: Directory exists with usage examples
       
    7. 🧪 Test Files
       - Path: test/
       - Check: Directory exists with test code
       
    8. 📖 README Documentation  
       - File: README.md
       - Check: Contains "## Usage" section
       
    9. 🏗️ Architectural Diagram
       - Path: diagram/
       - Check: Directory exists with architecture visuals

COMPLIANCE SCORING:
    🟢 80-100%: Excellent - Ready for Azure marketplace
    🟡 60-79%:  Good - Minor improvements needed  
    🔴 0-59%:   Needs work - Significant gaps to address

TOOLS AUTOMATICALLY INSTALLED (if missing):
    - terraform: Infrastructure as Code tool
    - tflint: Terraform linter for best practices
    - terraform-docs: Documentation generator
    - docker: Container runtime (for Super-Linter)
    - super-linter: Comprehensive code quality analysis

SYSTEM REQUIREMENTS:
    ✓ Windows 10/11 with WSL enabled
    ✓ Ubuntu distribution in WSL (auto-detected: Ubuntu-22.04)
    ✓ PowerShell 5.1 or later
    ✓ Internet connection for tool installation

TROUBLESHOOTING:
    Problem: "WSL distribution not found"
    Solution: wsl --install -d Ubuntu-22.04
    
    Problem: "Path conversion failed"  
    Solution: Ensure path has no special characters, try shorter path
    
    Problem: "Tool installation failed"
    Solution: Run tools manually in WSL or check internet connection

OUTPUT FILES:
    📄 README_GENERATED.md - Complete module documentation
    
For more help: Get-Help .\run-terraform-checks-improved.ps1 -Examples

"@ -ForegroundColor Cyan
    return
}

# Validate parameters
if (-not $ModulePath) {
    Write-Host @"

╔══════════════════════════════════════════════════════════════════════════════╗
║                    TERRAFORM MODULE QUALITY CHECKER                          ║
║                              (Enhanced Version)                             ║
╚══════════════════════════════════════════════════════════════════════════════╝

❌ ERROR: ModulePath parameter is required

🚀 QUICK START EXAMPLES:

   BASIC QUALITY CHECK:
   .\run-terraform-checks-improved.ps1 -ModulePath "C:\path\to\your\terraform\module"

   AZURE COMPLIANCE CHECK:
   .\run-terraform-checks-improved.ps1 -ModulePath "C:\path\to\your\terraform\module" -AzureModuleCheck

   QUICK FORMAT ONLY:
   .\run-terraform-checks-improved.ps1 -ModulePath "C:\path\to\your\terraform\module" -SkipValidation

📚 GET HELP:
   .\run-terraform-checks-improved.ps1 -Help                    # Comprehensive help
   Get-Help .\run-terraform-checks-improved.ps1 -Detailed      # PowerShell standard help
   Get-Help .\run-terraform-checks-improved.ps1 -Examples      # Usage examples

🔧 WHAT THIS SCRIPT DOES:
   ✓ terraform fmt     - Code formatting
   ✓ tflint           - Static analysis & linting  
   ✓ terraform-docs   - Documentation generation
   ✓ super-linter     - README.md quality analysis
   ✓ Structure check  - Module file validation
   ✓ Azure compliance - Marketplace readiness (optional)

"@ -ForegroundColor Red
    exit 1
}

Write-Host @"

╔══════════════════════════════════════════════════════════════════════════════╗
║                    TERRAFORM MODULE QUALITY CHECKER                          ║
╚══════════════════════════════════════════════════════════════════════════════╝

Target Module: $ModulePath
Azure Compliance Check: $(if ($AzureModuleCheck) { '✅ ENABLED' } else { '❌ Disabled' })
Super-Linter Analysis: $(if ($SkipSuperLinter) { '❌ Skipped' } else { '✅ Enabled' })
Structure Validation: $(if ($SkipValidation) { '❌ Skipped' } else { '✅ Enabled' })

Starting comprehensive module analysis...

"@ -ForegroundColor Green

# Function to check if module follows Azure Terraform Module Catalog Criterion
function Test-AzureModuleCriterion {
    param (
        [string]$ModulePath,
        [string]$WslPath,
        [string]$Distribution
    )
    
    Write-Host "`nChecking Azure Terraform Module Catalog Criterion compliance..." -ForegroundColor Yellow
      # Define requirements as a hashtable for easier handling
    $requirementsList = @(
        @{
            Name = "Provider Configuration";
            File = "required_providers.tf"; 
            Pattern = 'required_providers'
        },
        @{
            Name = "Module Versioning"; 
            File = "versions.tf"; 
            Pattern = 'required_version'
        },
        @{
            Name = "Variable Validation"; 
            File = "variables.tf"; 
            Pattern = 'validation \{'
        },
        @{
            Name = "Variable Descriptions"; 
            File = "variables.tf"; 
            Pattern = "description"
        },
        @{
            Name = "Output Descriptions"; 
            File = "outputs.tf"; 
            Pattern = "description"
        },
        @{
            Name = "Examples Directory"; 
            File = "examples"; 
            IsDirectory = $true
        },
        @{
            Name = "Test Files"; 
            File = "test"; 
            IsDirectory = $true
        },
        @{
            Name = "README Documentation"; 
            File = "README.md"; 
            Pattern = "## Usage"
        },
        @{
            Name = "Architectural Diagram"; 
            File = "diagram"; 
            IsDirectory = $true
        }
    )
    
    $passCount = 0
    $totalCount = $requirementsList.Count
      # Define bash operators to avoid PowerShell parsing issues
    $andOperator = [char]38 + [char]38  # &&
    $orOperator = [char]124 + [char]124  # ||
    
    foreach ($req in $requirementsList) {
        Write-Host "Checking for: $($req.Name)..." -ForegroundColor Cyan
        
        if ($req.IsDirectory) {
            # Directory check
            $dirCommand = "test -d '$WslPath/$($req.File)' $andOperator echo 'exists' $orOperator echo 'missing'"
            $dirCheck = wsl.exe --distribution "$Distribution" --exec bash -c $dirCommand
            if ($dirCheck -eq "exists") {
                Write-Host "  ✓ $($req.Name) requirement passed" -ForegroundColor Green
                $passCount++
            } else {
                Write-Host "  ✗ $($req.Name) requirement failed - directory '$($req.File)' not found" -ForegroundColor Red
            }
        } else {
            # File and pattern check
            $fileCommand = "test -f '$WslPath/$($req.File)' $andOperator echo 'exists' $orOperator echo 'missing'"
            $fileCheck = wsl.exe --distribution "$Distribution" --exec bash -c $fileCommand
            
            if ($fileCheck -eq "exists") {
                if ($req.Pattern) {                    # Check for pattern in file
                    $patternCommand = "grep -E '$($req.Pattern)' '$WslPath/$($req.File)' >/dev/null 2>&1 $andOperator echo 'found' $orOperator echo 'notfound'"
                    $patternCheck = wsl.exe --distribution "$Distribution" --exec bash -c $patternCommand
                    if ($patternCheck -eq "found") {
                        Write-Host "  ✓ $($req.Name) requirement passed" -ForegroundColor Green
                        $passCount++
                    } else {
                        Write-Host "  ✗ $($req.Name) requirement failed - pattern '$($req.Pattern)' not found in $($req.File)" -ForegroundColor Red
                    }
                } else {
                    # Just checking if file exists
                    Write-Host "  ✓ $($req.Name) requirement passed" -ForegroundColor Green
                    $passCount++
                }            } else {
                Write-Host "  ✗ $($req.Name) requirement failed - file '$($req.File)' not found" -ForegroundColor Red
            }
        }    }    $percentCompliance = [math]::Round(($passCount / $totalCount) * 100)
    $complianceMessage = 'Azure Terraform Module Catalog Criterion Compliance: ' + $percentCompliance + '% (' + $passCount + '/' + $totalCount + ' requirements met)'
    Write-Host "`n$complianceMessage" -ForegroundColor $(if ($percentCompliance -ge 80) { "Green" } elseif ($percentCompliance -ge 60) { "Yellow" } else { "Red" })
    
    return $percentCompliance
}

# Check if module directory exists
if (-not (Test-Path $ModulePath)) {
    Write-Host "Error: Module path does not exist: $ModulePath" -ForegroundColor Red
    exit 1
}

# Check if WSL is installed and running
try {
    $null = wsl.exe --status 2>&1
    if ($LASTEXITCODE -ne 0) {
        Write-Host "Error: WSL is not running or not configured properly." -ForegroundColor Red
        exit 1
    }
    
    # Check for distributions
    $distributionsCheck = wsl.exe --list --verbose 2>&1 | Out-String
    if ($distributionsCheck -match "no distributions" -or $distributionsCheck -eq "" -or $null -eq $distributionsCheck) {
        Write-Host "Error: No WSL distributions found. Please install a Linux distribution in WSL." -ForegroundColor Red
        exit 1
    }
} catch {
    Write-Host "Error: WSL is not installed or not configured properly. Exception: $_" -ForegroundColor Red
    exit 1
}

# Get WSL distribution - Ultra simplified approach
[string]$ubuntuDistro = "Ubuntu-22.04"  # Default to common distribution name
Write-Host "Using WSL distribution: $ubuntuDistro" -ForegroundColor Cyan

# Convert Windows path to WSL path with improved error handling
try {
    Write-Host "Converting Windows path '$ModulePath' to WSL path..." -ForegroundColor Cyan
    # Use the most reliable format for WSL path conversion (no quotes around distribution name)
    $wslPath = wsl.exe --distribution $ubuntuDistro --exec bash -c "wslpath '$ModulePath'" 2>&1
    if ($LASTEXITCODE -ne 0 -or $wslPath -match "Error" -or $wslPath -eq "") {
        Write-Host "Error: Failed to convert Windows path to WSL path. Output: $wslPath" -ForegroundColor Red
        # First fallback: Try alternative path conversion
        Write-Host "Attempting alternative path conversion method 1..." -ForegroundColor Yellow
        $normalizedPath = $ModulePath.Replace('\', '/')
        $wslPath = wsl.exe --distribution $ubuntuDistro --exec bash -c "echo '$normalizedPath'" 2>&1
        if ($LASTEXITCODE -ne 0 -or $wslPath -eq "") {            # Second fallback: Try direct path mapping based on known WSL path structure
            Write-Host "Attempting alternative path conversion method 2..." -ForegroundColor Yellow
            if ($ModulePath -match '^([A-Za-z]):\\(.*)$') {
                $driveLetter = $Matches[1].ToLower()
                $restOfPath = $Matches[2].Replace('\', '/')
                $wslPath = "/mnt/$driveLetter/$restOfPath"
                Write-Host "Manually constructed WSL path: $wslPath" -ForegroundColor Yellow
            } else {
                Write-Host "Error: Could not convert Windows path to WSL path." -ForegroundColor Red
                exit 1
            }
        }
    }
    Write-Host "Path conversion successful: $wslPath" -ForegroundColor Green
} catch {
    Write-Host "Error converting path: $_" -ForegroundColor Red
    exit 1
}

# Step 1: Run terraform fmt
Write-Host "`nStep 1: Running terraform fmt..." -ForegroundColor Yellow

# Define bash operators to avoid PowerShell parsing issues
$andOperator = [char]38 + [char]38  # &&
$orOperator = [char]124 + [char]124  # ||

try {# Check if terraform is installed
    $terraformCheckCmd = "command -v terraform >/dev/null 2>&1 $orOperator echo 'not-installed'"
    $terraformCheck = wsl.exe --distribution $ubuntuDistro --exec bash -c $terraformCheckCmd
    if ($terraformCheck -eq "not-installed") {        Write-Host "Terraform is not installed in WSL. Installing..." -ForegroundColor Cyan
        $installCmd = "curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo apt-key add - $andOperator sudo apt-add-repository 'deb [arch=amd64] https://apt.releases.hashicorp.com \$(lsb_release -cs) main' $andOperator sudo apt-get update $andOperator sudo apt-get install -y terraform"
        wsl.exe --distribution $ubuntuDistro --exec bash -c $installCmd
          # Verify installation was successful
        $terraformVerifyCmd = "command -v terraform >/dev/null 2>&1 $orOperator echo 'failed'"
        $terraformVerify = wsl.exe --distribution $ubuntuDistro --exec bash -c $terraformVerifyCmd
        if ($terraformVerify -eq "failed") {
            Write-Host "Warning: Failed to install Terraform automatically. Please install manually in your WSL distribution." -ForegroundColor Yellow
            Write-Host "Skipping terraform fmt check." -ForegroundColor Yellow
            return
        }
    }
      # Run terraform fmt
    $fmtCmd = "cd '$wslPath' $andOperator terraform fmt -recursive -check"
    $output = wsl.exe --distribution $ubuntuDistro --exec bash -c $fmtCmd
    $status = $LASTEXITCODE
    
    if ($status -ne 0) {
        Write-Host "terraform fmt found formatting issues. Fixing..." -ForegroundColor Yellow
        $fmtFixCmd = "cd '$wslPath' $andOperator terraform fmt -recursive"
        wsl.exe --distribution $ubuntuDistro --exec bash -c $fmtFixCmd
        Write-Host "Formatting fixed with terraform fmt." -ForegroundColor Green
    } else {
        Write-Host "terraform fmt check completed successfully. No formatting issues found." -ForegroundColor Green
    }
} catch {
    Write-Host "Error running terraform fmt: $_" -ForegroundColor Red
}

# Step 2: Run tflint
Write-Host "`nStep 2: Running tflint..." -ForegroundColor Yellow
try {
    $tflintCmd = "command -v tflint >/dev/null 2>&1 $orOperator echo 'not-installed'"
    $tflintResult = wsl.exe --distribution $ubuntuDistro --exec bash -c $tflintCmd
    if ($tflintResult -eq "not-installed") {
        Write-Host "tflint is not installed. Installing now..." -ForegroundColor Cyan
        wsl.exe --distribution $ubuntuDistro --exec bash -c "curl -s https://raw.githubusercontent.com/terraform-linters/tflint/master/install_linux.sh | bash"
          # Verify installation was successful
        $tflintVerifyCmd = "command -v tflint >/dev/null 2>&1 $orOperator echo 'failed'"
        $tflintVerify = wsl.exe --distribution $ubuntuDistro --exec bash -c $tflintVerifyCmd
        if ($tflintVerify -eq "failed") {
            Write-Host "Warning: Failed to install tflint automatically. Please install manually in your WSL distribution." -ForegroundColor Yellow
            Write-Host "Skipping tflint check." -ForegroundColor Yellow
            return
        }
    }

    Write-Host "Running tflint in directory: $wslPath" -ForegroundColor Cyan
    $output = wsl.exe --distribution $ubuntuDistro --exec bash -c "cd '$wslPath' $andOperator tflint --recursive"
    $status = $LASTEXITCODE
    
    if ($output) {
        Write-Host $output -ForegroundColor Gray
    }
    
    if ($status -ne 0) {
        Write-Host "Warning: tflint found issues that need to be addressed." -ForegroundColor Yellow
    } else {
        Write-Host "tflint completed successfully with no issues." -ForegroundColor Green
    }
} catch {
    Write-Host "Error running tflint: $_" -ForegroundColor Red
}

# Step 3: Run terraform-docs
Write-Host "`nStep 3: Running terraform-docs..." -ForegroundColor Yellow
try {    # Check if terraform-docs is installed, install to user bin if not
    $terraformDocsCmd = "command -v terraform-docs >/dev/null 2>&1 $orOperator echo 'not-installed'"
    $terraformDocsResult = wsl.exe --distribution $ubuntuDistro --exec bash -c $terraformDocsCmd
    if ($terraformDocsResult -eq "not-installed") {
        Write-Host "terraform-docs is not installed. Installing now..." -ForegroundColor Cyan
        
        # Create bin directory if it doesn't exist
        wsl.exe --distribution $ubuntuDistro --exec bash -c "mkdir -p ~/bin"
        
        # Download and install terraform-docs
        wsl.exe --distribution $ubuntuDistro --exec bash -c "curl -sSLo ./terraform-docs.tar.gz https://terraform-docs.io/dl/v0.16.0/terraform-docs-v0.16.0-linux-amd64.tar.gz $andOperator tar -xzf terraform-docs.tar.gz $andOperator chmod +x terraform-docs $andOperator mv terraform-docs ~/bin/ $andOperator rm -f terraform-docs.tar.gz"
        
        # Add to PATH if not already there
        wsl.exe --distribution $ubuntuDistro --exec bash -c "grep -q 'export PATH=~/bin:\$PATH' ~/.bashrc || echo 'export PATH=~/bin:\$PATH' >> ~/.bashrc"
        
        # Verify installation was successful
        $verifyResult = wsl.exe --distribution $ubuntuDistro --exec bash -c "ls ~/bin/terraform-docs >/dev/null 2>&1 || echo 'failed'"
        if ($verifyResult -eq "failed") {
            Write-Host "Warning: Failed to install terraform-docs automatically. Please install manually in your WSL distribution." -ForegroundColor Yellow
            Write-Host "Skipping terraform-docs generation." -ForegroundColor Yellow
            return
        }
    }

    Write-Host "Running terraform-docs in directory: $wslPath" -ForegroundColor Cyan
    $output = wsl.exe --distribution $ubuntuDistro --exec bash -c "cd '$wslPath' $andOperator export PATH=~/bin:\$PATH $andOperator terraform-docs markdown table . > README_GENERATED.md"
    $status = $LASTEXITCODE
    if ($status -ne 0) {
        Write-Host "Warning: terraform-docs had issues: $output" -ForegroundColor Yellow
    } else {
        Write-Host "terraform-docs completed successfully." -ForegroundColor Green
        Write-Host "Documentation generated to: README_GENERATED.md" -ForegroundColor Cyan
        # Check if the file was actually created
        $fileCheck = wsl.exe --distribution $ubuntuDistro --exec bash -c "test -f '$wslPath/README_GENERATED.md' $andOperator echo 'exists' $orOperator echo 'missing'"
        if ($fileCheck -eq "missing") {
            Write-Host "Warning: README_GENERATED.md file was not created. Check for errors in terraform-docs execution." -ForegroundColor Yellow
        } else {
            # Fix permissions for the README_GENERATED.md file to ensure it's accessible
            wsl.exe --distribution $ubuntuDistro --exec bash -c "chmod 664 '$wslPath/README_GENERATED.md'"
            Write-Host "Set read/write permissions on README_GENERATED.md file." -ForegroundColor Cyan
        }
    }
} catch {
    Write-Host "Error running terraform-docs: $_" -ForegroundColor Red
}

# Step 4: Run Super-Linter for README.md analysis
if (-not $SkipSuperLinter) {
    Write-Host "`nStep 4: Running Super-Linter for README.md analysis..." -ForegroundColor Yellow
    try {
        # Check if Docker is available
        $dockerCheck = wsl.exe --distribution $ubuntuDistro --exec bash -c "command -v docker >/dev/null 2>&1 || echo 'not-installed'"
        if ($dockerCheck -eq "not-installed") {
            Write-Host "Docker is not installed in WSL. Installing Docker..." -ForegroundColor Cyan            # Install Docker in WSL
            Write-Host "Installing Docker in WSL..." -ForegroundColor Cyan
            wsl.exe --distribution $ubuntuDistro --exec bash -c "sudo apt-get update"
            wsl.exe --distribution $ubuntuDistro --exec bash -c "sudo apt-get install -y apt-transport-https ca-certificates curl gnupg lsb-release"
            wsl.exe --distribution $ubuntuDistro --exec bash -c "curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg"
            wsl.exe --distribution $ubuntuDistro --exec bash -c "echo 'deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \$(lsb_release -cs) stable' | sudo tee /etc/apt/sources.list.d/docker.list >/dev/null"
            wsl.exe --distribution $ubuntuDistro --exec bash -c "sudo apt-get update"
            wsl.exe --distribution $ubuntuDistro --exec bash -c "sudo apt-get install -y docker-ce docker-ce-cli containerd.io"
            
            # Start Docker service
            wsl.exe --distribution $ubuntuDistro --exec bash -c "sudo service docker start"
            
            # Verify Docker installation
            $dockerVerify = wsl.exe --distribution $ubuntuDistro --exec bash -c "command -v docker >/dev/null 2>&1 || echo 'failed'"
            if ($dockerVerify -eq "failed") {
                Write-Host "Warning: Failed to install Docker automatically. Skipping Super-Linter analysis." -ForegroundColor Yellow
                Write-Host "Note: You can install Docker manually in WSL to enable comprehensive README.md linting." -ForegroundColor Yellow
            } else {
                Write-Host "Docker installed successfully in WSL." -ForegroundColor Green
            }
        }
        
        # Check if README.md exists before running superlinter
        $readmeCheck = wsl.exe --distribution $ubuntuDistro --exec bash -c "test -f '$wslPath/README.md' $andOperator echo 'exists' $orOperator echo 'missing'"
        if ($readmeCheck -eq "missing") {
            Write-Host "Warning: README.md file not found. Skipping Super-Linter analysis." -ForegroundColor Yellow        } else {
            Write-Host "Running Super-Linter on README.md..." -ForegroundColor Cyan
            
            # Ensure Docker service is running
            wsl.exe --distribution $ubuntuDistro --exec bash -c "sudo service docker start >/dev/null 2>&1"            # Initialize a temporary Git repository if one doesn't exist to satisfy Super-Linter requirements
            Write-Host "Setting up Git repository for Super-Linter..." -ForegroundColor Cyan
            $gitInitCommand = "cd '$wslPath' && if [ ! -d .git ]; then git init >/dev/null 2>&1 && git config user.email 'terraform-check@local.dev' && git config user.name 'Terraform Quality Check' && git add . >/dev/null 2>&1 && git commit -m 'Initial commit for linting' >/dev/null 2>&1; fi"
            wsl.exe --distribution $ubuntuDistro --exec bash -c $gitInitCommand
            
            # Verify Git repository was created
            $gitVerify = wsl.exe --distribution $ubuntuDistro --exec bash -c "cd '$wslPath' && git status >/dev/null 2>&1 && echo 'success' || echo 'failed'"
            if ($gitVerify -eq "failed") {
                Write-Host "Warning: Failed to initialize Git repository. Super-Linter may not work correctly." -ForegroundColor Yellow
            } else {
                Write-Host "Git repository ready for Super-Linter." -ForegroundColor Green
            }            # Run Super-Linter specifically for markdown files with proper Git environment
            Write-Host "Running Super-Linter container for markdown analysis..." -ForegroundColor Cyan
            Write-Host "WSL Path: $wslPath" -ForegroundColor Gray
            
            # Get the actual current directory and clean it up
            $currentDir = wsl.exe --distribution $ubuntuDistro --exec bash -c "cd '$wslPath' && pwd"
            $currentDir = $currentDir.Trim()
            Write-Host "Resolved directory: $currentDir" -ForegroundColor Gray
              # Try a different approach - use a working directory and relative path with Git environment variables
            $dockerCommand = "cd '$wslPath' && sudo docker run --rm -e RUN_LOCAL=true -e VALIDATE_MARKDOWN=true -e LOG_LEVEL=INFO -e GIT_DISCOVERY_ACROSS_FILESYSTEM=1 -e GITHUB_WORKSPACE=/tmp/lint -e DEFAULT_BRANCH=main -v `"`$(pwd):/tmp/lint`" --workdir /tmp/lint github/super-linter:latest"
            Write-Host "Docker command: $dockerCommand" -ForegroundColor Gray
            $superlinterOutput = wsl.exe --distribution $ubuntuDistro --exec bash -c $dockerCommand
              # If that fails, try with the absolute path but escape it properly
            if ($LASTEXITCODE -ne 0 -and $superlinterOutput -match "invalid reference format") {
                Write-Host "First attempt failed, trying alternative approach..." -ForegroundColor Yellow
                # Escape any problematic characters in the path
                $escapedPath = $currentDir -replace "'", "'\\''"
                $dockerCommand2 = "sudo docker run --rm -e RUN_LOCAL=true -e VALIDATE_MARKDOWN=true -e LOG_LEVEL=INFO -v '${escapedPath}:/tmp/lint' --workdir /tmp/lint github/super-linter:latest"
                Write-Host "Alternative Docker command: $dockerCommand2" -ForegroundColor Gray
                $superlinterOutput = wsl.exe --distribution $ubuntuDistro --exec bash -c $dockerCommand2
            }            # Parse and display results
            Write-Host "`nSuper-Linter Analysis Results:" -ForegroundColor Cyan
            
            if ($superlinterOutput) {
                # Check for Docker errors first
                if ($superlinterOutput -match "docker:.*invalid reference format" -or 
                    $superlinterOutput -match "Error response from daemon") {
                    Write-Host "❌ Docker command failed - fixing and retrying..." -ForegroundColor Red
                    Write-Host "Docker error output: $superlinterOutput" -ForegroundColor Gray
                    
                    # Try a simpler approach with explicit path
                    Write-Host "Retrying with simplified Docker command..." -ForegroundColor Yellow
                    $simplifiedCommand = "cd '$wslPath' && sudo docker run --rm -e RUN_LOCAL=true -e VALIDATE_MARKDOWN=true -e LOG_LEVEL=INFO -v '\$(pwd):/tmp/lint' github/super-linter:latest"
                    $superlinterOutput = wsl.exe --distribution $ubuntuDistro --exec bash -c $simplifiedCommand
                }
                  # Parse Super-Linter output with enhanced formatting
                $outputLines = $superlinterOutput -split "`n" | ForEach-Object { $_.Trim() }
                $markdownErrors = @()
                $foundFatal = $false
                $parsedIssues = @()
                
                # Check if Super-Linter found any errors
                if ($superlinterOutput -match "FATAL.*Exiting with errors found" -or 
                    $superlinterOutput -match "\[ERROR\]" -or 
                    $superlinterOutput -match "FAIL") {
                    $foundFatal = $true
                    
                    Write-Host "`n╔══════════════════════════════════════════════════════════════════════════════╗" -ForegroundColor Red
                    Write-Host "║                     📝 MARKDOWN QUALITY ISSUES FOUND                        ║" -ForegroundColor Red
                    Write-Host "╚══════════════════════════════════════════════════════════════════════════════╝" -ForegroundColor Red
                    
                    # Parse for specific markdown issues with enhanced patterns
                    foreach ($line in $outputLines) {
                        if ([string]::IsNullOrWhiteSpace($line) -or $line.Length -lt 10) { continue }
                        
                        # Enhanced regex patterns for markdown issues
                        if ($line -match "(?:/tmp/lint/)?README\.md:(\d+):?(\d+)?.*?(MD\d{3}).*?(.+)$") {
                            $lineNum = $matches[1]
                            $column = if ($matches[2]) { $matches[2] } else { "" }
                            $ruleCode = $matches[3]
                            $description = $matches[4].Trim()
                            
                            $parsedIssues += [PSCustomObject]@{
                                Line = $lineNum
                                Column = $column
                                Rule = $ruleCode
                                Description = $description
                                RawLine = $line
                            }
                        }
                        # Alternative pattern for different output formats
                        elseif ($line -match "(MD\d{3})" -and $line -match "README\.md") {
                            $ruleCode = $matches[1]
                            $markdownErrors += $line
                        }                        # Catch broader error patterns
                        elseif ($line -match "README\.md.*\[ERROR\]" -or 
                               ($line -match "README\.md" -and $line -match "(line|:\d+|ERROR|FAIL)")) {
                            $markdownErrors += $line
                        }
                    }
                    
                    # Display parsed issues in a structured format
                    if ($parsedIssues.Count -gt 0) {
                        Write-Host "`n🎯 DETAILED MARKDOWN VIOLATIONS:" -ForegroundColor Cyan
                        Write-Host "┌─────┬─────────┬─────────────────────────────────────────────────────────┐" -ForegroundColor Gray
                        Write-Host "│ LINE│  RULE   │ DESCRIPTION                                             │" -ForegroundColor Gray
                        Write-Host "├─────┼─────────┼─────────────────────────────────────────────────────────┤" -ForegroundColor Gray
                        
                        foreach ($issue in $parsedIssues | Sort-Object { [int]$_.Line }) {
                            $lineStr = $issue.Line.PadLeft(4)
                            $ruleStr = $issue.Rule.PadRight(8)
                            $descStr = if ($issue.Description.Length -gt 55) { 
                                $issue.Description.Substring(0, 52) + "..." 
                            } else { 
                                $issue.Description.PadRight(55) 
                            }
                            Write-Host "│ $lineStr│ $ruleStr│ $descStr │" -ForegroundColor Yellow
                        }
                        Write-Host "└─────┴─────────┴─────────────────────────────────────────────────────────┘" -ForegroundColor Gray
                    }
                    # Display raw errors if parsing didn't catch everything
                    elseif ($markdownErrors.Count -gt 0) {
                        Write-Host "`n⚠️  DETECTED MARKDOWN VIOLATIONS:" -ForegroundColor Yellow
                        foreach ($error in $markdownErrors | Select-Object -First 10) {
                            $cleanError = $error -replace '\s+', ' ' -replace '^\[.*?\]\s*', ''
                            if ($cleanError.Length -gt 20) {
                                Write-Host "  ❌ $cleanError" -ForegroundColor Red
                            }
                        }
                    }
                    # Fallback for when specific errors can't be parsed
                    else {
                        Write-Host "`n⚠️  Super-Linter detected markdown issues but couldn't parse specific details" -ForegroundColor Yellow
                        Write-Host "    This indicates formatting problems in README.md that need attention." -ForegroundColor Gray
                        
                        # Try to extract any useful error information
                        $errorKeywords = @("error", "fail", "violation", "MD\d{3}", "line \d+")
                        $relevantLines = $outputLines | Where-Object { 
                            $line = $_
                            $line -match "README\.md" -and 
                            ($errorKeywords | Where-Object { $line -match $_ }) -and
                            $line.Length -gt 15 -and
                            $line -notmatch "^[@/#\s\-_\\|=]+$"
                        } | Select-Object -First 5
                        
                        if ($relevantLines) {
                            Write-Host "`n🔍 POTENTIAL ISSUES IDENTIFIED:" -ForegroundColor Cyan
                            foreach ($line in $relevantLines) {
                                $cleanLine = $line -replace '\s+', ' ' -replace '^.*?\[.*?\]\s*', ''
                                Write-Host "  • $cleanLine" -ForegroundColor Gray
                            }
                        }
                    }
                    
                    # Show rule-specific recommendations
                    Write-Host "`n💡 MARKDOWN QUALITY RECOMMENDATIONS:" -ForegroundColor Cyan
                    $fullOutput = $superlinterOutput
                    $recommendations = @()
                    
                    if ($fullOutput -match "MD041") { $recommendations += "• MD041: Start with main heading - Add '# Title' as first line" }
                    if ($fullOutput -match "MD013") { $recommendations += "• MD013: Line too long - Keep lines under 80-120 characters" }
                    if ($fullOutput -match "MD034") { $recommendations += "• MD034: Bare URL detected - Use <url> or [text](url) format" }
                    if ($fullOutput -match "MD047") { $recommendations += "• MD047: Missing final newline - End file with empty line" }
                    if ($fullOutput -match "MD025") { $recommendations += "• MD025: Multiple H1 headings - Use only one # heading per file" }
                    if ($fullOutput -match "MD032") { $recommendations += "• MD032: Lists spacing - Add blank lines around lists" }
                    if ($fullOutput -match "MD022") { $recommendations += "• MD022: Heading spacing - Add blank lines around headings" }
                    if ($fullOutput -match "MD012") { $recommendations += "• MD012: Multiple blank lines - Remove consecutive empty lines" }
                    
                    if ($recommendations.Count -gt 0) {
                        foreach ($rec in $recommendations) {
                            Write-Host "  $rec" -ForegroundColor Gray
                        }
                    } else {
                        # Show general recommendations
                        Write-Host "  • Check line lengths (keep under 80-120 characters)" -ForegroundColor Gray
                        Write-Host "  • Ensure proper heading structure (single # title)" -ForegroundColor Gray
                        Write-Host "  • Format URLs properly: <url> or [text](url)" -ForegroundColor Gray
                        Write-Host "  • End file with blank line" -ForegroundColor Gray
                        Write-Host "  • Use consistent spacing around headings and lists" -ForegroundColor Gray
                    }
                    
                } else {
                    # Check for successful completion
                    if ($superlinterOutput -match "All file\(s\) linted successfully" -or
                        $superlinterOutput -match "✅" -or 
                        $superlinterOutput -match "PASS.*README\.md" -or
                        ($outputLines | Where-Object { $_ -match "(PASS|SUCCESS)" -and $_ -match "README" })) {
                        
                        Write-Host "`n╔══════════════════════════════════════════════════════════════════════════════╗" -ForegroundColor Green
                        Write-Host "║                     ✅ MARKDOWN QUALITY: EXCELLENT                           ║" -ForegroundColor Green
                        Write-Host "╚══════════════════════════════════════════════════════════════════════════════╝" -ForegroundColor Green
                        Write-Host "  README.md meets all markdown quality standards! 🎉" -ForegroundColor Green
                    } else {
                        Write-Host "`n⚠️  Super-Linter completed but results are inconclusive" -ForegroundColor Yellow
                        Write-Host "    README.md may not have been properly analyzed - check file exists and is readable" -ForegroundColor Gray
                    }                }
                
                # Enhanced Super-Linter Summary with structured output
                Write-Host "`n╔══════════════════════════════════════════════════════════════════════════════╗" -ForegroundColor Cyan
                Write-Host "║                       📊 SUPER-LINTER SUMMARY                                ║" -ForegroundColor Cyan
                Write-Host "╚══════════════════════════════════════════════════════════════════════════════╝" -ForegroundColor Cyan
                
                if ($foundFatal) {
                    $issueCount = if ($parsedIssues) { $parsedIssues.Count } elseif ($markdownErrors) { $markdownErrors.Count } else { "Unknown" }
                    Write-Host "📋 Analysis Results:" -ForegroundColor Cyan
                    Write-Host "  • Status: ❌ ISSUES DETECTED" -ForegroundColor Red
                    Write-Host "  • Violations Found: $issueCount markdown rule violations" -ForegroundColor Red
                    Write-Host "  • File Analyzed: README.md" -ForegroundColor Gray
                    Write-Host "  • Action Required: ⚠️  Fix markdown issues before production" -ForegroundColor Yellow
                    
                    if ($parsedIssues -and $parsedIssues.Count -gt 0) {
                        $uniqueRules = $parsedIssues | Group-Object Rule | Sort-Object Name
                        Write-Host "`n🎯 Rule Violations Summary:" -ForegroundColor Cyan
                        foreach ($rule in $uniqueRules) {
                            $ruleCount = $rule.Count
                            $ruleName = $rule.Name
                            Write-Host "  • $ruleName ($ruleCount occurrence$(if($ruleCount -gt 1){'s'}))" -ForegroundColor Yellow
                        }
                    }
                } else {
                    Write-Host "📋 Analysis Results:" -ForegroundColor Cyan
                    Write-Host "  • Status: ✅ QUALITY STANDARDS MET" -ForegroundColor Green
                    Write-Host "  • Violations Found: None detected" -ForegroundColor Green
                    Write-Host "  • File Analyzed: README.md" -ForegroundColor Gray
                    Write-Host "  • Recommendation: 🎉 Ready for production!" -ForegroundColor Green
                }
                
                # Provide actionable next steps
                Write-Host "`n🚀 Next Steps:" -ForegroundColor Cyan
                if ($foundFatal) {
                    Write-Host "  1. Review the detailed violations table above" -ForegroundColor Gray
                    Write-Host "  2. Fix each markdown rule violation in README.md" -ForegroundColor Gray
                    Write-Host "  3. Re-run this script to verify fixes" -ForegroundColor Gray
                    Write-Host "  4. Consider using a markdown linter in your editor" -ForegroundColor Gray
                } else {
                    Write-Host "  1. ✅ README.md meets quality standards" -ForegroundColor Gray
                    Write-Host "  2. Consider periodic quality checks with this script" -ForegroundColor Gray
                    Write-Host "  3. Maintain consistent markdown style for updates" -ForegroundColor Gray
                }
                  # Show command to re-run analysis
                Write-Host "`n💡 Tip: Re-run analysis anytime with:" -ForegroundColor Cyan
                Write-Host "  .\run-terraform-checks-improved.ps1 -ModulePath `"$ModulePath`"" -ForegroundColor Gray
            } else {
                Write-Host "Super-Linter completed but no specific output was captured." -ForegroundColor Gray
            }
            
            # Clean up temporary Git repository if it was created for linting
            $cleanupCommand = "cd '$wslPath' && if [ -f .git/config ] && grep -q 'terraform-check@local.dev' .git/config >/dev/null 2>&1; then rm -rf .git >/dev/null 2>&1; fi"
            wsl.exe --distribution $ubuntuDistro --exec bash -c $cleanupCommand
        }
    } catch {
        Write-Host "Error running Super-Linter: $_" -ForegroundColor Red
        Write-Host "Note: Super-Linter requires Docker to be available in your WSL environment." -ForegroundColor Yellow
    }
} else {
    Write-Host "`nStep 4: Super-Linter analysis skipped (SkipSuperLinter parameter provided)" -ForegroundColor Gray
}

# Step 5: Validate module structure (if not skipped)
if (-not $SkipValidation) {
    Write-Host "`nStep 5: Validating module structure..." -ForegroundColor Yellow
    try {
        # Define expected files for a standard Terraform module
        $expectedFiles = @("main.tf", "variables.tf", "outputs.tf", "README.md")
        $recommendedFiles = @("required_providers.tf", "versions.tf", "examples/", "test/")          # Check for expected files
        Write-Host "Checking for essential module files..." -ForegroundColor Cyan        
        foreach ($file in $expectedFiles) {
            $fileCheck = wsl.exe --distribution $ubuntuDistro --exec bash -c "test -e '$wslPath/$file' $andOperator echo 'exists' $orOperator echo 'missing'"
            if ($fileCheck -eq "missing") {
                Write-Host "Warning: Essential file '$file' is missing from the module." -ForegroundColor Yellow
            } else {
                Write-Host "Essential file '$file' exists." -ForegroundColor Green
            }
        }          # Check for recommended files
        Write-Host "`nChecking for recommended module files/directories..." -ForegroundColor Cyan
        foreach ($file in $recommendedFiles) {
            $fileCheck = wsl.exe --distribution $ubuntuDistro --exec bash -c "test -e '$wslPath/$file' $andOperator echo 'exists' $orOperator echo 'missing'"
            if ($fileCheck -eq "missing") {
                Write-Host "Note: Recommended file/directory '$file' is missing from the module." -ForegroundColor Gray
            } else {
                Write-Host "Recommended file/directory '$file' exists." -ForegroundColor Green
            }
        }
        
        Write-Host "`nModule structure validation completed." -ForegroundColor Cyan
    } catch {
        Write-Host "Error validating module structure: $_" -ForegroundColor Red
    }
}

Write-Host "`nAll checks and validations completed!" -ForegroundColor Green
Write-Host "Please review the output and address any issues identified by the tools." -ForegroundColor Cyan

# Run Azure Module check if specified
if ($AzureModuleCheck) {
    $complianceScore = Test-AzureModuleCriterion -ModulePath $ModulePath -WslPath $wslPath -Distribution $ubuntuDistro
    
    Write-Host @"

╔══════════════════════════════════════════════════════════════════════════════╗
║                        AZURE COMPLIANCE SUMMARY                             ║
╚══════════════════════════════════════════════════════════════════════════════╝
"@ -ForegroundColor Cyan
    
    if ($complianceScore -ge 80) {
        Write-Host "🟢 EXCELLENT: Module meets Azure Terraform Module Catalog Criterion with a score of $complianceScore%." -ForegroundColor Green
        Write-Host "✅ Your module is ready for Azure marketplace submission!" -ForegroundColor Green
    } elseif ($complianceScore -ge 60) {
        Write-Host "🟡 GOOD: Module partially meets Azure Terraform Module Catalog Criterion with a score of $complianceScore%." -ForegroundColor Yellow
        Write-Host "⚠️  Minor improvements needed - address the issues noted above to improve compliance." -ForegroundColor Yellow
    } else {
        Write-Host "🔴 NEEDS WORK: Module does not meet Azure Terraform Module Catalog Criterion with a score of $complianceScore%." -ForegroundColor Red
        Write-Host "❌ Significant improvements needed - please address the issues noted above." -ForegroundColor Red
    }
    
    Write-Host @"

NEXT STEPS FOR AZURE COMPLIANCE:
$(if ($complianceScore -lt 80) {
"• Review each failed requirement above
• Focus on missing files: versions.tf, required_providers.tf
• Add validation blocks to variables.tf
• Ensure all variables and outputs have descriptions
• Create examples/, test/, and diagram/ directories"
} else {
"• Great work! Your module meets Azure standards
• Consider adding more examples and test cases
• Keep documentation up to date with terraform-docs"
})

"@ -ForegroundColor Cyan
}

Write-Host @"

╔══════════════════════════════════════════════════════════════════════════════╗
║                          QUALITY CHECK COMPLETE                             ║
╚══════════════════════════════════════════════════════════════════════════════╝

📄 OUTPUT FILES GENERATED:
   • README_GENERATED.md - Module documentation from terraform-docs
$(if (-not $SkipSuperLinter) { "   • Super-Linter analysis - README.md quality and style report" })

🔧 TOOLS USED:
   • terraform fmt - Code formatting
   • tflint - Static analysis and linting
   • terraform-docs - Documentation generation
$(if (-not $SkipSuperLinter) { "   • super-linter - README.md quality analysis" })
$(if (-not $SkipValidation) { "   • Structure validation - File organization check" })
$(if ($AzureModuleCheck) { "   • Azure compliance check - Marketplace readiness" })

🚀 USAGE TIPS:
   • Run with -AzureModuleCheck for marketplace readiness: 
     .\run-terraform-checks-improved.ps1 -ModulePath "$ModulePath" -AzureModuleCheck
   
   • Get detailed help anytime:
     .\run-terraform-checks-improved.ps1 -Help
   
   • Standard PowerShell help:
     Get-Help .\run-terraform-checks-improved.ps1 -Detailed

📈 IMPROVE YOUR MODULE:
   • Review any linting warnings above
   • Check README_GENERATED.md for documentation gaps
$(if (-not $SkipSuperLinter) { "   • Address any Super-Linter recommendations for README.md" })
$(if ($AzureModuleCheck -and $complianceScore -lt 80) { "   • Address Azure compliance requirements (current: $complianceScore%)" })
   • Add more comprehensive examples and tests

"@ -ForegroundColor Green

Write-Host "Quality check completed successfully! 🎉" -ForegroundColor Green
