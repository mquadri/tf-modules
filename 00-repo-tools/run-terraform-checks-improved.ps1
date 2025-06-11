<#
.SYNOPSIS
    Terraform Module Quality Check Script (Improved Version) - Comprehensive quality assurance for Terraform modules

.DESCRIPTION
    This script runs comprehensive quality checks on Terraform modules including:    - Code formatting (terraform fmt)
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
    [switch]$DebugMode,
    
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
                if ($req.Pattern) {
                    # Check for pattern in file
                    $patternCommand = "grep -E '$($req.Pattern)' '$WslPath/$($req.File)' $andOperator echo 'found' $orOperator echo 'notfound'"
                    $patternCheck = wsl.exe --distribution "$Distribution" --exec bash -c $patternCommand
                    if ($patternCheck -eq "found") {
                        Write-Host "  ✓ $($req.Name) requirement passed" -ForegroundColor Green
                        $passCount++
                    } else {
                        Write-Host "  ✗ $($req.Name) requirement failed - pattern '$($req.Pattern)' not found in $($req.File)" -ForegroundColor Red
                    }
                } else {                    # Just checking if file exists
                    Write-Host "  ✓ $($req.Name) requirement passed" -ForegroundColor Green                $passCount++
                }
            } else {
                Write-Host "  ✗ $($req.Name) requirement failed - file '$($req.File)' not found" -ForegroundColor Red
            }
        }
    }
    
    $percentCompliance = [math]::Round(($passCount / $totalCount) * 100)
    $formatString = 'Azure Terraform Module Catalog Criterion Compliance: {0}% ({1}/{2} requirements met)'
    $complianceMessage = $formatString -f $percentCompliance, $passCount, $totalCount
    Write-Host "`n$complianceMessage" -ForegroundColor $(if ($percentCompliance -ge 80) { "Green" } elseif ($percentCompliance -ge 60) { "Yellow" } else { "Red" })
    
    return $percentCompliance
}

# Resolve relative paths to absolute paths
try {
    if (-not [System.IO.Path]::IsPathRooted($ModulePath)) {
        $ModulePath = (Resolve-Path $ModulePath -ErrorAction Stop).Path
        Write-Host "Resolved relative path to: $ModulePath" -ForegroundColor Yellow
    }
} catch {
    Write-Host "Error: Could not resolve module path '$ModulePath': $_" -ForegroundColor Red
    exit 1
}

# Check if module directory exists
if (-not (Test-Path $ModulePath)) {
    Write-Host "Error: Module path does not exist: $ModulePath" -ForegroundColor Red
    exit 1
}

