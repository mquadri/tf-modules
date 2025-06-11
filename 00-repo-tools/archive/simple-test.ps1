<#
.SYNOPSIS
    Test script for running SuperLinter via Docker
#>

# Get current directory as test module path
$scriptPath = Split-Path -Parent $MyInvocation.MyCommand.Path
$testModulePath = Join-Path (Split-Path -Parent $scriptPath) "test-module"

Write-Host "Running test for the Docker-based SuperLinter solution" -ForegroundColor Cyan
Write-Host "Testing with module: $testModulePath" -ForegroundColor Cyan
Write-Host "This script will test the fixed docker integration and bypass the sudo password prompt"

# Call the Docker-based solution script
$dockerScriptPath = Join-Path $scriptPath "run-checks-with-docker.ps1"
& $dockerScriptPath -ModulePath $testModulePath
