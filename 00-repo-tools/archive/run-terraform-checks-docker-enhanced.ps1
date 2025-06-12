# Terraform Module Quality Check Script (Docker Enhanced Version)
# This script runs formatting, linting, and documentation generation for Terraform modules using Docker
# 
# Usage: 
#   .\run-terraform-checks-docker-enhanced.ps1 -ModulePath <path-to-module>
#
# Parameters:
#   -ModulePath         : (Required) Path to the Terraform module to check
#   -AzureModuleCheck   : (Optional) Check if module follows Azure Terraform Module Catalog Criterion
#   -SkipValidation     : (Optional) Skip the module structure validation checks
#   -DockerImage        : (Optional) Docker image to use (default: hashicorp/terraform:latest)

param (
    [Parameter(Mandatory=$true)]
    [string]$ModulePath,
    
    [Parameter(Mandatory=$false)]
    [switch]$AzureModuleCheck,
    
    [Parameter(Mandatory=$false)]
    [switch]$SkipValidation,
    
    [Parameter(Mandatory=$false)]
    [string]$DockerImage = "hashicorp/terraform:latest"
)

Write-Host "Running quality checks on Terraform module at: $ModulePath" -ForegroundColor Green

# Function to check if module follows Azure Terraform Module Catalog Criterion
function Test-AzureModuleCriterion {
    param (
        [string]$ModulePath,
        [string]$DockerPath,
        [string]$DockerImage
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
            $dirCheck = docker run --rm -v "${ModulePath}:/workspace" -w /workspace $DockerImage sh -c "test -d '/$($req.File)' && echo 'exists' || echo 'missing'"
            if ($dirCheck.Trim() -eq "exists") {
                Write-Host "  ✓ $($req.Name) requirement passed" -ForegroundColor Green
                $passCount++
            } else {
                Write-Host "  ✗ $($req.Name) requirement failed - directory '$($req.File)' not found" -ForegroundColor Red
            }
        } else {
            # File and pattern check
            $fileCheck = docker run --rm -v "${ModulePath}:/workspace" -w /workspace $DockerImage sh -c "test -f '/workspace/$($req.File)' && echo 'exists' || echo 'missing'"
            if ($fileCheck.Trim() -eq "exists") {
                if ($req.Pattern) {
                    # Fix pattern quoting for grep in Docker - use single quotes for bash pattern
                    $patternCheck = docker run --rm -v "${ModulePath}:/workspace" -w /workspace $DockerImage sh -c "grep -E '$($req.Pattern)' '/workspace/$($req.File)' > /dev/null 2>&1 && echo 'found' || echo 'notfound'"
                    if ($patternCheck.Trim() -eq "found") {
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

# Get absolute path for better Docker volume mounting
$absoluteModulePath = (Resolve-Path $ModulePath).Path
Write-Host "Using absolute module path: $absoluteModulePath" -ForegroundColor Cyan

# Check if Docker is installed and running
try {
    $dockerStatus = docker info 2>&1
    if ($LASTEXITCODE -ne 0) {
        Write-Host "Error: Docker is not running or not configured properly." -ForegroundColor Red
        exit 1
    }
    
    Write-Host "Docker is available. Proceeding with checks..." -ForegroundColor Green
} catch {
    Write-Host "Error: Docker is not installed or not running. Exception: $_" -ForegroundColor Red
    exit 1
}

# Check if Docker image exists or pull it
try {
    $imageCheck = docker images --format "{{.Repository}}:{{.Tag}}" | Where-Object { $_ -eq $DockerImage }
    if (-not $imageCheck) {
        Write-Host "Docker image '$DockerImage' not found locally. Pulling from Docker Hub..." -ForegroundColor Yellow
        docker pull $DockerImage
        if ($LASTEXITCODE -ne 0) {
            Write-Host "Error: Failed to pull Docker image '$DockerImage'." -ForegroundColor Red
            exit 1
        }
    }
} catch {
    Write-Host "Error checking Docker image: $_" -ForegroundColor Red
    exit 1
}

# Step 1: Run terraform fmt
Write-Host "`nStep 1: Running terraform fmt..." -ForegroundColor Yellow
try {
    # Run terraform fmt in Docker
    $output = docker run --rm -v "${absoluteModulePath}:/workspace" -w /workspace $DockerImage terraform fmt -recursive -check
    $status = $LASTEXITCODE
    
    if ($status -ne 0) {
        Write-Host "terraform fmt found formatting issues. Fixing..." -ForegroundColor Yellow
        docker run --rm -v "${absoluteModulePath}:/workspace" -w /workspace $DockerImage terraform fmt -recursive
        Write-Host "Formatting fixed with terraform fmt." -ForegroundColor Green
    } else {
        Write-Host "terraform fmt check completed successfully. No formatting issues found." -ForegroundColor Green
    }
} catch {
    Write-Host "Error running terraform fmt: $_" -ForegroundColor Red
}

# Step 2: Run tflint (if available in the Docker image)
Write-Host "`nStep 2: Running tflint..." -ForegroundColor Yellow
try {
    # Check if tflint is available in the image
    $tflintCheck = docker run --rm $DockerImage sh -c "command -v tflint > /dev/null 2>&1 || echo 'not-installed'"
    if ($tflintCheck.Trim() -eq "not-installed") {
        Write-Host "tflint is not available in this Docker image. Using a custom command..." -ForegroundColor Yellow
        
        # Create a temporary tflint configuration file
        $tflintConfigContent = @"
plugin "terraform" {
  enabled = true
  preset  = "recommended"
}
"@
        $tflintConfigPath = Join-Path $absoluteModulePath ".tflint.hcl"
        $tflintConfigPath | Out-File -FilePath $tflintConfigPath -Encoding utf8 -Force
        
        # Run tflint in a dedicated tflint image
        docker run --rm -v "${absoluteModulePath}:/data" ghcr.io/terraform-linters/tflint-bundle:latest --recursive
        $tflintStatus = $LASTEXITCODE
        
        # Remove temporary config file
        if (Test-Path $tflintConfigPath) {
            Remove-Item -Path $tflintConfigPath -Force
        }
        
        if ($tflintStatus -ne 0) {
            Write-Host "Warning: tflint found issues that need to be addressed." -ForegroundColor Yellow
        } else {
            Write-Host "tflint completed successfully with no issues." -ForegroundColor Green
        }
    } else {
        # Run tflint from the main Docker image
        $output = docker run --rm -v "${absoluteModulePath}:/workspace" -w /workspace $DockerImage tflint --recursive
        $status = $LASTEXITCODE
        
        if ($status -ne 0) {
            Write-Host "Warning: tflint found issues that need to be addressed." -ForegroundColor Yellow
        } else {
            Write-Host "tflint completed successfully with no issues." -ForegroundColor Green
        }
    }
} catch {
    Write-Host "Error running tflint: $_" -ForegroundColor Red
}

# Step 3: Run terraform-docs
Write-Host "`nStep 3: Running terraform-docs..." -ForegroundColor Yellow
try {
    # Create a temporary output directory with full permissions
    $tempOutputDir = Join-Path ([System.IO.Path]::GetTempPath()) ([System.Guid]::NewGuid().ToString())
    New-Item -ItemType Directory -Path $tempOutputDir -Force | Out-Null
    Write-Host "Created temporary output directory: $tempOutputDir" -ForegroundColor Cyan
    
    # Run terraform-docs in a dedicated Docker image
    $output = docker run --rm -v "${absoluteModulePath}:/terraform-docs" -v "${tempOutputDir}:/output" quay.io/terraform-docs/terraform-docs:latest markdown table /terraform-docs > "$tempOutputDir/README_GENERATED.md"
    $status = $LASTEXITCODE
    
    if ($status -ne 0) {
        Write-Host "Warning: terraform-docs had issues generating documentation." -ForegroundColor Yellow
    } else {
        Write-Host "terraform-docs completed successfully." -ForegroundColor Green
        
        # Check if the file was created in the temp directory
        if (Test-Path "$tempOutputDir/README_GENERATED.md") {
            # Copy the file to the module directory
            Copy-Item -Path "$tempOutputDir/README_GENERATED.md" -Destination "$absoluteModulePath/README_GENERATED.md" -Force
            Write-Host "Documentation generated to: $absoluteModulePath/README_GENERATED.md" -ForegroundColor Cyan
        } else {
            Write-Host "Warning: README_GENERATED.md file was not created. Check for errors in terraform-docs execution." -ForegroundColor Yellow
        }
    }
    
    # Clean up the temporary directory
    if (Test-Path $tempOutputDir) {
        Remove-Item -Path $tempOutputDir -Recurse -Force -ErrorAction SilentlyContinue
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
            $fileCheck = docker run --rm -v "${absoluteModulePath}:/workspace" -w /workspace $DockerImage sh -c "test -e '$file' && echo 'exists' || echo 'missing'"
            if ($fileCheck.Trim() -eq "missing") {
                Write-Host "Warning: Essential file '$file' is missing from the module." -ForegroundColor Yellow
            } else {
                Write-Host "Essential file '$file' exists." -ForegroundColor Green
            }
        }
        
        # Check for recommended files
        Write-Host "`nChecking for recommended module files/directories..." -ForegroundColor Cyan
        foreach ($file in $recommendedFiles) {
            $fileCheck = docker run --rm -v "${absoluteModulePath}:/workspace" -w /workspace $DockerImage sh -c "test -e '$file' && echo 'exists' || echo 'missing'"
            if ($fileCheck.Trim() -eq "missing") {
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
    $complianceScore = Test-AzureModuleCriterion -ModulePath $absoluteModulePath -DockerPath "/workspace" -DockerImage $DockerImage
    
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
