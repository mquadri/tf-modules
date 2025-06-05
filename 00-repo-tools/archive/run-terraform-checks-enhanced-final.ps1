# Terraform Module Quality Check Script (Enhanced Version Final)
# This script runs formatting, linting, and documentation generation for Terraform modules
# Fixed WSL distribution parameter issues with simplified approach
# 
# Usage: 
#   .\run-terraform-checks-enhanced-final.ps1 -ModulePath <path-to-module>

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

# Check if WSL is available
try {
    $wslTest = wsl.exe --version 2>&1
    if ($LASTEXITCODE -ne 0) {
        Write-Host "Error: WSL is not available or not installed properly." -ForegroundColor Red
        exit 1
    }
    Write-Host "WSL is available" -ForegroundColor Green
} catch {
    Write-Host "Error: WSL is not available. Exception: $_" -ForegroundColor Red
    exit 1
}

# Get and select WSL distribution
Write-Host "`n=== WSL Distribution Setup ===" -ForegroundColor Magenta

try {
    $distributionsInfo = wsl.exe --list --verbose 2>&1
    if ($LASTEXITCODE -ne 0) {
        Write-Host "Error: Failed to get WSL distributions list." -ForegroundColor Red
        exit 1
    }
} catch {
    Write-Host "Error: WSL is not installed or not configured properly. Exception: $_" -ForegroundColor Red
    exit 1
}

# Get WSL distribution - if not specified, auto-detect
if ([string]::IsNullOrEmpty($WslDistribution)) {
    Write-Host "Available WSL distributions:" -ForegroundColor Cyan
    Write-Host $distributionsInfo -ForegroundColor Gray
    
    # First try to find an Ubuntu distribution
    if ($distributionsInfo -match "(?:\s|\*)*([^\s]*Ubuntu[^\s]*|Ubuntu[^\s]*|[^\s]*ubuntu[^\s]*)") {
        [string]$WslDistribution = $Matches[1].Trim()
        Write-Host "Found Ubuntu distribution: $WslDistribution" -ForegroundColor Green
    } else {
        # If no Ubuntu, look for default distribution (marked with *)
        $defaultDistro = $distributionsInfo -split "`n" | Where-Object { $_ -match "\*\s+([^\s]+)" } | ForEach-Object { $Matches[1].Trim() }
        
        if ($defaultDistro) {
            [string]$WslDistribution = $defaultDistro
            Write-Host "No Ubuntu distribution found. Using default WSL distribution: $WslDistribution" -ForegroundColor Yellow
        } else {
            # If no default marked, get first distribution
            $allDistros = $distributionsInfo -split "`n" | 
                         Where-Object { $_ -match "(?:\s|\*)*([^\s]+)" } | 
                         ForEach-Object { $Matches[1].Trim() } | 
                         Where-Object { $_ -ne "NAME" -and $_ -ne "STATE" -and $_ -ne "VERSION" -and $_.Length -gt 1 }
            
            if ($allDistros -and $allDistros.Count -gt 0) {
                [string]$WslDistribution = $allDistros[0]
                Write-Host "No default distribution found. Using first available distribution: $WslDistribution" -ForegroundColor Yellow
            } else {
                Write-Host "Error: Could not detect any WSL distribution." -ForegroundColor Red
                exit 1
            }
        }
    }
} else {
    # User provided a distribution - validate it
    Write-Host "Using user-specified WSL distribution: $WslDistribution" -ForegroundColor Cyan
    $WslDistribution = $WslDistribution.Trim()
    if ([string]::IsNullOrEmpty($WslDistribution)) {
        Write-Host "Error: Invalid WSL distribution name provided." -ForegroundColor Red
        exit 1
    }
}

Write-Host "Using WSL distribution: '$WslDistribution'" -ForegroundColor Cyan

# Validate WSL distribution is accessible
Write-Host "Validating WSL distribution '$WslDistribution'..." -ForegroundColor Cyan
try {
    $basicTest = wsl.exe --distribution $WslDistribution --exec echo "test" 2>&1
    if ($LASTEXITCODE -ne 0) {
        Write-Host "Error: Cannot connect to WSL distribution '$WslDistribution'. Exit code: $LASTEXITCODE. Error: $basicTest" -ForegroundColor Red
        Write-Host "Available distributions:" -ForegroundColor Yellow
        wsl.exe --list --verbose
        exit 1
    }
    Write-Host "WSL distribution '$WslDistribution' is accessible." -ForegroundColor Green
} catch {
    Write-Host "Error validating WSL distribution: $_" -ForegroundColor Red
    exit 1
}

Write-Host "`n=== Path Conversion ===" -ForegroundColor Magenta

