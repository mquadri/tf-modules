# Terraform Module Quality Check Script
# This script runs formatting, linting, and documentation generation for Terraform modules
# Usage: .\run-terraform-checks.ps1 -ModulePath <path-to-module>

param (
    [Parameter(Mandatory=$true)]
    [string]$ModulePath
)

Write-Host "Running quality checks on Terraform module at: $ModulePath" -ForegroundColor Green

# Check if module directory exists
if (-not (Test-Path $ModulePath)) {
    Write-Host "Error: Module path does not exist: $ModulePath" -ForegroundColor Red
    exit 1
}

# Check if WSL is installed
$wslCheck = wsl.exe --list
if ($LASTEXITCODE -ne 0) {
    Write-Host "Error: WSL is not installed or not configured properly." -ForegroundColor Red
    exit 1
}

# Check for Ubuntu distribution
$hasUbuntu = $false
wsl.exe --list | ForEach-Object {
    if ($_ -match "Ubuntu") {
        $hasUbuntu = $true
        $ubuntuDistro = $_.Trim()
    }
}

if (-not $hasUbuntu) {
    Write-Host "Error: No Ubuntu distribution found in WSL." -ForegroundColor Red
    exit 1
}

Write-Host "Using WSL distribution: $ubuntuDistro" -ForegroundColor Cyan

# Convert Windows path to WSL path
$wslPath = wsl.exe -d $ubuntuDistro -e bash -c "wslpath '$ModulePath'"
if ($LASTEXITCODE -ne 0) {
    Write-Host "Error: Failed to convert Windows path to WSL path." -ForegroundColor Red
    exit 1
}

# Step 1: Run terraform fmt
Write-Host "`nStep 1: Running terraform fmt..." -ForegroundColor Yellow
wsl.exe -d $ubuntuDistro -e bash -c "cd '$wslPath' && terraform fmt -recursive"
if ($LASTEXITCODE -ne 0) {
    Write-Host "Warning: terraform fmt had issues." -ForegroundColor Yellow
} else {
    Write-Host "terraform fmt completed successfully." -ForegroundColor Green
}

# Step 2: Run tflint
Write-Host "`nStep 2: Running tflint..." -ForegroundColor Yellow
$tflintResult = wsl.exe -d $ubuntuDistro -e bash -c "cd '$wslPath' && which tflint > /dev/null 2>&1 || echo 'not-installed'"
if ($tflintResult -eq "not-installed") {
    Write-Host "tflint is not installed. Installing now..." -ForegroundColor Cyan
    wsl.exe -d $ubuntuDistro -e bash -c "curl -s https://raw.githubusercontent.com/terraform-linters/tflint/master/install_linux.sh | bash"
}

wsl.exe -d $ubuntuDistro -e bash -c "cd '$wslPath' && tflint --recursive"
if ($LASTEXITCODE -ne 0) {
    Write-Host "Warning: tflint found issues that need to be addressed." -ForegroundColor Yellow
} else {
    Write-Host "tflint completed successfully with no issues." -ForegroundColor Green
}

# Step 3: Run terraform-docs
Write-Host "`nStep 3: Running terraform-docs..." -ForegroundColor Yellow
$terraformDocsResult = wsl.exe -d $ubuntuDistro -e bash -c "cd '$wslPath' && which terraform-docs > /dev/null 2>&1 || echo 'not-installed'"
if ($terraformDocsResult -eq "not-installed") {
    Write-Host "terraform-docs is not installed. Installing now..." -ForegroundColor Cyan
    wsl.exe -d $ubuntuDistro -e bash -c "mkdir -p ~/bin && curl -sSLo ./terraform-docs.tar.gz https://terraform-docs.io/dl/v0.16.0/terraform-docs-v0.16.0-linux-amd64.tar.gz && tar -xzf terraform-docs.tar.gz && chmod +x terraform-docs && mv terraform-docs ~/bin/ && export PATH=~/bin:\$PATH && echo 'export PATH=~/bin:\$PATH' >> ~/.bashrc"
}

wsl.exe -d $ubuntuDistro -e bash -c "cd '$wslPath' && export PATH=~/bin:\$PATH && terraform-docs markdown table . > README_GENERATED.md"
if ($LASTEXITCODE -ne 0) {
    Write-Host "Warning: terraform-docs had issues." -ForegroundColor Yellow
} else {
    Write-Host "terraform-docs completed successfully." -ForegroundColor Green
    Write-Host "Documentation generated to: README_GENERATED.md" -ForegroundColor Cyan
}

Write-Host "`nAll checks completed!" -ForegroundColor Green
Write-Host "Please review the output and fix any issues identified by the tools." -ForegroundColor Cyan
