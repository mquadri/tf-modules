# Terraform Module Quality Check Script (Improved Version)
# This script runs formatting, linting, and documentation generation for Terraform modules
# 
# Usage: 
#   .\run-terraform-checks-improved.ps1 -ModulePath <path-to-module>
#
# Parameters:
#   -ModulePath         : (Required) Path to the Terraform module to check
#   -AzureModuleCheck   : (Optional) Check if module follows Azure Terraform Module Catalog Criterion
#   -SkipValidation     : (Optional) Skip the module structure validation checks

param (
    [Parameter(Mandatory=$true)]
    [string]$ModulePath,
    
    [Parameter(Mandatory=$false)]
    [switch]$AzureModuleCheck,
    
    [Parameter(Mandatory=$false)]
    [switch]$SkipValidation
)

Write-Host "Running quality checks on Terraform module at: $ModulePath" -ForegroundColor Green

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
            Pattern = "required_providers"
        },
        @{
            Name = "Module Versioning"; 
            File = "versions.tf"; 
            Pattern = "required_version"
        },
        @{
            Name = "Variable Validation"; 
            File = "variables.tf"; 
            Pattern = "validation"
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
    
    foreach ($req in $requirementsList) {
        Write-Host "Checking for: $($req.Name)..." -ForegroundColor Cyan
        
        if ($req.IsDirectory) {
            # Directory check
            $dirCheck = wsl.exe --distribution "$Distribution" --exec bash -c "test -d '$WslPath/$($req.File)' && echo 'exists' || echo 'missing'"
            if ($dirCheck -eq "exists") {
                Write-Host "  ✓ $($req.Name) requirement passed" -ForegroundColor Green
                $passCount++
            } else {
                Write-Host "  ✗ $($req.Name) requirement failed - directory '$($req.File)' not found" -ForegroundColor Red
            }
        } else {
            # File and pattern check
            $fileCheck = wsl.exe --distribution "$Distribution" --exec bash -c "test -f '$WslPath/$($req.File)' && echo 'exists' || echo 'missing'"
            
            if ($fileCheck -eq "exists") {
                if ($req.Pattern) {
                    # Check for pattern in file
                    $patternCheck = wsl.exe --distribution "$Distribution" --exec bash -c "grep -E '$($req.Pattern)' '$WslPath/$($req.File)' > /dev/null 2>&1 && echo 'found' || echo 'notfound'"
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
                }
            } else {
                Write-Host "  ✗ $($req.Name) requirement failed - file '$($req.File)' not found" -ForegroundColor Red
            }
        }
    }
    
    $percentCompliance = [math]::Round(($passCount / $totalCount) * 100)
    Write-Host "`nAzure Terraform Module Catalog Criterion Compliance: $percentCompliance% ($passCount/$totalCount requirements met)" -ForegroundColor $(if ($percentCompliance -ge 80) { "Green" } elseif ($percentCompliance -ge 60) { "Yellow" } else { "Red" })
    
    return $percentCompliance
}

# Check if module directory exists
if (-not (Test-Path $ModulePath)) {
    Write-Host "Error: Module path does not exist: $ModulePath" -ForegroundColor Red
    exit 1
}

