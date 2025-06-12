# Docker Permission Test Script for PowerShell
# This script helps diagnose permission issues with Docker volume mounts
# Usage: .\test-docker-permissions.ps1 -ModulePath <module-path>

param (
    [Parameter(Mandatory=$true)]
    [string]$ModulePath
)

# Check if module directory exists
if (-not (Test-Path $ModulePath)) {
    Write-Host "Error: Module path does not exist: $ModulePath" -ForegroundColor Red
    exit 1
}

# Resolve to absolute path
$absoluteModulePath = (Resolve-Path $ModulePath).Path

Write-Host "Running Docker permission tests for directory: $absoluteModulePath" -ForegroundColor Cyan

# Test writing to various locations
Write-Host "Testing Docker container file permissions..." -ForegroundColor Yellow

# Create temp dir for output
$tempOutputDir = Join-Path ([System.IO.Path]::GetTempPath()) ([System.Guid]::NewGuid().ToString())
New-Item -ItemType Directory -Path $tempOutputDir -Force | Out-Null
Write-Host "Created temporary directory: $tempOutputDir" -ForegroundColor Cyan

# Run Docker container with test commands
Write-Host "Starting Docker test container..." -ForegroundColor Green
$dockerCmd = @"
docker run --rm `
    -v "${absoluteModulePath}:/workspace" `
    -v "${tempOutputDir}:/output" `
    --user root `
    alpine:latest sh -c "
        echo 'Testing permissions in Docker container'
        echo '======================================='
        
        echo 'Directory structure:'
        ls -la /
        echo ''
        
        echo 'Workspace directory structure:'
        ls -la /workspace
        echo ''
        
        echo 'Output directory structure:'
        ls -la /output
        echo ''
        
        echo 'Testing write permissions...'
        
        echo 'Test 1: Writing to /tmp'
        if touch /tmp/test-file.txt 2>/dev/null; then
            echo '✅ Success: Can write to /tmp'
        else
            echo '❌ Error: Cannot write to /tmp'
        fi
        
        echo 'Test 2: Writing to /workspace'
        if touch /workspace/test-file.txt 2>/dev/null; then
            echo '✅ Success: Can write to /workspace'
        else
            echo '❌ Error: Cannot write to /workspace'
        fi
        
        echo 'Test 3: Writing to /output'
        if touch /output/test-file.txt 2>/dev/null; then
            echo '✅ Success: Can write to /output'
        else
            echo '❌ Error: Cannot write to /output'
        fi
        
        echo 'Test 4: Creating subdirectory in /workspace'
        if mkdir -p /workspace/test-dir 2>/dev/null; then
            echo '✅ Success: Can create directory in /workspace'
        else
            echo '❌ Error: Cannot create directory in /workspace'
        fi
        
        echo 'Test 5: Creating mock README file'
        mkdir -p /tmp/terraform-docs-output
        echo 'Output from terraform-docs (this is a mock)' > /tmp/terraform-docs-output/README_GENERATED.md
        
        echo 'Test 6: Copying from /tmp to /workspace'
        if cp /tmp/terraform-docs-output/README_GENERATED.md /workspace/README_GENERATED.md 2>/dev/null; then
            echo '✅ Success: Can copy from /tmp to /workspace'
        else
            echo '❌ Error: Cannot copy from /tmp to /workspace'
        fi
        
        echo 'Test 7: Copying from /tmp to /output'
        if cp /tmp/terraform-docs-output/README_GENERATED.md /output/README_GENERATED.md 2>/dev/null; then
            echo '✅ Success: Can copy from /tmp to /output'
        else
            echo '❌ Error: Cannot copy from /tmp to /output'
        fi
        
        echo '======================================='
        echo 'Permission test completed'
    "
"@

Invoke-Expression $dockerCmd

# Check if test files were created
Write-Host "`nChecking test files in module directory..." -ForegroundColor Yellow
if (Test-Path (Join-Path $absoluteModulePath "test-file.txt")) {
    Write-Host "✅ test-file.txt was created in the module directory" -ForegroundColor Green
    # Clean up test file
    Remove-Item (Join-Path $absoluteModulePath "test-file.txt") -Force -ErrorAction SilentlyContinue
} else {
    Write-Host "❌ test-file.txt was NOT created in the module directory" -ForegroundColor Red
}

if (Test-Path (Join-Path $absoluteModulePath "README_GENERATED.md")) {
    Write-Host "✅ README_GENERATED.md was created in the module directory" -ForegroundColor Green
    # Clean up test file
    Remove-Item (Join-Path $absoluteModulePath "README_GENERATED.md") -Force -ErrorAction SilentlyContinue
} else {
    Write-Host "❌ README_GENERATED.md was NOT created in the module directory" -ForegroundColor Red
}

if (Test-Path (Join-Path $absoluteModulePath "test-dir")) {
    Write-Host "✅ test-dir was created in the module directory" -ForegroundColor Green
    # Clean up test directory
    Remove-Item (Join-Path $absoluteModulePath "test-dir") -Force -Recurse -ErrorAction SilentlyContinue
} else {
    Write-Host "❌ test-dir was NOT created in the module directory" -ForegroundColor Red
}

Write-Host "`nChecking test files in temp output directory..." -ForegroundColor Yellow
if (Test-Path (Join-Path $tempOutputDir "test-file.txt")) {
    Write-Host "✅ test-file.txt was created in the output directory" -ForegroundColor Green
} else {
    Write-Host "❌ test-file.txt was NOT created in the output directory" -ForegroundColor Red
}

if (Test-Path (Join-Path $tempOutputDir "README_GENERATED.md")) {
    Write-Host "✅ README_GENERATED.md was created in the output directory" -ForegroundColor Green
} else {
    Write-Host "❌ README_GENERATED.md was NOT created in the output directory" -ForegroundColor Red
}

# Clean up the temp directory
if (Test-Path $tempOutputDir) {
    Remove-Item -Path $tempOutputDir -Recurse -Force -ErrorAction SilentlyContinue
    Write-Host "Cleaned up temporary output directory." -ForegroundColor Cyan
}

Write-Host "`nTest completed. Use this information to diagnose permission issues with Docker volume mounts." -ForegroundColor Green
