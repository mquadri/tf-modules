# Terraform Module Quality Check Script
# This script runs formatting, linting, and documentation generation for Terraform modules
# 
# Usage: 
#   .\run-terraform-checks.ps1 -ModulePath <path-to-module>
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
      # Define criterion requirements
    $requirements = @(
        @{Name="Provider Configuration"; File="required_providers.tf|versions.tf|main.tf"; Pattern="required_providers|provider \"azurerm\""}
        @{Name="Module Versioning"; File="README.md"; Pattern="## Requirements|required_version"}
        @{Name="Variable Validation"; File="variables.tf"; Pattern="validation \{"}
        @{Name="Variable Descriptions"; File="variables.tf"; Pattern="description ="}
        @{Name="Output Descriptions"; File="outputs.tf"; Pattern="description ="}
        @{Name="Examples Directory"; File="examples/"; Pattern=""}
        @{Name="Test Files"; File="test/"; Pattern=""}
        @{Name="Readme Documentation"; File="README.md"; Pattern="## Usage|## Inputs|## Outputs"}
        @{Name="Architectural Diagram"; File="diagram/"; Pattern=""}
    )
    
    $passCount = 0
    $totalCount = $requirements.Count
    
    foreach ($req in $requirements) {
        Write-Host "Checking for: $($req.Name)..." -ForegroundColor Cyan
        
        if ($req.File -match "/\$") {
            # This is a directory check
            $dirName = $req.File.TrimEnd('/')
            $dirCheck = wsl.exe --distribution "$Distribution" --exec bash -c "test -d '$WslPath/$dirName' && echo 'exists' || echo 'missing'"
            if ($dirCheck -eq "exists") {
                Write-Host "  ✓ $($req.Name) requirement passed" -ForegroundColor Green
                $passCount++
            } else {
                Write-Host "  ✗ $($req.Name) requirement failed - directory '$dirName' not found" -ForegroundColor Red
            }
        } else {
            # This is a file content check
            $filePatterns = $req.File -split "\|"
            $found = $false
            
            foreach ($filePattern in $filePatterns) {
                $files = wsl.exe --distribution "$Distribution" --exec bash -c "find '$WslPath' -maxdepth 1 -name '$filePattern' 2>/dev/null || echo ''"
                
                if ($files -and $files -ne "") {
                    if ($req.Pattern -eq "") {
                        # Just checking if file exists
                        $found = $true
                        break
                    } else {
                        # Checking for pattern in file
                        foreach ($file in $files -split "`n") {
                            if ($file -and $file -ne "") {
                                $patternCheck = wsl.exe --distribution "$Distribution" --exec bash -c "grep -E '$($req.Pattern)' '$file' > /dev/null 2>&1 && echo 'found' || echo 'notfound'"
                                if ($patternCheck -eq "found") {
                                    $found = $true
                                    break
                                }
                            }
                        }
                    }
                }
                
                if ($found) {
                    break
                }
            }
            
            if ($found) {
                Write-Host "  ✓ $($req.Name) requirement passed" -ForegroundColor Green
                $passCount++
            } else {
                Write-Host "  ✗ $($req.Name) requirement failed - pattern not found in any of: $($req.File)" -ForegroundColor Red
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
    $distributions = wsl.exe --list --verbose 2>&1 | Out-String
    if ($distributions -match "no distributions" -or $distributions -eq "" -or $null -eq $distributions) {
        Write-Host "Error: No WSL distributions found. Please install a Linux distribution in WSL." -ForegroundColor Red
        exit 1
    }
} catch {
    Write-Host "Error: WSL is not installed or not configured properly. Exception: $_" -ForegroundColor Red
    exit 1
}

# Check for Ubuntu distribution - improved detection method
$ubuntuDistro = $null
$distributions = wsl.exe --list --verbose 2>&1 | Out-String
Write-Host "Available WSL distributions:" -ForegroundColor Cyan
Write-Host $distributions -ForegroundColor Gray

# Enhanced WSL distribution detection - supports more distribution formats
if ($distributions -match "(?:\s|\*)*([^\s]+Ubuntu[^\s]*|Ubuntu[^\s]*|[^\s]*ubuntu[^\s]*)") {
    $ubuntuDistro = $Matches[1].Trim()
    Write-Host "Found Ubuntu distribution: $ubuntuDistro" -ForegroundColor Green
} else {
    # If no Ubuntu distribution found, extract all distribution names
    $allDistros = $distributions -split "`n" | 
                 Where-Object { $_ -match "(?:\s|\*)*([^\s]+)" } | 
                 ForEach-Object { $Matches[1].Trim() } | 
                 Where-Object { $_ -ne "NAME" -and $_ -ne "STATE" -and $_ -ne "VERSION" -and $_.Length -gt 1 }
    
    if ($allDistros -and $allDistros.Count -gt 0) {
        # Find the default distribution (marked with *)
        $defaultDistro = $distributions -split "`n" | Where-Object { $_ -match "\*\s+([^\s]+)" } | ForEach-Object { $Matches[1].Trim() }
        
        if ($defaultDistro) {
            $ubuntuDistro = $defaultDistro
            Write-Host "No Ubuntu distribution found. Using default distribution: $ubuntuDistro" -ForegroundColor Yellow
        } else {
            # If no default, use the first one
            $ubuntuDistro = $allDistros[0]
            Write-Host "No Ubuntu or default distribution found. Using first available distribution: $ubuntuDistro" -ForegroundColor Yellow
        }
    } else {
        Write-Host "Error: No WSL distributions available. Please install an Ubuntu distribution or any Linux distribution in WSL." -ForegroundColor Red
        exit 1
    }
}

Write-Host "Using WSL distribution: $ubuntuDistro" -ForegroundColor Cyan

# Convert Windows path to WSL path with improved error handling
try {
    Write-Host "Converting Windows path '$ModulePath' to WSL path..." -ForegroundColor Cyan
    
    # Use the full --distribution parameter to avoid issues with special characters
    $wslPath = wsl.exe --distribution "$ubuntuDistro" --exec bash -c "wslpath '$ModulePath'" 2>&1
    
    if ($LASTEXITCODE -ne 0 -or $wslPath -match "Error" -or $wslPath -eq "") {
        Write-Host "Error: Failed to convert Windows path to WSL path. Output: $wslPath" -ForegroundColor Red
        
        # Try an alternative approach for path conversion
        Write-Host "Attempting alternative path conversion..." -ForegroundColor Yellow
        $normalizedPath = $ModulePath.Replace('\', '/')
        $wslPath = wsl.exe --distribution "$ubuntuDistro" --exec bash -c "echo '$normalizedPath'" 2>&1
        
        if ($LASTEXITCODE -ne 0 -or $wslPath -eq "") {
            Write-Host "Error: Alternative path conversion also failed." -ForegroundColor Red
            exit 1
        }
        
        Write-Host "Alternative path conversion successful: $wslPath" -ForegroundColor Green
    } else {
        Write-Host "Path conversion successful: $wslPath" -ForegroundColor Green
    }
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

Write-Host "`nAll checks completed!" -ForegroundColor Green
Write-Host "Please review the output and fix any issues identified by the tools." -ForegroundColor Cyan

# Step 4: Validate module structure (optional)
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

Write-Host "`nAll checks and validations completed!" -ForegroundColor Green
Write-Host "Please review the output and address any issues identified by the tools." -ForegroundColor Cyan

# Run Azure Module check if specified
if ($AzureModuleCheck) {
    $complianceScore = Test-AzureModuleCriterion -ModulePath $ModulePath -WslPath $wslPath -Distribution "$ubuntuDistro"
    
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