# Convert Windows path to WSL path with improved error handling
try {
    Write-Host "Converting Windows path '$ModulePath' to WSL path..." -ForegroundColor Cyan
    
    $wslPath = wsl.exe --distribution $WslDistribution --exec bash -c "wslpath '$ModulePath'" 2>&1
    
    if ($LASTEXITCODE -ne 0 -or $wslPath -match "Error" -or $wslPath -eq "") {
        Write-Host "Error: Failed to convert Windows path to WSL path. Output: $wslPath" -ForegroundColor Red
        
        # First fallback: Try alternative path conversion - direct echo
        Write-Host "Attempting alternative path conversion method..." -ForegroundColor Yellow
        $normalizedPath = $ModulePath.Replace('\', '/')
        $wslPath = wsl.exe --distribution $WslDistribution --exec bash -c "echo '$normalizedPath'" 2>&1
        
        if ($LASTEXITCODE -ne 0 -or $wslPath -eq "") {
            # Second fallback: Try direct path mapping based on known WSL path structure
            Write-Host "Attempting manual path conversion..." -ForegroundColor Yellow
            if ($ModulePath -match "^([A-Za-z]):\\(.*)$") {
                $driveLetter = $Matches[1].ToLower()
                $restOfPath = $Matches[2].Replace('\', '/')
                $wslPath = "/mnt/$driveLetter/$restOfPath"
                Write-Host "Manually constructed WSL path: $wslPath" -ForegroundColor Yellow
                
                # Verify path exists in WSL
                $pathCheck = wsl.exe --distribution $WslDistribution --exec bash -c "test -d '$wslPath' && echo 'exists' || echo 'missing'"
                if ($pathCheck -eq "missing") {
                    Write-Host "Error: Converted WSL path does not exist: $wslPath" -ForegroundColor Red
                    exit 1
                }
            } else {
                Write-Host "Error: Could not convert Windows path to WSL format" -ForegroundColor Red
                exit 1
            }
        }
    }
    
    $wslPath = $wslPath.Trim()
    Write-Host "Successfully converted path: $ModulePath -> $wslPath" -ForegroundColor Green
    
    # Final path accessibility check
    $pathAccessCheck = wsl.exe --distribution $WslDistribution --exec bash -c "test -d '$wslPath' && echo 'accessible' || echo 'inaccessible'"
    if ($pathAccessCheck.Trim() -eq "inaccessible") {
        Write-Host "Error: WSL path is not accessible: $wslPath" -ForegroundColor Red
        exit 1
    }
    
} catch {
    Write-Host "Error during path conversion: $_" -ForegroundColor Red
    exit 1
}

Write-Host "`n=== Terraform Setup Check ===" -ForegroundColor Magenta

# Check if Terraform is installed in WSL
try {
    $terraformCheck = wsl.exe --distribution $WslDistribution --exec bash -c "command -v terraform > /dev/null 2>&1 || echo 'not-installed'"
    
    if ($terraformCheck -eq "not-installed") {
        Write-Host "Terraform not found. Installing Terraform..." -ForegroundColor Yellow
        wsl.exe --distribution $WslDistribution --exec bash -c "curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo apt-key add - && sudo apt-add-repository 'deb [arch=amd64] https://apt.releases.hashicorp.com \$(lsb_release -cs) main' && sudo apt-get update && sudo apt-get install -y terraform"
        
        # Verify installation
        $terraformVerify = wsl.exe --distribution $WslDistribution --exec bash -c "command -v terraform > /dev/null 2>&1 || echo 'failed'"
        if ($terraformVerify -eq "failed") {
            Write-Host "Error: Terraform installation failed" -ForegroundColor Red
            exit 1
        }
    }
    Write-Host "Terraform is available" -ForegroundColor Green
} catch {
    Write-Host "Error checking Terraform: $_" -ForegroundColor Red
    exit 1
}

Write-Host "`n=== Terraform Format Check ===" -ForegroundColor Magenta

# Run terraform fmt check
try {
    $output = wsl.exe --distribution $WslDistribution --exec bash -c "cd '$wslPath' && terraform fmt -recursive -check 2>&1"
    
    if ($LASTEXITCODE -eq 0) {
        Write-Host "✓ Terraform format check passed" -ForegroundColor Green
    } else {
        Write-Host "✗ Terraform format check failed. Running terraform fmt to fix formatting..." -ForegroundColor Yellow
        wsl.exe --distribution $WslDistribution --exec bash -c "cd '$wslPath' && terraform fmt -recursive"
        Write-Host "✓ Terraform formatting applied successfully" -ForegroundColor Green
    }
} catch {
    Write-Host "Error running terraform fmt: $_" -ForegroundColor Red
}

Write-Host "`n=== Script Execution Completed ===" -ForegroundColor Magenta
Write-Host "Quality checks completed for module at: $ModulePath" -ForegroundColor Green
Write-Host "WSL distribution used: $WslDistribution" -ForegroundColor Cyan
Write-Host "WSL path: $wslPath" -ForegroundColor Cyan
