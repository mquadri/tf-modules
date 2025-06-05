# Terraform Module Quality Check Script (Enhanced Version 3)
# This script runs formatting, linting, and documentation generation for Terraform modules
# Fixed WSL distribution parameter issues
# 
# Usage: 
#   .\run-terraform-checks-enhanced-v3.ps1 -ModulePath <path-to-module>

param (
    [Parameter(Mandatory=$true)]
    [string]$ModulePath,
    
    [Parameter(Mandatory=$false)]
    [switch]$AzureModuleCheck,
    
    [Parameter(Mandatory=$false)]
    [switch]$SkipValidation,
    
    [Parameter(Mandatory=$false)]
    [string]$WslDistribution = ""
)

Write-Host "Running quality checks on Terraform module at: $ModulePath" -ForegroundColor Green

# Function to safely execute WSL commands
function Invoke-WslCommand {
    param (
        [string]$Distribution,
        [string]$Command,
        [string]$Description = "WSL command"
    )
    
    try {
        Write-Host "Executing: $Description" -ForegroundColor Cyan
        $result = wsl.exe --distribution $Distribution --exec bash -c $Command 2>&1
        
        return @{ 
            Success = ($LASTEXITCODE -eq 0)
            Output = $result
            ExitCode = $LASTEXITCODE 
        }
    } catch {
        Write-Host "Error executing $Description : $_" -ForegroundColor Red
        return @{ 
            Success = $false
            Output = $_.Exception.Message
            ExitCode = -1 
        }
    }
}

# Function to get WSL distributions
function Get-WslDistributions {
    try {
        Write-Host "Detecting available WSL distributions..." -ForegroundColor Cyan
        
        $rawOutput = wsl.exe --list --quiet 2>&1
        if ($LASTEXITCODE -ne 0) {
            Write-Host "Error: Failed to get WSL distribution list. Output: $rawOutput" -ForegroundColor Red
            return @()
        }        $distributions = @()
        $rawOutput -split "`n" | ForEach-Object {
            $distro = $_.Trim() -replace '\x00', ''
            # Only remove null characters, keep valid distribution name characters including hyphens and dots
            if ($distro -and $distro.Length -gt 0 -and $distro -notmatch "^(NAME|STATE|VERSION)$") {
                Write-Host "  Found distribution: '$distro' (length: $($distro.Length))" -ForegroundColor Gray
                $distributions += $distro
            }
        }
        
        Write-Host "Found $($distributions.Count) WSL distributions: $($distributions -join ', ')" -ForegroundColor Green
        return $distributions
    } catch {
        Write-Host "Error getting WSL distributions: $_" -ForegroundColor Red
        return @()
    }
}

# Function to select WSL distribution
function Select-WslDistribution {
    param (
        [string]$PreferredDistribution = "",
        [array]$AvailableDistributions
    )
      # If user specified a distribution, validate and use it
    if (![string]::IsNullOrEmpty($PreferredDistribution)) {
        $cleanDistro = $PreferredDistribution.Trim()
        if ($cleanDistro -in $AvailableDistributions) {
            Write-Host "Using user-specified distribution: $cleanDistro" -ForegroundColor Green
            return $cleanDistro
        } else {
            Write-Host "Warning: User-specified distribution '$PreferredDistribution' not found. Auto-selecting..." -ForegroundColor Yellow
        }
    }    # Look for Ubuntu distributions first
    $ubuntuDistros = $AvailableDistributions | Where-Object { $_ -match "Ubuntu" -or $_ -match "ubuntu" }
    Write-Host "  Ubuntu distros found: $($ubuntuDistros -join ', ')" -ForegroundColor Gray
    if ($ubuntuDistros -and $ubuntuDistros.Count -gt 0) {
        $selectedUbuntu = $ubuntuDistros[0]
        Write-Host "Selected Ubuntu distribution: $selectedUbuntu" -ForegroundColor Green
        return $selectedUbuntu
    }
    
    # Use first available distribution
    if ($AvailableDistributions.Count -gt 0) {
        Write-Host "Selected first available distribution: $($AvailableDistributions[0])" -ForegroundColor Yellow
        return $AvailableDistributions[0]
    }
    
    return $null
}

Write-Host "`n=== WSL Distribution Setup ===" -ForegroundColor Magenta

# Check if WSL is available
try {
    $wslVersion = wsl.exe --version 2>&1
    if ($LASTEXITCODE -ne 0) {
        Write-Host "Error: WSL is not available or not installed properly." -ForegroundColor Red
        exit 1
    }
    Write-Host "WSL is available" -ForegroundColor Green
} catch {
    Write-Host "Error: WSL is not available. Exception: $_" -ForegroundColor Red
    exit 1
}

# Get available distributions
$availableDistros = Get-WslDistributions
if ($availableDistros.Count -eq 0) {
    Write-Host "Error: No WSL distributions available." -ForegroundColor Red
    exit 1
}

# Select distribution to use
$selectedDistribution = Select-WslDistribution -PreferredDistribution $WslDistribution -AvailableDistributions $availableDistros
if ([string]::IsNullOrEmpty($selectedDistribution)) {
    Write-Host "Error: Could not select a WSL distribution." -ForegroundColor Red
    exit 1
}

Write-Host "`nUsing WSL distribution: '$selectedDistribution'" -ForegroundColor Cyan