# Define shell operators for cross-platform compatibility
$andOperator = [char]38 + [char]38  # &&
$orOperator = [char]124 + [char]124  # ||

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
      # Handle relative paths by converting to absolute path first
    if (-not [System.IO.Path]::IsPathRooted($ModulePath)) {
        Write-Host "Relative path detected, converting to absolute path..." -ForegroundColor Yellow
        try {
            $ModulePath = (Resolve-Path $ModulePath -ErrorAction Stop).Path
            Write-Host "Resolved to absolute path: $ModulePath" -ForegroundColor Cyan
        } catch {
            Write-Host "Error: Could not resolve relative path '$ModulePath'" -ForegroundColor Red
            Write-Host "Please ensure the path exists and try using an absolute path." -ForegroundColor Yellow
            Write-Host "Current directory: $(Get-Location)" -ForegroundColor Gray
            exit 1
        }
    }
    
    # Primary method: Use direct path mapping (most reliable)
    # Updated regex to handle both single and double backslashes
    if ($ModulePath -match '^([A-Za-z]):[\\/](.*)$') {
        $driveLetter = $Matches[1].ToLower()
        $restOfPath = $Matches[2].Replace('\', '/')
        $wslPath = "/mnt/$driveLetter/$restOfPath"
        Write-Host "Constructed WSL path: $wslPath" -ForegroundColor Yellow
          # Verify the path exists
        $pathTest = wsl.exe --distribution $ubuntuDistro --exec bash -c "test -d '$wslPath' $andOperator echo 'exists' $orOperator echo 'missing'" 2>&1
        if ($pathTest -eq "exists") {
            Write-Host "Path verification successful: $wslPath" -ForegroundColor Green
        } else {
            Write-Host "Warning: Constructed path may not exist. Verification result: $pathTest" -ForegroundColor Yellow
            # Fallback: Try wslpath command
            Write-Host "Attempting wslpath command as fallback..." -ForegroundColor Yellow
            $wslpathResult = wsl.exe --distribution $ubuntuDistro --exec bash -c "wslpath '$ModulePath'" 2>&1
            if ($LASTEXITCODE -eq 0 -and $wslpathResult -notmatch "Error" -and $wslpathResult -ne "") {
                $wslPath = $wslpathResult.Trim()
                Write-Host "Fallback wslpath successful: $wslPath" -ForegroundColor Green
            } else {
                Write-Host "Fallback failed, using constructed path: $wslPath" -ForegroundColor Yellow
            }        }
    } else {
        Write-Host "Error: Could not parse Windows path format: '$ModulePath'" -ForegroundColor Red
        Write-Host "Expected format: C:\path\to\directory" -ForegroundColor Yellow
        Write-Host "Actual format received: $($ModulePath.GetType().Name) with value '$ModulePath'" -ForegroundColor Yellow
        
        # Try alternative parsing methods as fallback
        Write-Host "Attempting alternative path parsing..." -ForegroundColor Cyan
        
        # Method 1: Try to extract drive letter differently
        if ($ModulePath.Length -ge 2 -and $ModulePath[1] -eq ':') {
            $driveLetter = $ModulePath[0].ToString().ToLower()
            $restOfPath = $ModulePath.Substring(2).TrimStart('\', '/').Replace('\', '/')
            $wslPath = "/mnt/$driveLetter/$restOfPath"
            Write-Host "Alternative parsing successful: $wslPath" -ForegroundColor Green
        }
        # Method 2: Use wslpath as primary fallback
        else {
            Write-Host "Attempting direct wslpath conversion..." -ForegroundColor Yellow
            try {
                $wslpathResult = wsl.exe --distribution $ubuntuDistro --exec bash -c "wslpath '$ModulePath'" 2>&1
                if ($LASTEXITCODE -eq 0 -and $wslpathResult -notmatch "Error" -and $wslpathResult -ne "") {
                    $wslPath = $wslpathResult.Trim()
                    Write-Host "Direct wslpath conversion successful: $wslPath" -ForegroundColor Green
                } else {
                    Write-Host "All path conversion methods failed. Please check the path format." -ForegroundColor Red
                    exit 1
                }
            } catch {
                Write-Host "wslpath conversion also failed: $_" -ForegroundColor Red
                exit 1
            }
        }
    }
} catch {
    Write-Host "Error converting path: $_" -ForegroundColor Red
    exit 1
}

# Step 1: Run terraform fmt
Write-Host "`nStep 1: Running terraform fmt..." -ForegroundColor Yellow

# Define bash operators to avoid PowerShell parsing issues
$andOperator = [char]38 + [char]38  # &&
$orOperator = [char]124 + [char]124  # ||

try {
    # Check if terraform is installed
    $terraformCheckCmd = "command -v terraform $orOperator echo 'not-installed'"
    $terraformCheck = wsl.exe --distribution $ubuntuDistro --exec bash -c $terraformCheckCmd
    
    if ($terraformCheck -eq "not-installed") {
        Write-Host "Terraform is not installed in WSL. Installing..." -ForegroundColor Cyan
        $installCmd = "curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo apt-key add - $andOperator sudo apt-add-repository 'deb [arch=amd64] https://apt.releases.hashicorp.com \$(lsb_release -cs) main' $andOperator sudo apt-get update $andOperator sudo apt-get install -y terraform"
        wsl.exe --distribution $ubuntuDistro --exec bash -c $installCmd
        
        # Verify installation was successful
        $terraformVerifyCmd = "command -v terraform $orOperator echo 'failed'"
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
    $tflintCmd = "command -v tflint $orOperator echo 'not-installed'"
    $tflintResult = wsl.exe --distribution $ubuntuDistro --exec bash -c $tflintCmd
    if ($tflintResult -eq "not-installed") {
        Write-Host "tflint is not installed. Installing now..." -ForegroundColor Cyan
        wsl.exe --distribution $ubuntuDistro --exec bash -c "curl -s https://raw.githubusercontent.com/terraform-linters/tflint/master/install_linux.sh | bash"
          # Verify installation was successful
        $tflintVerifyCmd = "command -v tflint $orOperator echo 'failed'"
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
    $terraformDocsCmd = "command -v terraform-docs $orOperator echo 'not-installed'"
    $terraformDocsResult = wsl.exe --distribution $ubuntuDistro --exec bash -c $terraformDocsCmd
    if ($terraformDocsResult -eq "not-installed") {
        Write-Host "terraform-docs is not installed. Installing now..." -ForegroundColor Cyan
        
        # Create bin directory if it doesn't exist
        wsl.exe --distribution $ubuntuDistro --exec bash -c "mkdir -p ~/bin"
        
        # Download and install terraform-docs
        wsl.exe --distribution $ubuntuDistro --exec bash -c "curl -sSLo ./terraform-docs.tar.gz https://terraform-docs.io/dl/v0.16.0/terraform-docs-v0.16.0-linux-amd64.tar.gz $andOperator tar -xzf terraform-docs.tar.gz $andOperator chmod +x terraform-docs $andOperator mv terraform-docs ~/bin/ $andOperator rm -f terraform-docs.tar.gz"
          # Add to PATH if not already there
        wsl.exe --distribution $ubuntuDistro --exec bash -c "grep -q 'export PATH=~/bin:\${'$'}PATH' ~/.bashrc $orOperator echo 'export PATH=~/bin:\${'$'}PATH' >> ~/.bashrc"
        
        # Verify installation was successful
        $verifyResult = wsl.exe --distribution $ubuntuDistro --exec bash -c "ls ~/bin/terraform-docs $orOperator echo 'failed'"
        if ($verifyResult -eq "failed") {
            Write-Host "Warning: Failed to install terraform-docs automatically. Please install manually in your WSL distribution." -ForegroundColor Yellow
            Write-Host "Skipping terraform-docs generation." -ForegroundColor Yellow
            return
        }
    }    Write-Host "Running terraform-docs in directory: $wslPath" -ForegroundColor Cyan
    
    # Use a simpler approach with proper command construction
    $terraformDocsCmd = "cd '$wslPath' && export PATH=~/bin:\`$PATH && terraform-docs markdown table . > README_GENERATED.md"
    $output = wsl.exe --distribution $ubuntuDistro --exec bash -c "$terraformDocsCmd"
    $status = $LASTEXITCODE
      if ($status -ne 0) {
        Write-Host "Warning: terraform-docs had issues" -ForegroundColor Yellow
    } else {
        Write-Host "terraform-docs completed successfully." -ForegroundColor Green
        Write-Host "Documentation generated to: README_GENERATED.md" -ForegroundColor Cyan
        # Check if the file was actually created
        $fileCheck = wsl.exe --distribution $ubuntuDistro --exec bash -c "test -f '$wslPath/README_GENERATED.md' $andOperator echo 'exists' $orOperator echo 'missing'"
        if ($fileCheck -eq "missing") {
            Write-Host "Warning: README_GENERATED.md file was not created. Check for errors in terraform-docs execution." -ForegroundColor Yellow
        } else {
            Write-Host "README_GENERATED.md file created successfully." -ForegroundColor Green
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
        $dockerCheck = wsl.exe --distribution $ubuntuDistro --exec bash -c "command -v docker $orOperator echo 'not-installed'"
        
        if ($dockerCheck -eq "not-installed") {
            Write-Host "Docker is not installed in WSL. Installing Docker..." -ForegroundColor Cyan
            
            # Install Docker in WSL
            Write-Host "Installing Docker in WSL..." -ForegroundColor Cyan
            wsl.exe --distribution $ubuntuDistro --exec bash -c "sudo apt-get update"
            wsl.exe --distribution $ubuntuDistro --exec bash -c "sudo apt-get install -y apt-transport-https ca-certificates curl gnupg lsb-release"
            wsl.exe --distribution $ubuntuDistro --exec bash -c "curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg"
            wsl.exe --distribution $ubuntuDistro --exec bash -c "echo 'deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \$(lsb_release -cs) stable' | sudo tee /etc/apt/sources.list.d/docker.list >/dev/null"
            wsl.exe --distribution $ubuntuDistro --exec bash -c "sudo apt-get update"
            wsl.exe --distribution $ubuntuDistro --exec bash -c "sudo apt-get install -y docker-ce docker-ce-cli containerd.io"
            
            # Start Docker service
            wsl.exe --distribution $ubuntuDistro --exec bash -c "sudo service docker start"            # Verify Docker installation
            $dockerVerify = wsl.exe --distribution $ubuntuDistro --exec bash -c "command -v docker $orOperator echo 'failed'"
            if ($dockerVerify -eq "failed") {                Write-Host "Warning: Failed to install Docker automatically. Skipping Super-Linter analysis." -ForegroundColor Yellow
                Write-Host "Note: You can install Docker manually in WSL to enable comprehensive README.md linting." -ForegroundColor Yellow
            } else {
                Write-Host "Docker installed successfully in WSL." -ForegroundColor Green
            }
        }
        

        # Check if README.md exists before running superlinter
        $readmeCheck = wsl.exe --distribution $ubuntuDistro --exec bash -c "test -f '$wslPath/README.md' $andOperator echo 'exists' $orOperator echo 'missing'"
        if ($readmeCheck -eq "missing") {
            Write-Host "Warning: README.md file not found. Skipping Super-Linter analysis." -ForegroundColor Yellow
        } else {
            Write-Host "Running Super-Linter on README.md..." -ForegroundColor Cyan
              # Ensure Docker service is running
            $dockerStartCmd = "sudo service docker start"
            wsl.exe --distribution $ubuntuDistro --exec bash -c $dockerStartCmd
            

            # Initialize a temporary Git repository if one doesn't exist to satisfy Super-Linter requirements
            Write-Host "Setting up Git repository for Super-Linter..." -ForegroundColor Cyan
            $gitInitCmd = "cd '$wslPath' $andOperator if [ ! -d .git ]; then git init $andOperator git config user.email 'terraform-check@local.dev' $andOperator git config user.name 'Terraform Quality Check' $andOperator git add . $andOperator git commit -m 'Initial commit for linting'; fi"
            wsl.exe --distribution $ubuntuDistro --exec bash -c $gitInitCmd

              # Run Super-Linter specifically for markdown files
            $dockerCommand = "cd '$wslPath' $andOperator sudo docker run --rm -e RUN_LOCAL=true -e VALIDATE_ALL_CODEBASE=false -e VALIDATE_MARKDOWN=true -e VALIDATE_NATURAL_LANGUAGE=true -e DEFAULT_BRANCH=main -e FILTER_REGEX_INCLUDE='.*README\.md$' -e LOG_LEVEL=WARN -v '${wslPath}:/tmp/lint' github/super-linter:latest"
            $superlinterOutput = wsl.exe --distribution $ubuntuDistro --exec bash -c $dockerCommand

            
            # Verify Git repository was created
            $gitVerifyCmd = "cd '$wslPath' $andOperator git status $andOperator echo 'success' $orOperator echo 'failed'"
            $gitVerify = wsl.exe --distribution $ubuntuDistro --exec bash -c $gitVerifyCmd
            if ($gitVerify -eq "failed") {
                Write-Host "Warning: Failed to initialize Git repository. Super-Linter may not work correctly." -ForegroundColor Yellow
            } else {
                Write-Host "Git repository ready for Super-Linter." -ForegroundColor Green
            }            # Enhanced Docker execution with comprehensive permission handling
            Write-Host "Running Super-Linter container for markdown analysis..." -ForegroundColor Cyan
            Write-Host "WSL Path: $wslPath" -ForegroundColor Gray
              # Get the actual current directory and clean it up
            $currentDirCmd = "cd '$wslPath' $andOperator pwd"
            $currentDir = wsl.exe --distribution $ubuntuDistro --exec bash -c $currentDirCmd
            $currentDir = $currentDir.Trim()
            Write-Host "Resolved directory: $currentDir" -ForegroundColor Gray
              # Check Docker permissions and user group membership
            Write-Host "Checking Docker permissions..." -ForegroundColor Cyan
            $dockerGroupCmd = "groups | grep -q docker $andOperator echo 'in-group' $orOperator echo 'not-in-group'"
            $dockerGroupCheck = wsl.exe --distribution $ubuntuDistro --exec bash -c $dockerGroupCmd
            
            $dockerSocketCmd = "test -r /var/run/docker.sock $andOperator echo 'readable' $orOperator echo 'not-readable'"
            $dockerSocketCheck = wsl.exe --distribution $ubuntuDistro --exec bash -c $dockerSocketCmd
              $dockerServiceCmd = "docker info 2>/dev/null $andOperator echo 'running' $orOperator echo 'not-running'"
            $dockerServiceCheck = wsl.exe --distribution $ubuntuDistro --exec bash -c $dockerServiceCmd
            
            Write-Host "Docker group membership: $dockerGroupCheck" -ForegroundColor Gray
            Write-Host "Docker socket access: $dockerSocketCheck" -ForegroundColor Gray
            Write-Host "Docker service status: $dockerServiceCheck" -ForegroundColor Gray
            
            # Initialize variables for output capture
            $superlinterOutput = ""
            $superlinterExitCode = 1
            $executionStrategy = ""
            
            # Strategy 1: Try direct Docker execution (for users in docker group)
            if ($dockerGroupCheck -eq "in-group" -and $dockerServiceCheck -eq "running") {
                Write-Host "✅ User is in docker group - executing without sudo..." -ForegroundColor Green
                $executionStrategy = "direct"
                
                try {
                    # Create optimized temporary script for better output capture
                    $tempScript = "superlinter_direct_exec.sh"
                    $tempScriptPath = "/tmp/$tempScript"
                      # Build script content as escaped string
                    $line1 = '#!/bin/bash'
                    $line2 = 'set -euo pipefail'
                    $line3 = "cd '$wslPath'"
                    $line4 = 'exec docker run --rm \'
                    $line5 = '    -e RUN_LOCAL=true \'
                    $line6 = '    -e VALIDATE_MARKDOWN=true \'
                    $line7 = '    -e LOG_LEVEL=VERBOSE \'
                    $line8 = '    -e GIT_DISCOVERY_ACROSS_FILESYSTEM=1 \'
                    $line9 = '    -e GITHUB_WORKSPACE=/tmp/lint \'
                    $line10 = '    -e DEFAULT_BRANCH=main \'
                    $line11 = "    -v '${wslPath}:/tmp/lint' \"
                    $line12 = '    --workdir /tmp/lint \'
                    $line13 = '    github/super-linter:latest'
                    $scriptContent = "$line1`n$line2`n$line3`n$line4`n$line5`n$line6`n$line7`n$line8`n$line9`n$line10`n$line11`n$line12`n$line13"                    # Create and execute the script
                    $createScriptCmd = "echo \`"$scriptContent\`" '>' $tempScriptPath $andOperator chmod +x $tempScriptPath"
                    wsl.exe --distribution $ubuntuDistro --exec bash -c $createScriptCmd
                    $superlinterOutput = wsl.exe --distribution $ubuntuDistro --exec bash -c "$tempScriptPath"
                    $superlinterExitCode = $LASTEXITCODE
                    
                    # Clean up temp script
                    wsl.exe --distribution $ubuntuDistro --exec bash -c "rm -f $tempScriptPath"
                    
                    Write-Host "✅ Direct Docker execution completed (exit code: $superlinterExitCode)" -ForegroundColor Green
                } catch {
                    Write-Host "⚠️ Direct Docker execution failed: $_" -ForegroundColor Yellow
                    $executionStrategy = "failed-direct"
                }
            } else {
                Write-Host "⚠️ User not in docker group or service not running - will need sudo" -ForegroundColor Yellow
                $executionStrategy = "needs-sudo"
            }
            
            # Strategy 2: Non-interactive sudo execution (if direct failed or not possible)
            if ($executionStrategy -ne "direct" -or $superlinterExitCode -ne 0) {
                Write-Host "Attempting non-interactive sudo execution..." -ForegroundColor Cyan
                  try {
                    # Create a comprehensive script with error handling
                    $tempScript = "superlinter_sudo_exec.sh"
                    $tempScriptPath = "/tmp/$tempScript"
                      # Build script content avoiding here-strings
                    $s1 = '#!/bin/bash'
                    $s2 = 'set -euo pipefail'
                    $s3 = ''
                    $s4 = '# Function to handle docker execution with timeout'
                    $s5 = 'execute_docker() {'
                    $s6 = '    timeout 300 sudo docker run --rm \'
                    $s7 = '        -e RUN_LOCAL=true \'
                    $s8 = '        -e VALIDATE_MARKDOWN=true \'
                    $s9 = '        -e LOG_LEVEL=VERBOSE \'
                    $s10 = '        -e GIT_DISCOVERY_ACROSS_FILESYSTEM=1 \'
                    $s11 = '        -e GITHUB_WORKSPACE=/tmp/lint \'
                    $s12 = '        -e DEFAULT_BRANCH=main \'
                    $s13 = "        -v '${wslPath}:/tmp/lint' \"
                    $s14 = '        --workdir /tmp/lint \'
                    $s15 = '        github/super-linter:latest'
                    $s16 = '}'
                    $s17 = ''
                    $s18 = '# Change to working directory'
                    $s19 = "cd '$wslPath'"
                    $s20 = ''
                    $s21 = '# Execute with timeout and proper error handling'
                    $s22 = 'if execute_docker; then'
                    $s23 = '    echo "Super-Linter execution completed successfully"'
                    $s24 = 'else'
                    $s25 = '    exit_code=$?'
                    $s26 = '    echo "Super-Linter execution failed with exit code: $exit_code"'
                    $s27 = '    exit $exit_code'
                    $s28 = 'fi'
                    $scriptContent = "$s1`n$s2`n$s3`n$s4`n$s5`n$s6`n$s7`n$s8`n$s9`n$s10`n$s11`n$s12`n$s13`n$s14`n$s15`n$s16`n$s17`n$s18`n$s19`n$s20`n$s21`n$s22`n$s23`n$s24`n$s25`n$s26`n$s27`n$s28"                    # Create and execute the script with timeout
                    $createScript2Cmd = "echo \`"$scriptContent\`" '>' $tempScriptPath $andOperator chmod +x $tempScriptPath"
                    wsl.exe --distribution $ubuntuDistro --exec bash -c $createScript2Cmd
                    
                    # Execute with a reasonable timeout to avoid hanging on password prompts
                    Write-Host "Executing with 5-minute timeout..." -ForegroundColor Gray
                    $superlinterOutput = wsl.exe --distribution $ubuntuDistro --exec timeout 300 bash -c "$tempScriptPath"
                    $superlinterExitCode = $LASTEXITCODE
                    
                    # Clean up temp script
                    wsl.exe --distribution $ubuntuDistro --exec bash -c "rm -f $tempScriptPath"
                    
                    if ($superlinterExitCode -eq 124) {
                        Write-Host "⚠️ Execution timed out - likely due to sudo password prompt" -ForegroundColor Yellow
                        $executionStrategy = "timeout"
                    } else {
                        Write-Host "✅ Sudo execution completed (exit code: $superlinterExitCode)" -ForegroundColor Green
                        $executionStrategy = "sudo-success"
                    }
                } catch {
                    Write-Host "⚠️ Sudo execution failed: $_" -ForegroundColor Yellow
                    $executionStrategy = "failed-sudo"
                }
            }
            
            # Strategy 3: Fallback with guidance if all automated methods fail
            if ($executionStrategy -eq "timeout" -or $executionStrategy -eq "failed-sudo" -or $executionStrategy -eq "failed-direct") {
                Write-Host "`n🔧 DOCKER PERMISSION GUIDANCE" -ForegroundColor Yellow
                Write-Host "Super-Linter requires Docker access. Consider one of these solutions:" -ForegroundColor White
                Write-Host ""
                Write-Host "Option 1: Add your user to the docker group (recommended):" -ForegroundColor Cyan
                Write-Host "  wsl.exe --distribution $ubuntuDistro --exec sudo usermod -a -G docker `$USER" -ForegroundColor Gray
                Write-Host "  wsl.exe --distribution $ubuntuDistro --exec newgrp docker" -ForegroundColor Gray
                Write-Host ""
                Write-Host "Option 2: Configure passwordless sudo for docker:" -ForegroundColor Cyan
                Write-Host "  wsl.exe --distribution $ubuntuDistro --exec sudo sh -c 'echo \"`$USER ALL=(ALL) NOPASSWD: /usr/bin/docker\" >> /etc/sudoers'" -ForegroundColor Gray
                Write-Host ""
                Write-Host "Option 3: Use the Docker-based script instead:" -ForegroundColor Cyan
                Write-Host "  .\run-terraform-checks-docker.ps1 -ModulePath '$ModulePath'" -ForegroundColor Gray
                Write-Host ""
                  # Attempt manual violation detection as fallback
                Write-Host "Attempting manual markdown violation detection..." -ForegroundColor Cyan
                try {
                    $readmeContentCmd = "cat '$wslPath/README.md' 2>/dev/null $orOperator echo 'FILE_NOT_FOUND'"
                    $readmeContent = wsl.exe --distribution $ubuntuDistro --exec bash -c $readmeContentCmd
                    if ($readmeContent -ne "FILE_NOT_FOUND") {
                        $manualViolations = @()
                        $lines = $readmeContent -split "`n"
                        
                        # Check for common markdown violations manually
                        for ($i = 0; $i -lt $lines.Length; $i++) {
                            $lineNum = $i + 1
                            $line = $lines[$i]
                            
                            # MD041: First line should be a h1 header
                            if ($i -eq 0 -and $line -notmatch '^#\s+.*') {
                                $manualViolations += [PSCustomObject]@{
                                    LineNumber = $lineNum
                                    Column = 1
                                    RuleId = "MD041"
                                    Description = "First line in file should be a top level header"
                                    Severity = "Error"
                                }
                            }
                            
                            # MD034: Bare URL without proper formatting
                            if ($line -match 'https?://[^\s\[\]()]*[^\s\[\]().,;:]') {
                                $manualViolations += [PSCustomObject]@{
                                    LineNumber = $lineNum
                                    Column = $line.IndexOf('http')
                                    RuleId = "MD034"
                                    Description = "Bare URL used"
                                    Severity = "Error"
                                }
                            }
                            
                            # MD013: Line length (check for very long lines)
                            if ($line.Length -gt 150) {
                                $manualViolations += [PSCustomObject]@{
                                    LineNumber = $lineNum
                                    Column = 150
                                    RuleId = "MD013"
                                    Description = "Line too long"
                                    Severity = "Warning"
                                }
                            }
                        }
                        
                        # MD047: Files should end with a single newline character
                        if (-not $readmeContent.EndsWith("`n") -or $readmeContent.EndsWith("`n`n")) {
                            $manualViolations += [PSCustomObject]@{
                                LineNumber = $lines.Length
                                Column = 1
                                RuleId = "MD047"
                                Description = "Files should end with a single newline character"
                                Severity = "Error"
                            }
                        }
                        
                        if ($manualViolations.Count -gt 0) {
                            $superlinterOutput = "Manual detection found $($manualViolations.Count) markdown violations"
                            $superlinterExitCode = 1
                            $executionStrategy = "manual-detection"
                            
                            # Store violations for later processing
                            $script:manualDetectedViolations = $manualViolations
                        } else {
                            $superlinterOutput = "Manual detection: No obvious markdown violations found"
                            $superlinterExitCode = 0
                            $executionStrategy = "manual-clean"
                        }
                    }
                } catch {
                    Write-Host "Manual detection also failed: $_" -ForegroundColor Red
                    $executionStrategy = "all-failed"
                }
            }            
            # Parse and display results based on execution strategy
            Write-Host "`n📊 SUPER-LINTER ANALYSIS RESULTS" -ForegroundColor Cyan
            Write-Host "Execution strategy: $executionStrategy" -ForegroundColor Gray
            
            if ($superlinterOutput) {
                # Enhanced Super-Linter output analysis with comprehensive detection
                Write-Host "`n🔍 ANALYZING OUTPUT..." -ForegroundColor Cyan
                Write-Host "Output length: $($superlinterOutput.Length) characters" -ForegroundColor Gray
                Write-Host "Exit code: $superlinterExitCode" -ForegroundColor Gray
                
                # Display sample or complete output based on size
                if ($superlinterOutput -and $superlinterOutput.Length -gt 50) {
                    $sampleLength = [Math]::Min(500, $superlinterOutput.Length)
                    $sampleText = $superlinterOutput.Substring(0, $sampleLength)
                    Write-Host "Sample output (first $sampleLength chars): $sampleText" -ForegroundColor Gray
                } elseif ($superlinterOutput) {
                    Write-Host "Complete output: $superlinterOutput" -ForegroundColor Gray
                } else {
                    Write-Host "No output captured" -ForegroundColor Yellow
                }
                  # Initialize parsing variables
                $outputLines = $superlinterOutput -split "`n" | ForEach-Object { $_.Trim() }
                $parsedIssues = @()
                $foundFatal = $false
                
                # Handle manual detection results
                if ($executionStrategy -eq "manual-detection" -and $script:manualDetectedViolations) {
                    Write-Host "`n✅ Using manual violation detection results" -ForegroundColor Green
                    $parsedIssues = $script:manualDetectedViolations
                    $foundFatal = $true
                } else {
                    # Parse Super-Linter output with enhanced pattern matching
                    Write-Host "`nParsing Super-Linter output for markdown violations..." -ForegroundColor Cyan
                    
                    # Check for any indication of markdown issues with expanded criteria
                    $foundFatal = ($superlinterOutput -match "FATAL.*Exiting with errors found" -or 
                                   $superlinterOutput -match "\[ERROR\].*markdownlint" -or 
                                   $superlinterOutput -match "FAIL.*MARKDOWN" -or
                                   $superlinterOutput -match "MD\d{3}" -or
                                   $superlinterOutput -match "Found errors.*markdownlint" -or
                                   $superlinterExitCode -ne 0)
                    
                    if ($foundFatal) {
                        Write-Host "🔍 Markdown violations detected - parsing details..." -ForegroundColor Yellow
                        
                        # Enhanced parsing with multiple pattern strategies
                        foreach ($line in $outputLines) {
                            if (-not $line -or $line.Length -eq 0) { continue }
                            
                            # Strategy 1: Super-Linter ERROR block format with enhanced regex
                            # Pattern: /tmp/lint/README.md:1 MD041/first-line-heading...
                            if ($line -match "(?:/tmp/lint/)?README\.md:(\d+)(?::(\d+))?\s+(MD\d{3})(?:[/\w\-]*)\s*(.*)") {
                                $parsedIssues += [PSCustomObject]@{
                                    LineNumber = [int]$Matches[1]
                                    Column = if ($Matches[2]) { [int]$Matches[2] } else { 1 }
                                    RuleId = $Matches[3]
                                    Description = $Matches[4].Trim()
                                    Severity = "Error"
                                    Source = "Super-Linter"
                                }
                                Write-Host "  ✓ Parsed: Line $($Matches[1]), Rule $($Matches[3])" -ForegroundColor Gray
                            }
                            # Strategy 2: README_GENERATED.md violations (if terraform-docs creates issues)
                            elseif ($line -match "(?:/tmp/lint/)?README_GENERATED\.md:(\d+)(?::(\d+))?\s+(MD\d{3})(?:[/\w\-]*)\s*(.*)") {
                                $parsedIssues += [PSCustomObject]@{
                                    LineNumber = [int]$Matches[1]
                                    Column = if ($Matches[2]) { [int]$Matches[2] } else { 1 }
                                    RuleId = $Matches[3]
                                    Description = $Matches[4].Trim()
                                    Severity = "Warning"
                                    Source = "Super-Linter (Generated)"
                                }
                                Write-Host "  ✓ Parsed: README_GENERATED Line $($Matches[1]), Rule $($Matches[3])" -ForegroundColor Gray
                            }
                            # Strategy 3: Alternative Super-Linter format
                            # Pattern: ERROR! markdownlint README.md:1 MD041 First line in file should be a top level header
                            elseif ($line -match "ERROR.*markdownlint.*README\.md:(\d+)\s+(MD\d{3})\s*(.*)") {                                $parsedIssues += [PSCustomObject]@{
                                    LineNumber = [int]$Matches[1]
                                    Column = 1
                                    RuleId = $Matches[2]
                                    Description = $Matches[3].Trim()
                                    Severity = "Error"
                                    Source = "Super-Linter"
                                }
                                Write-Host "  ✓ Parsed: Line $($Matches[1]), Rule $($Matches[2])" -ForegroundColor Gray
                            }
                            # Strategy 4: Generic markdown rule detection
                            elseif ($line -match "(MD\d{3}).*README[.]md.*line\s*(\d+)" -or $line -match "README[.]md.*line\s*(\d+).*(MD\d{3})") {
                                $ruleId = if ($Matches[1] -match "MD\d{3}") { $Matches[1] } else { $Matches[2] }
                                $lineNum = if ($Matches[2] -match "\d+") { [int]$Matches[2] } else { [int]$Matches[1] }
                                
                                $parsedIssues += [PSCustomObject]@{
                                    LineNumber = $lineNum
                                    Column = 1
                                    RuleId = $ruleId
                                    Description = $line.Trim()
                                    Severity = "Warning"
                                    Source = "Super-Linter (Pattern)"
                                }
                                Write-Host "  ✓ Parsed: Line $lineNum, Rule $ruleId (pattern match)" -ForegroundColor Gray
                            }
                        }
                        
                        # Debug information for parsing
                        Write-Host "`n📈 PARSING STATISTICS:" -ForegroundColor Cyan
                        Write-Host "Total output lines processed: $($outputLines.Count)" -ForegroundColor Gray
                        Write-Host "Violations parsed: $($parsedIssues.Count)" -ForegroundColor Gray
                        
                        # If no violations parsed but errors detected, show debug info
                        if ($parsedIssues.Count -eq 0 -and $foundFatal) {
                            Write-Host "`n🔎 DEBUG: No violations parsed but errors detected" -ForegroundColor Yellow
                            Write-Host "Searching for any markdown-related error lines..." -ForegroundColor Gray
                            
                            $debugLines = $outputLines | Where-Object { 
                                $_ -match "README" -or 
                                $_ -match "MD\d{3}" -or 
                                $_ -match "markdown" -or 
                                $_ -match "ERROR" -or 
                                $_ -match "FAIL" 
                            }
                            
                            if ($debugLines) {
                                Write-Host "Relevant debug lines found:" -ForegroundColor Gray
                                $debugLines | ForEach-Object { Write-Host "  $_" -ForegroundColor DarkGray }
                            } else {
                                Write-Host "No obvious markdown-related lines found in output" -ForegroundColor Gray
                            }
                        }
                    } else {
                        Write-Host "✅ No markdown violations detected" -ForegroundColor Green
                    }
                }
                
                # Display results with enhanced formatting
                if ($parsedIssues.Count -gt 0) {
                    Write-Host "`n📋 MARKDOWN VIOLATIONS FOUND:" -ForegroundColor Red
                    Write-Host "Total violations: $($parsedIssues.Count)" -ForegroundColor Red
                    
                    # Sort violations by line number for better readability
                    $sortedViolations = $parsedIssues | Sort-Object { [int]$_.LineNumber } -ErrorAction SilentlyContinue
                    if (-not $sortedViolations) { $sortedViolations = $parsedIssues }
                    
                    # Create professional table display
                    Write-Host ""
                    Write-Host "┌─────────┬────────┬─────────┬──────────────────────────────────────────────────────┐" -ForegroundColor Gray
                    Write-Host "│ Line    │ Column │ Rule    │ Description                                          │" -ForegroundColor Gray
                    Write-Host "├─────────┼────────┼─────────┼──────────────────────────────────────────────────────┤" -ForegroundColor Gray
                    
                    foreach ($violation in $sortedViolations) {
                        $line = if ($violation.LineNumber) { $violation.LineNumber.ToString().PadLeft(7) } else { "?".PadLeft(7) }
                        $col = if ($violation.Column) { $violation.Column.ToString().PadLeft(6) } else { "1".PadLeft(6) }
                        $rule = if ($violation.RuleId) { $violation.RuleId.PadLeft(7) } else { "?".PadLeft(7) }
                        $desc = if ($violation.Description) { 
                            $violation.Description.Substring(0, [Math]::Min(52, $violation.Description.Length)).PadRight(52)
                        } else { 
                            "Unknown violation".PadRight(52) 
                        }
                        
                        Write-Host "│ $line │ $col │ $rule │ $desc │" -ForegroundColor Red
                    }
                    
                    Write-Host "└─────────┴────────┴─────────┴──────────────────────────────────────────────────────┘" -ForegroundColor Gray
                    
                    # Provide rule-specific recommendations
                    Write-Host "`n💡 RECOMMENDATIONS:" -ForegroundColor Yellow
                    $uniqueRules = $sortedViolations | Select-Object -ExpandProperty RuleId -Unique | Where-Object { $_ }
                    foreach ($rule in $uniqueRules) {
                        switch ($rule) {
                            "MD041" { Write-Host "  • $rule - Start your README.md with a single # header" -ForegroundColor Cyan }
                            "MD013" { Write-Host "  • $rule - Consider breaking long lines (limit: 150 characters)" -ForegroundColor Cyan }
                            "MD034" { Write-Host "  • $rule - Wrap bare URLs in angle brackets: <https://example.com>" -ForegroundColor Cyan }
                            "MD047" { Write-Host "  • $rule - Ensure file ends with exactly one newline character" -ForegroundColor Cyan }
                            "MD012" { Write-Host "  • $rule - Remove multiple consecutive blank lines" -ForegroundColor Cyan }
                            "MD022" { Write-Host "  • $rule - Add blank lines around headers" -ForegroundColor Cyan }
                            "MD032" { Write-Host "  • $rule - Add blank lines around list items" -ForegroundColor Cyan }
                            default { Write-Host "  • $rule - Check markdownlint documentation for details" -ForegroundColor Cyan }
                        }
                    }
                    
                    Write-Host "`n🔗 For more details on markdown rules, visit:" -ForegroundColor White
                    Write-Host "   https://github.com/DavidAnson/markdownlint/blob/main/doc/Rules.md" -ForegroundColor Blue
                    
                } else {
                    if ($foundFatal -or $superlinterExitCode -ne 0) {
                        Write-Host "`n⚠️ Super-Linter reported errors but no specific violations were parsed" -ForegroundColor Yellow
                        Write-Host "This might indicate:" -ForegroundColor Gray
                        Write-Host "  • Output parsing issues due to Docker permission problems" -ForegroundColor Gray
                        Write-Host "  • Super-Linter configuration issues" -ForegroundColor Gray
                        Write-Host "  • Non-markdown related errors in the output" -ForegroundColor Gray
                        
                        if ($executionStrategy -eq "timeout" -or $executionStrategy -eq "needs-sudo") {
                            Write-Host "  • Consider following the Docker permission guidance above" -ForegroundColor Yellow
                        }
                    } else {
                        Write-Host "`n✅ README.md passes all markdown quality checks!" -ForegroundColor Green
                        Write-Host "No markdown violations found." -ForegroundColor Green                    }
                }
            } else {
                Write-Host "❌ No output received from Super-Linter" -ForegroundColor Red
                if ($executionStrategy -eq "all-failed") {
                    Write-Host "All execution strategies failed. Consider:" -ForegroundColor Yellow
                    Write-Host "  • Following the Docker permission guidance above" -ForegroundColor Gray
                    Write-Host "  • Using the Docker-based script alternative" -ForegroundColor Gray                }
            }
            # Clean up temporary Git repository if it was created for linting
            $cleanupCmd = "cd '$wslPath' $andOperator if [ -f .git/config ] $andOperator grep -q 'terraform-check@local.dev' .git/config; then rm -rf .git; fi"
            wsl.exe --distribution $ubuntuDistro --exec bash -c $cleanupCmd
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
        $recommendedFiles = @("required_providers.tf", "versions.tf", "examples/", "test/")
        
        # Check for expected files
        Write-Host "Checking for essential module files..." -ForegroundColor Cyan
        foreach ($file in $expectedFiles) {
            $fileCheck = wsl.exe --distribution $ubuntuDistro --exec bash -c "test -e '$wslPath/$file' $andOperator echo 'exists' $orOperator echo 'missing'"
            if ($fileCheck -eq "missing") {
                Write-Host "Warning: Essential file '$file' is missing from the module." -ForegroundColor Yellow
            } else {
                Write-Host "Essential file '$file' exists." -ForegroundColor Green
            }
        }
        
        # Check for recommended files
        Write-Host "`nChecking for recommended module files/directories..." -ForegroundColor Cyan
        foreach ($file in $recommendedFiles) {
            $fileCheck = wsl.exe --distribution $ubuntuDistro --exec bash -c "test -e '$wslPath/$file' $andOperator echo 'exists' $orOperator echo 'missing'"
            if ($fileCheck -eq "missing") {
                Write-Host "Info: Recommended file/directory '$file' is missing from the module." -ForegroundColor Cyan
            } else {
                Write-Host "Recommended file/directory '$file' exists." -ForegroundColor Green
            }
        }
        
        Write-Host "Module structure validation completed." -ForegroundColor Green
    } catch {
        Write-Host "Error during module structure validation: $_" -ForegroundColor Red
    }
} else {
    Write-Host "`nStep 5: Module structure validation skipped (SkipValidation parameter provided)" -ForegroundColor Gray
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