# Check if WSL is installed and running
try {
    $wslStatus = wsl.exe --status 2>&1
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
$ubuntuDistro = "Ubuntu-22.04"  # Default to common distribution name
Write-Host "Using WSL distribution: $ubuntuDistro" -ForegroundColor Cyan

# Convert Windows path to WSL path with improved error handling
try {
    Write-Host "Converting Windows path '$ModulePath' to WSL path..." -ForegroundColor Cyan
    
    # Use the most reliable format for WSL path conversion
    $wslPath = wsl.exe --distribution "$ubuntuDistro" --exec bash -c "wslpath '$ModulePath'" 2>&1
    
    if ($LASTEXITCODE -ne 0 -or $wslPath -match "Error" -or $wslPath -eq "") {
        Write-Host "Error: Failed to convert Windows path to WSL path. Output: $wslPath" -ForegroundColor Red
        
        # First fallback: Try alternative path conversion
        Write-Host "Attempting alternative path conversion method 1..." -ForegroundColor Yellow
        $normalizedPath = $ModulePath.Replace('\', '/')
        $wslPath = wsl.exe --distribution "$ubuntuDistro" --exec bash -c "echo '$normalizedPath'" 2>&1
        
        if ($LASTEXITCODE -ne 0 -or $wslPath -eq "") {
            # Second fallback: Try direct path mapping based on known WSL path structure
            Write-Host "Attempting alternative path conversion method 2..." -ForegroundColor Yellow
            if ($ModulePath -match "^([A-Za-z]):\\(.*)$") {
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
try {
    # Check if terraform is installed
    $terraformCheck = wsl.exe --distribution "$ubuntuDistro" --exec bash -c "command -v terraform > /dev/null 2>&1 || echo 'not-installed'"
    if ($terraformCheck -eq "not-installed") {
        Write-Host "Terraform is not installed in WSL. Installing..." -ForegroundColor Cyan
        wsl.exe --distribution "$ubuntuDistro" --exec bash -c "curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo apt-key add - && sudo apt-add-repository 'deb [arch=amd64] https://apt.releases.hashicorp.com \$(lsb_release -cs) main' && sudo apt-get update && sudo apt-get install -y terraform"
        
        # Verify installation was successful
        $terraformVerify = wsl.exe --distribution "$ubuntuDistro" --exec bash -c "command -v terraform > /dev/null 2>&1 || echo 'failed'"
        if ($terraformVerify -eq "failed") {
            Write-Host "Warning: Failed to install Terraform automatically. Please install manually in your WSL distribution." -ForegroundColor Yellow
            Write-Host "Skipping terraform fmt check." -ForegroundColor Yellow
            return
        }
    }
    
    # Run terraform fmt
    $output = wsl.exe --distribution "$ubuntuDistro" --exec bash -c "cd '$wslPath' && terraform fmt -recursive -check 2>&1"
    $status = $LASTEXITCODE
    
    if ($status -ne 0) {
        Write-Host "terraform fmt found formatting issues. Fixing..." -ForegroundColor Yellow
        wsl.exe --distribution "$ubuntuDistro" --exec bash -c "cd '$wslPath' && terraform fmt -recursive"
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
    $tflintResult = wsl.exe --distribution "$ubuntuDistro" --exec bash -c "command -v tflint > /dev/null 2>&1 || echo 'not-installed'"
    if ($tflintResult -eq "not-installed") {
        Write-Host "tflint is not installed. Installing now..." -ForegroundColor Cyan
        wsl.exe --distribution "$ubuntuDistro" --exec bash -c "curl -s https://raw.githubusercontent.com/terraform-linters/tflint/master/install_linux.sh | bash"
        
        # Verify installation was successful
        $tflintVerify = wsl.exe --distribution "$ubuntuDistro" --exec bash -c "command -v tflint > /dev/null 2>&1 || echo 'failed'"
        if ($tflintVerify -eq "failed") {
            Write-Host "Warning: Failed to install tflint automatically. Please install manually in your WSL distribution." -ForegroundColor Yellow
            Write-Host "Skipping tflint check." -ForegroundColor Yellow
            return
        }
    }

    Write-Host "Running tflint in directory: $wslPath" -ForegroundColor Cyan
    $output = wsl.exe --distribution "$ubuntuDistro" --exec bash -c "cd '$wslPath' && tflint --recursive 2>&1"
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
try {
    # Check if terraform-docs is installed, install to user bin if not
    $terraformDocsResult = wsl.exe --distribution "$ubuntuDistro" --exec bash -c "command -v terraform-docs > /dev/null 2>&1 || echo 'not-installed'"
    if ($terraformDocsResult -eq "not-installed") {
        Write-Host "terraform-docs is not installed. Installing now..." -ForegroundColor Cyan
        
        # Create bin directory if it doesn't exist
        wsl.exe --distribution "$ubuntuDistro" --exec bash -c "mkdir -p ~/bin"
        
        # Download and install terraform-docs
        wsl.exe --distribution "$ubuntuDistro" --exec bash -c "curl -sSLo ./terraform-docs.tar.gz https://terraform-docs.io/dl/v0.16.0/terraform-docs-v0.16.0-linux-amd64.tar.gz && tar -xzf terraform-docs.tar.gz && chmod +x terraform-docs && mv terraform-docs ~/bin/ && rm -f terraform-docs.tar.gz"
        
        # Add to PATH if not already there
        wsl.exe --distribution "$ubuntuDistro" --exec bash -c "grep -q 'export PATH=~/bin:\$PATH' ~/.bashrc || echo 'export PATH=~/bin:\$PATH' >> ~/.bashrc"
        
        # Verify installation was successful
        $verifyResult = wsl.exe --distribution "$ubuntuDistro" --exec bash -c "ls ~/bin/terraform-docs > /dev/null 2>&1 || echo 'failed'"
        if ($verifyResult -eq "failed") {
            Write-Host "Warning: Failed to install terraform-docs automatically. Please install manually in your WSL distribution." -ForegroundColor Yellow
            Write-Host "Skipping terraform-docs generation." -ForegroundColor Yellow
            return
        }
    }

    Write-Host "Running terraform-docs in directory: $wslPath" -ForegroundColor Cyan
    $output = wsl.exe --distribution "$ubuntuDistro" --exec bash -c "cd '$wslPath' && export PATH=~/bin:\$PATH && terraform-docs markdown table . > README_GENERATED.md 2>&1"
    $status = $LASTEXITCODE
    
    if ($status -ne 0) {
        Write-Host "Warning: terraform-docs had issues: $output" -ForegroundColor Yellow
    } else {
        Write-Host "terraform-docs completed successfully." -ForegroundColor Green
        Write-Host "Documentation generated to: README_GENERATED.md" -ForegroundColor Cyan
        
        # Check if the file was actually created
        $fileCheck = wsl.exe --distribution "$ubuntuDistro" --exec bash -c "test -f '$wslPath/README_GENERATED.md' && echo 'exists' || echo 'missing'"
        if ($fileCheck -eq "missing") {
            Write-Host "Warning: README_GENERATED.md file was not created. Check for errors in terraform-docs execution." -ForegroundColor Yellow
        }
    }
} catch {
    Write-Host "Error running terraform-docs: $_" -ForegroundColor Red
}

# Step 4: Validate module structure (if not skipped)
if (-not $SkipValidation) {
    Write-Host "`nStep 4: Validating module structure..." -ForegroundColor Yellow
    try {
        # Define expected files for a standard Terraform module
        $expectedFiles = @("main.tf", "variables.tf", "outputs.tf", "README.md")
        $recommendedFiles = @("required_providers.tf", "versions.tf", "examples/", "test/")
          # Check for expected files
        Write-Host "Checking for essential module files..." -ForegroundColor Cyan
        foreach ($file in $expectedFiles) {
            $fileCheck = wsl.exe --distribution "$ubuntuDistro" --exec bash -c "test -e '$wslPath/$file' && echo 'exists' || echo 'missing'"
            if ($fileCheck -eq "missing") {
                Write-Host "Warning: Essential file '$file' is missing from the module." -ForegroundColor Yellow
            } else {
                Write-Host "Essential file '$file' exists." -ForegroundColor Green
            }
        }
          # Check for recommended files
        Write-Host "`nChecking for recommended module files/directories..." -ForegroundColor Cyan
        foreach ($file in $recommendedFiles) {
            $fileCheck = wsl.exe --distribution "$ubuntuDistro" --exec bash -c "test -e '$wslPath/$file' && echo 'exists' || echo 'missing'"
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
    
    if ($complianceScore -ge 80) {
        Write-Host "`nModule meets Azure Terraform Module Catalog Criterion with a score of $complianceScore%." -ForegroundColor Green
    } elseif ($complianceScore -ge 60) {
        Write-Host "`nModule partially meets Azure Terraform Module Catalog Criterion with a score of $complianceScore%." -ForegroundColor Yellow
        Write-Host "Please address the issues noted above to improve compliance." -ForegroundColor Yellow
    } else {
        Write-Host "`nModule does not meet Azure Terraform Module Catalog Criterion with a score of $complianceScore%." -ForegroundColor Red
        Write-Host "Significant improvements are needed to meet the standard. Please address the issues noted above." -ForegroundColor Red
    }
}
