# Simple test script
param (
    [Parameter(Mandatory=$true)]
    [string]$ModulePath
)

Write-Host "Test script running with ModulePath: $ModulePath" -ForegroundColor Green
Write-Host "Script execution completed successfully" -ForegroundColor Cyan
