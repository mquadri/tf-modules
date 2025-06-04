# Docker Build and Run Script for Terraform Module Checks
# This script builds the Docker image and runs the terraform module checks
# 
# Usage: 
#   .\run-checks-with-docker.ps1 -ModulePath <path-to-module>
#
# Parameters:
#   -ModulePath        : (Required) Path to the Terraform module to check
#   -RebuildImage      : (Optional) Rebuild the Docker image even if it already exists
#   -ImageName         : (Optional) Name for the Docker image (default: terraform-quality-checks)

param (
    [Parameter(Mandatory=$true)]
    [string]$ModulePath,
    
    [Parameter(Mandatory=$false)]
    [switch]$RebuildImage,
    
    [Parameter(Mandatory=$false)]
    [string]$ImageName = "terraform-quality-checks"
)

# Check if module directory exists
if (-not (Test-Path $ModulePath)) {
    Write-Host "Error: Module path does not exist: $ModulePath" -ForegroundColor Red
    exit 1
}

# Resolve to absolute path
$absoluteModulePath = (Resolve-Path $ModulePath).Path
$scriptDir = $PSScriptRoot

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

# Build or rebuild the Docker image
$imageExists = docker images --format "{{.Repository}}" | Where-Object { $_ -eq $ImageName }

if (-not $imageExists -or $RebuildImage) {
    Write-Host "Building Docker image: $ImageName..." -ForegroundColor Cyan
    docker build -t $ImageName -f "$scriptDir/Dockerfile" "$scriptDir"
    if ($LASTEXITCODE -ne 0) {
        Write-Host "Error: Failed to build Docker image." -ForegroundColor Red
        exit 1
    }
    Write-Host "Docker image built successfully." -ForegroundColor Green
} else {
    Write-Host "Using existing Docker image: $ImageName" -ForegroundColor Green
}

# Run the Docker container with the module mounted
Write-Host "Running checks for module: $absoluteModulePath" -ForegroundColor Cyan

# Create temporary output directory with full permissions
$tempOutputDir = Join-Path ([System.IO.Path]::GetTempPath()) ([System.Guid]::NewGuid().ToString())
New-Item -ItemType Directory -Path $tempOutputDir -Force | Out-Null
Write-Host "Created temporary output directory: $tempOutputDir" -ForegroundColor Cyan

# Check if the shell script exists in the module directory
if (-not (Test-Path "$absoluteModulePath/run-terraform-checks.sh")) {
    # Copy the shell script to the module directory
    Write-Host "Copying run-terraform-checks.sh to module directory..." -ForegroundColor Yellow
    Copy-Item "$scriptDir/run-terraform-checks.sh" -Destination "$absoluteModulePath"
}

# Run the Docker command with proper permissions
$dockerCmd = "docker run --rm -v `"${absoluteModulePath}:/workspace`" -v `"${tempOutputDir}:/output`" --user root $ImageName /bin/bash -c `"cd /workspace && chmod +x /workspace/run-terraform-checks.sh && /workspace/run-terraform-checks.sh /workspace`""

# Run the Docker command
Write-Host "Executing Docker container..." -ForegroundColor Green
Invoke-Expression $dockerCmd

# Check if README_GENERATED.md was created in the temp output directory
$tempReadmePath = Join-Path $tempOutputDir "README_GENERATED.md"
if (Test-Path $tempReadmePath) {
    Write-Host "README_GENERATED.md found in temp directory. Copying to module directory..." -ForegroundColor Cyan
    Copy-Item -Path $tempReadmePath -Destination (Join-Path $absoluteModulePath "README_GENERATED.md") -Force
    Write-Host "README_GENERATED.md copied to module directory successfully." -ForegroundColor Green
} else {
    Write-Host "README_GENERATED.md not found in temp directory. Checking if it was created directly in the workspace..." -ForegroundColor Yellow
    if (Test-Path (Join-Path $absoluteModulePath "README_GENERATED.md")) {
        Write-Host "README_GENERATED.md found in workspace directory." -ForegroundColor Green
    } else {
        Write-Host "Warning: README_GENERATED.md was not created in either location. There might be an issue with terraform-docs." -ForegroundColor Red
    }
}

# Clean up by removing the shell script if we copied it
if (Test-Path "$absoluteModulePath/run-terraform-checks.sh") {
    if ((Get-Item "$absoluteModulePath/run-terraform-checks.sh").CreationTime -gt (Get-Date).AddMinutes(-5)) {
        Write-Host "Removing temporary shell script..." -ForegroundColor Yellow
        Remove-Item "$absoluteModulePath/run-terraform-checks.sh"
    }
}

# Clean up the temporary output directory
if (Test-Path $tempOutputDir) {
    Write-Host "Cleaning up temporary output directory..." -ForegroundColor Yellow
    Remove-Item -Path $tempOutputDir -Recurse -Force -ErrorAction SilentlyContinue
}

Write-Host "Check process completed!" -ForegroundColor Green
