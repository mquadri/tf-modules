# Terraform Module Quality Check Script (Docker Version)
# This script runs formatting, linting, and documentation generation for Terraform modules using Docker
# 
# Usage: 
#   .\run-terraform-checks-docker.ps1 -ModulePath <path-to-module>
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
            if ($dirCheck -eq "exists") {
                Write-Host "  ✓ $($req.Name) requirement passed" -ForegroundColor Green
                $passCount++
            } else {
                Write-Host "  ✗ $($req.Name) requirement failed - directory '$($req.File)' not found" -ForegroundColor Red
            }
        } else {
            # File and pattern check
            $fileCheck = docker run --rm -v "${ModulePath}:/workspace" -w /workspace $DockerImage sh -c "test -f '/$($req.File)' && echo 'exists' || echo 'missing'"
            
            if ($fileCheck -eq "exists") {
                if ($req.Pattern) {
                    # Check for pattern in file
                    $patternCheck = docker run --rm -v "${ModulePath}:/workspace" -w /workspace $DockerImage sh -c "grep -E '$($req.Pattern)' '/$($req.File)' > /dev/null 2>&1 && echo 'found' || echo 'notfound'"
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

# Pull the required Docker image
try {
    Write-Host "Pulling Docker image: $DockerImage..." -ForegroundColor Cyan
    docker pull $DockerImage 2>&1 | Out-Null
    if ($LASTEXITCODE -ne 0) {
        Write-Host "Error: Failed to pull Docker image: $DockerImage" -ForegroundColor Red
        exit 1
    }
    Write-Host "Docker image pulled successfully." -ForegroundColor Green
} catch {
    Write-Host "Error pulling Docker image: $_" -ForegroundColor Red
    exit 1
}

# Normalize the module path for Docker
$absoluteModulePath = (Resolve-Path $ModulePath).Path
$dockerPath = "/workspace"
Write-Host "Using Docker with volume mapping: $absoluteModulePath => $dockerPath" -ForegroundColor Cyan

# Create a temporary directory for output files with proper permissions
$tempOutputDir = Join-Path ([System.IO.Path]::GetTempPath()) ([System.Guid]::NewGuid().ToString())
New-Item -ItemType Directory -Path $tempOutputDir -Force | Out-Null
Write-Host "Created temporary directory for outputs: $tempOutputDir" -ForegroundColor Cyan

# Step 1: Run terraform fmt
Write-Host "`nStep 1: Running terraform fmt..." -ForegroundColor Yellow
try {
    # Run terraform fmt with the Docker container
    $output = docker run --rm -v "${absoluteModulePath}:${dockerPath}" -w $dockerPath $DockerImage sh -c "terraform fmt -recursive -check 2>&1"
    $status = $LASTEXITCODE
    
    if ($status -ne 0) {
        Write-Host "terraform fmt found formatting issues. Fixing..." -ForegroundColor Yellow
        docker run --rm -v "${absoluteModulePath}:${dockerPath}" -w $dockerPath $DockerImage sh -c "terraform fmt -recursive"
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
    # Create a custom Docker image with tflint for this step
    $tflintDockerfile = @"
FROM $DockerImage
RUN apk add --no-cache curl
RUN curl -s https://raw.githubusercontent.com/terraform-linters/tflint/master/install_linux.sh | bash
"@
    
    # Create a temporary directory for the Dockerfile
    $tempDir = [System.IO.Path]::GetTempPath() + [System.Guid]::NewGuid().ToString()
    New-Item -ItemType Directory -Path $tempDir -Force | Out-Null
    $tflintDockerfile | Out-File -FilePath "$tempDir/Dockerfile" -Encoding utf8
    
    # Build the custom image
    Write-Host "Building custom Docker image with tflint..." -ForegroundColor Cyan
    docker build -t terraform-tflint $tempDir 2>&1 | Out-Null
    
    # Run tflint
    Write-Host "Running tflint in directory: $dockerPath" -ForegroundColor Cyan
    $output = docker run --rm -v "${absoluteModulePath}:${dockerPath}" -w $dockerPath terraform-tflint sh -c "tflint --recursive 2>&1"
    $status = $LASTEXITCODE
    
    if ($output) {
        Write-Host $output -ForegroundColor Gray
    }
    
    if ($status -ne 0) {
        Write-Host "Warning: tflint found issues that need to be addressed." -ForegroundColor Yellow
    } else {
        Write-Host "tflint completed successfully with no issues." -ForegroundColor Green
    }
    
    # Clean up temp directory
    Remove-Item -Path $tempDir -Recurse -Force
} catch {
    Write-Host "Error running tflint: $_" -ForegroundColor Red
}

# Step 3: Run terraform-docs
Write-Host "`nStep 3: Running terraform-docs..." -ForegroundColor Yellow
try {
    # Create a custom Docker image with terraform-docs
    $terraformDocsDockerfile = @"
FROM $DockerImage
RUN apk add --no-cache curl tar
RUN curl -sSLo ./terraform-docs.tar.gz https://terraform-docs.io/dl/v0.16.0/terraform-docs-v0.16.0-linux-amd64.tar.gz && \
    tar -xzf terraform-docs.tar.gz && \
    chmod +x terraform-docs && \
    mv terraform-docs /usr/local/bin/ && \
    rm -f terraform-docs.tar.gz
"@
    
    # Create a temporary directory for the Dockerfile
    $tempDir = [System.IO.Path]::GetTempPath() + [System.Guid]::NewGuid().ToString()
    New-Item -ItemType Directory -Path $tempDir -Force | Out-Null
    $terraformDocsDockerfile | Out-File -FilePath "$tempDir/Dockerfile" -Encoding utf8
    
    # Build the custom image
    Write-Host "Building custom Docker image with terraform-docs..." -ForegroundColor Cyan
    docker build -t terraform-docs $tempDir 2>&1 | Out-Null
    
    # Run terraform-docs and output to temp directory to avoid permission issues
    Write-Host "Running terraform-docs in directory: $dockerPath" -ForegroundColor Cyan
    
    # Mount both the module directory and temp directory
    $output = docker run --rm `
        -v "${absoluteModulePath}:${dockerPath}" `
        -v "${tempOutputDir}:/output" `
        -w $dockerPath `
        --user root `
        terraform-docs sh -c "terraform-docs markdown table . > /output/README_GENERATED.md 2>&1 || echo 'Failed to write to output directory'" 
    $status = $LASTEXITCODE
    
    if ($status -ne 0 -or $output -like "*Failed to write*") {
        # Try a different approach if the first one failed
        $output = docker run --rm `
            -v "${absoluteModulePath}:${dockerPath}" `
            -v "${tempOutputDir}:/output" `
            -w $dockerPath `
            --user root `
            terraform-docs sh -c "terraform-docs markdown table . > /tmp/readme.md && cp /tmp/readme.md /output/README_GENERATED.md 2>&1"
        $status = $LASTEXITCODE
    }
    
    if ($status -ne 0) {
        Write-Host "Warning: terraform-docs had issues: $output" -ForegroundColor Yellow
    } else {
        # Copy the generated file from the temp directory to the module directory
        $readmeGeneratedPath = Join-Path $tempOutputDir "README_GENERATED.md"
        if (Test-Path $readmeGeneratedPath) {
            Copy-Item -Path $readmeGeneratedPath -Destination (Join-Path $absoluteModulePath "README_GENERATED.md") -Force
            Write-Host "terraform-docs completed successfully." -ForegroundColor Green
            Write-Host "Documentation generated to: README_GENERATED.md" -ForegroundColor Cyan
        } else {
            Write-Host "Warning: README_GENERATED.md file was not created in the output directory." -ForegroundColor Yellow
            
            # Check if it was created directly in the module directory
            $directReadmePath = Join-Path $absoluteModulePath "README_GENERATED.md"
            if (Test-Path $directReadmePath) {
                Write-Host "Documentation was generated directly in the module directory." -ForegroundColor Green
            } else {
                Write-Host "Warning: README_GENERATED.md file was not created in either location. Check for errors in terraform-docs execution." -ForegroundColor Yellow
            }
        }
    }
    
    # Clean up temp directory
    Remove-Item -Path $tempDir -Recurse -Force
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
            $fileCheck = docker run --rm -v "${absoluteModulePath}:${dockerPath}" -w $dockerPath $DockerImage sh -c "test -e '$file' && echo 'exists' || echo 'missing'"
            if ($fileCheck -eq "missing") {
                Write-Host "Warning: Essential file '$file' is missing from the module." -ForegroundColor Yellow
            } else {
                Write-Host "Essential file '$file' exists." -ForegroundColor Green
            }
        }
        
        # Check for recommended files
        Write-Host "`nChecking for recommended module files/directories..." -ForegroundColor Cyan
        foreach ($file in $recommendedFiles) {
            $fileCheck = docker run --rm -v "${absoluteModulePath}:${dockerPath}" -w $dockerPath $DockerImage sh -c "test -e '$file' && echo 'exists' || echo 'missing'"
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
if ($AzureModuleCheck) {    $complianceScore = Test-AzureModuleCriterion -ModulePath $absoluteModulePath -DockerPath $dockerPath -DockerImage $DockerImage
    
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

# Clean up the temporary directory if it exists
if (Test-Path $tempOutputDir) {
    Remove-Item -Path $tempOutputDir -Recurse -Force -ErrorAction SilentlyContinue
    Write-Host "Cleaned up temporary output directory." -ForegroundColor Cyan
}