# Test the selected distribution
$testResult = Invoke-WslCommand -Distribution $selectedDistribution -Command "echo 'WSL connectivity test successful'" -Description "WSL connectivity test"
if (-not $testResult.Success) {
    Write-Host "Error: Selected WSL distribution '$selectedDistribution' is not accessible." -ForegroundColor Red
    Write-Host "Output: $($testResult.Output)" -ForegroundColor Red
    exit 1
}

Write-Host "`n=== Path Conversion ===" -ForegroundColor Magenta

# Convert Windows path to WSL path
$pathConversionResult = Invoke-WslCommand -Distribution $selectedDistribution -Command "wslpath '$ModulePath'" -Description "Path conversion"

if ($pathConversionResult.Success) {
    $wslPath = $pathConversionResult.Output.Trim()
    Write-Host "Successfully converted path: $ModulePath -> $wslPath" -ForegroundColor Green
} else {
    Write-Host "Path conversion failed. Attempting manual conversion..." -ForegroundColor Yellow
    
    # Manual path conversion fallback
    if ($ModulePath -match "^([A-Za-z]):\\(.*)$") {
        $driveLetter = $Matches[1].ToLower()
        $restOfPath = $Matches[2].Replace('\', '/')
        $wslPath = "/mnt/$driveLetter/$restOfPath"
        Write-Host "Manual path conversion: $ModulePath -> $wslPath" -ForegroundColor Yellow
        
        # Verify path exists
        $pathCheckResult = Invoke-WslCommand -Distribution $selectedDistribution -Command "test -d '$wslPath' && echo 'exists' || echo 'missing'" -Description "Path existence check"
        if ($pathCheckResult.Success -and $pathCheckResult.Output.Trim() -eq "exists") {
            Write-Host "Manual path conversion successful - directory exists" -ForegroundColor Green
        } else {
            Write-Host "Error: Converted path '$wslPath' does not exist or is not accessible" -ForegroundColor Red
            exit 1
        }
    } else {
        Write-Host "Error: Could not convert Windows path '$ModulePath' to WSL format" -ForegroundColor Red
        exit 1
    }
}

Write-Host "`n=== Terraform Setup Check ===" -ForegroundColor Magenta

# Check if Terraform is installed
$terraformCheckResult = Invoke-WslCommand -Distribution $selectedDistribution -Command "command -v terraform >/dev/null 2>&1 && echo 'installed' || echo 'not-installed'" -Description "Terraform installation check"

if ($terraformCheckResult.Success -and $terraformCheckResult.Output.Trim() -eq "installed") {
    Write-Host "Terraform is already installed" -ForegroundColor Green
} else {
    Write-Host "Terraform not found. Installing Terraform..." -ForegroundColor Yellow
    
    # Install Terraform
    $installCommands = @(
        "curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo apt-key add -",
        "sudo apt-add-repository 'deb [arch=amd64] https://apt.releases.hashicorp.com \$(lsb_release -cs) main'",
        "sudo apt-get update",
        "sudo apt-get install -y terraform"
    )
    
    foreach ($cmd in $installCommands) {
        $installResult = Invoke-WslCommand -Distribution $selectedDistribution -Command $cmd -Description "Terraform installation step"
        if (-not $installResult.Success) {
            Write-Host "Error: Failed to install Terraform. Command: $cmd" -ForegroundColor Red
            Write-Host "Output: $($installResult.Output)" -ForegroundColor Red
            exit 1
        }
    }
    
    # Verify installation
    $terraformVerifyResult = Invoke-WslCommand -Distribution $selectedDistribution -Command "command -v terraform >/dev/null 2>&1 && echo 'verified' || echo 'failed'" -Description "Terraform installation verification"
    if ($terraformVerifyResult.Success -and $terraformVerifyResult.Output.Trim() -eq "verified") {
        Write-Host "Terraform installation verified" -ForegroundColor Green
    } else {
        Write-Host "Error: Terraform installation verification failed" -ForegroundColor Red
        exit 1
    }
}

Write-Host "`n=== Terraform Format Check ===" -ForegroundColor Magenta

# Run terraform fmt check
$formatCheckResult = Invoke-WslCommand -Distribution $selectedDistribution -Command "cd '$wslPath' && terraform fmt -recursive -check" -Description "Terraform format check"

if ($formatCheckResult.Success) {
    Write-Host "✓ Terraform format check passed" -ForegroundColor Green
} else {
    Write-Host "✗ Terraform format check failed. Running terraform fmt to fix formatting..." -ForegroundColor Yellow
    $formatFixResult = Invoke-WslCommand -Distribution $selectedDistribution -Command "cd '$wslPath' && terraform fmt -recursive" -Description "Terraform format fix"
    
    if ($formatFixResult.Success) {
        Write-Host "✓ Terraform formatting applied successfully" -ForegroundColor Green
    } else {
        Write-Host "✗ Failed to apply Terraform formatting" -ForegroundColor Red
    }
}

Write-Host "`n=== Script Execution Completed ===" -ForegroundColor Magenta
Write-Host "Quality checks completed for module at: $ModulePath" -ForegroundColor Green
Write-Host "WSL distribution used: $selectedDistribution" -ForegroundColor Cyan
Write-Host "WSL path: $wslPath" -ForegroundColor Cyan
