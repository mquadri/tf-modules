<#
.SYNOPSIS
    Terraform Module Provider Configuration Compliance Checker
    
.DESCRIPTION
    This script scans all Terraform modules in the workspace to check if they have proper provider configuration files.
    Validates compliance with Azure Terraform Module Catalog Criterion requirements for provider definitions.
    
    The script checks for the following provider configuration files (in order of preference):
    • versions.tf (recommended - Azure Terraform Module Catalog standard)
    • required_providers.tf (common alternative)
    • required-providers.tf (alternative with hyphen)
    • providers.tf (legacy pattern)
    • provider.tf (minimal pattern)
    
    For each module, it reports:
    • ✅ COMPLIANT - Has proper provider configuration
    • ⚠️  PARTIALLY COMPLIANT - Has some provider config but not ideal
    • ❌ NON-COMPLIANT - Missing provider configuration
    
.PARAMETER RootPath
    Specifies the root path to scan for Terraform modules.
    Defaults to the current directory if not specified.
    
.PARAMETER ExcludePatterns
    Array of directory patterns to exclude from scanning.
    Defaults to common patterns like "archive", "test", "examples", ".git"
    
.PARAMETER OutputFormat
    Controls the output format of the report.
    Valid values: "console", "csv", "json", "markdown"
    Default: "console"
    
.PARAMETER GenerateReport
    When specified, generates a detailed report file.
    
.PARAMETER VerboseOutput
    Provides detailed output including file contents analysis.
    
.EXAMPLE
    .\check-provider-files.ps1
    
    Scans the current directory for all Terraform modules and reports provider configuration compliance.
    
.EXAMPLE
    .\check-provider-files.ps1 -RootPath "C:\terraform\modules" -OutputFormat "csv"
    
    Scans a specific directory and outputs results in CSV format.
    
.EXAMPLE
    .\check-provider-files.ps1 -GenerateReport -OutputFormat "markdown"
    
    Generates a comprehensive markdown report of all modules' provider configuration status.
    
.NOTES
    Version: 1.0.0
    Author: Terraform Module Quality Team
    Created: $(Get-Date -Format "yyyy-MM-dd")
    
    Requirements:
    - PowerShell 5.1 or later
    - Read access to module directories
#>

[CmdletBinding()]
param (
    [Parameter(Mandatory=$false)]
    [string]$RootPath = ".",
    
    [Parameter(Mandatory=$false)]
    [string[]]$ExcludePatterns = @("archive", "test", "examples", ".git", ".github", "00-repo-tools", "assets"),
    
    [Parameter(Mandatory=$false)]
    [ValidateSet("console", "csv", "json", "markdown")]
    [string]$OutputFormat = "console",
      [Parameter(Mandatory=$false)]
    [switch]$GenerateReport,
    
    [Parameter(Mandatory=$false)]
    [switch]$VerboseOutput
)

# Configuration
$ProviderFiles = @(
    @{File="versions.tf"; Priority=1; Description="Recommended (Azure Terraform Module Catalog standard)"},
    @{File="required_providers.tf"; Priority=2; Description="Common alternative"},
    @{File="required-providers.tf"; Priority=3; Description="Alternative with hyphen"},
    @{File="providers.tf"; Priority=4; Description="Legacy pattern"},
    @{File="provider.tf"; Priority=5; Description="Minimal pattern"}
)

# Results collection
$Results = @()
$Summary = @{
    TotalModules = 0
    CompliantModules = 0
    PartiallyCompliantModules = 0
    NonCompliantModules = 0
    ProcessingErrors = 0
}

# Functions
function Write-Header {
    Write-Host @"

╔══════════════════════════════════════════════════════════════════════════════╗
║                    TERRAFORM PROVIDER CONFIGURATION CHECKER                  ║
║                     Azure Module Catalog Criterion Compliance               ║
╚══════════════════════════════════════════════════════════════════════════════╝

📁 Scanning Directory: $(Resolve-Path $RootPath)
🔍 Provider Files Checked: $(($ProviderFiles | ForEach-Object { $_.File }) -join ', ')
🚫 Excluded Patterns: $($ExcludePatterns -join ', ')

"@ -ForegroundColor Cyan
}

function Test-TerraformModule {
    param([string]$DirectoryPath)
    
    # Check if directory contains any .tf files
    $tfFiles = Get-ChildItem -Path $DirectoryPath -Filter "*.tf" -ErrorAction SilentlyContinue
    return ($tfFiles.Count -gt 0)
}

function Test-ProviderConfiguration {
    param([string]$ModulePath)
    
    $result = @{
        ModulePath = $ModulePath
        ModuleName = Split-Path $ModulePath -Leaf
        Status = "NON-COMPLIANT"
        ProviderFile = $null
        Priority = 999
        Description = ""
        HasTerraformBlock = $false
        HasRequiredProviders = $false
        ProviderDetails = @()
        Issues = @()
    }
    
    try {
        # Check each provider file in order of priority
        foreach ($providerFile in $ProviderFiles) {
            $filePath = Join-Path $ModulePath $providerFile.File
            
            if (Test-Path $filePath) {
                $result.ProviderFile = $providerFile.File
                $result.Priority = $providerFile.Priority
                $result.Description = $providerFile.Description
                
                # Analyze file content
                $content = Get-Content $filePath -Raw -ErrorAction SilentlyContinue
                if ($content) {
                    # Check for terraform block
                    if ($content -match 'terraform\s*\{') {
                        $result.HasTerraformBlock = $true
                    }
                    
                    # Check for required_providers
                    if ($content -match 'required_providers\s*\{') {
                        $result.HasRequiredProviders = $true
                    }                    # Extract provider information
                    $providerMatches = [regex]::Matches($content, '(\w+)\s*=\s*\{[^}]*source\s*=\s*["'']([^"'']+)["''][^}]*\}')
                    foreach ($match in $providerMatches) {
                        $result.ProviderDetails += @{
                            Name = $match.Groups[1].Value
                            Source = $match.Groups[2].Value
                        }
                    }
                }
                
                # Determine compliance status
                if ($result.HasTerraformBlock -and $result.HasRequiredProviders) {
                    if ($providerFile.Priority -le 2) {
                        $result.Status = "COMPLIANT"
                    } else {
                        $result.Status = "PARTIALLY_COMPLIANT"
                        $result.Issues += "Using non-preferred provider file name"
                    }
                } else {
                    $result.Status = "PARTIALLY_COMPLIANT"
                    if (-not $result.HasTerraformBlock) {
                        $result.Issues += "Missing terraform block"
                    }
                    if (-not $result.HasRequiredProviders) {
                        $result.Issues += "Missing required_providers block"
                    }
                }
                
                break # Found a provider file, stop looking
            }
        }
        
        # If no provider file found, check if there are provider blocks in main.tf
        if (-not $result.ProviderFile) {
            $mainTfPath = Join-Path $ModulePath "main.tf"
            if (Test-Path $mainTfPath) {
                $mainContent = Get-Content $mainTfPath -Raw -ErrorAction SilentlyContinue
                if ($mainContent -and ($mainContent -match 'terraform\s*\{.*?required_providers')) {
                    $result.Status = "PARTIALLY_COMPLIANT"
                    $result.ProviderFile = "main.tf"
                    $result.Priority = 6
                    $result.Description = "Provider config found in main.tf (should be separate file)"
                    $result.Issues += "Provider configuration should be in a separate file"
                    $result.HasTerraformBlock = $true
                    $result.HasRequiredProviders = $true
                }
            }
        }
        
    } catch {
        $result.Issues += "Error analyzing module: $($_.Exception.Message)"
        $Summary.ProcessingErrors++
    }
    
    return $result
}

function Get-ModuleDirectories {
    param([string]$RootPath)
    
    $moduleDirectories = @()
    
    try {
        $allDirectories = Get-ChildItem -Path $RootPath -Directory -ErrorAction SilentlyContinue
        
        foreach ($dir in $allDirectories) {
            # Skip excluded patterns
            $shouldExclude = $false
            foreach ($pattern in $ExcludePatterns) {
                if ($dir.Name -like "*$pattern*") {
                    $shouldExclude = $true
                    break
                }
            }
            
            if (-not $shouldExclude -and (Test-TerraformModule $dir.FullName)) {
                $moduleDirectories += $dir.FullName
            }
        }
    } catch {
        Write-Error "Error scanning directories: $($_.Exception.Message)"
    }
    
    return $moduleDirectories
}

function Format-ConsoleOutput {
    param([array]$Results)
    
    Write-Host "`n📊 " -ForegroundColor Blue -NoNewline
    Write-Host "SCAN RESULTS:" -ForegroundColor White -BackgroundColor DarkBlue
    Write-Host ""
    
    # Group results by status
    $compliant = $Results | Where-Object { $_.Status -eq "COMPLIANT" }
    $partiallyCompliant = $Results | Where-Object { $_.Status -eq "PARTIALLY_COMPLIANT" }
    $nonCompliant = $Results | Where-Object { $_.Status -eq "NON-COMPLIANT" }
    
    # Display compliant modules
    if ($compliant.Count -gt 0) {
        Write-Host "✅ " -ForegroundColor Green -NoNewline
        Write-Host "COMPLIANT MODULES ($($compliant.Count)):" -ForegroundColor Green
        foreach ($module in $compliant | Sort-Object ModuleName) {
            Write-Host "   📁 $($module.ModuleName) " -ForegroundColor Green -NoNewline
            Write-Host "→ $($module.ProviderFile) " -ForegroundColor Gray -NoNewline
            Write-Host "($($module.Description))" -ForegroundColor DarkGray
        }
        Write-Host ""
    }
    
    # Display partially compliant modules
    if ($partiallyCompliant.Count -gt 0) {
        Write-Host "⚠️  " -ForegroundColor Yellow -NoNewline
        Write-Host "PARTIALLY COMPLIANT MODULES ($($partiallyCompliant.Count)):" -ForegroundColor Yellow
        foreach ($module in $partiallyCompliant | Sort-Object ModuleName) {
            Write-Host "   📁 $($module.ModuleName) " -ForegroundColor Yellow -NoNewline
            Write-Host "→ $($module.ProviderFile) " -ForegroundColor Gray -NoNewline
            Write-Host "($($module.Description))" -ForegroundColor DarkGray
            if ($module.Issues.Count -gt 0) {
                foreach ($issue in $module.Issues) {
                    Write-Host "      ⚠️  $issue" -ForegroundColor DarkYellow
                }
            }
        }
        Write-Host ""
    }
    
    # Display non-compliant modules
    if ($nonCompliant.Count -gt 0) {
        Write-Host "❌ " -ForegroundColor Red -NoNewline
        Write-Host "NON-COMPLIANT MODULES ($($nonCompliant.Count)):" -ForegroundColor Red
        foreach ($module in $nonCompliant | Sort-Object ModuleName) {
            Write-Host "   📁 $($module.ModuleName) " -ForegroundColor Red -NoNewline
            Write-Host "→ No provider configuration found" -ForegroundColor DarkRed
            if ($module.Issues.Count -gt 0) {
                foreach ($issue in $module.Issues) {
                    Write-Host "      ❌ $issue" -ForegroundColor DarkRed
                }
            }
        }
        Write-Host ""
    }
}

function Format-Summary {
    param([hashtable]$Summary)
    
    $compliancePercentage = if ($Summary.TotalModules -gt 0) { 
        [math]::Round(($Summary.CompliantModules / $Summary.TotalModules) * 100, 1) 
    } else { 0 }
    
    Write-Host "📈 " -ForegroundColor Blue -NoNewline
    Write-Host "SUMMARY STATISTICS:" -ForegroundColor White -BackgroundColor DarkBlue
    Write-Host ""
    Write-Host "   📊 Total Modules Scanned: " -ForegroundColor White -NoNewline
    Write-Host "$($Summary.TotalModules)" -ForegroundColor Cyan
    Write-Host "   ✅ Fully Compliant: " -ForegroundColor Green -NoNewline
    Write-Host "$($Summary.CompliantModules)" -ForegroundColor Green
    Write-Host "   ⚠️  Partially Compliant: " -ForegroundColor Yellow -NoNewline
    Write-Host "$($Summary.PartiallyCompliantModules)" -ForegroundColor Yellow
    Write-Host "   ❌ Non-Compliant: " -ForegroundColor Red -NoNewline
    Write-Host "$($Summary.NonCompliantModules)" -ForegroundColor Red
    if ($Summary.ProcessingErrors -gt 0) {
        Write-Host "   🔥 Processing Errors: " -ForegroundColor Magenta -NoNewline
        Write-Host "$($Summary.ProcessingErrors)" -ForegroundColor Magenta
    }
    Write-Host ""
    Write-Host "   🎯 Compliance Rate: " -ForegroundColor White -NoNewline
    if ($compliancePercentage -ge 80) {
        Write-Host "$compliancePercentage%" -ForegroundColor Green -NoNewline
        Write-Host " (Excellent)" -ForegroundColor Green
    } elseif ($compliancePercentage -ge 60) {
        Write-Host "$compliancePercentage%" -ForegroundColor Yellow -NoNewline
        Write-Host " (Good)" -ForegroundColor Yellow
    } else {
        Write-Host "$compliancePercentage%" -ForegroundColor Red -NoNewline
        Write-Host " (Needs Improvement)" -ForegroundColor Red
    }
}

function Export-Results {
    param([array]$Results, [string]$Format)
    
    $timestamp = Get-Date -Format "yyyyMMdd_HHmmss"
    
    switch ($Format) {
        "csv" {
            $csvPath = "provider_compliance_report_$timestamp.csv"
            $Results | Select-Object ModuleName, Status, ProviderFile, Description, @{Name="Issues";Expression={$_.Issues -join "; "}} | 
                Export-Csv -Path $csvPath -NoTypeInformation
            Write-Host "📄 CSV report saved: " -ForegroundColor Cyan -NoNewline
            Write-Host "$csvPath" -ForegroundColor White
        }
        "json" {
            $jsonPath = "provider_compliance_report_$timestamp.json"
            $Results | ConvertTo-Json -Depth 10 | Out-File -FilePath $jsonPath -Encoding UTF8
            Write-Host "📄 JSON report saved: " -ForegroundColor Cyan -NoNewline
            Write-Host "$jsonPath" -ForegroundColor White
        }
        "markdown" {
            $markdownPath = "provider_compliance_report_$timestamp.md"
            Generate-MarkdownReport -Results $Results -FilePath $markdownPath
            Write-Host "📄 Markdown report saved: " -ForegroundColor Cyan -NoNewline
            Write-Host "$markdownPath" -ForegroundColor White
        }
    }
}

function Generate-MarkdownReport {
    param([array]$Results, [string]$FilePath)
    
    $compliancePercentage = if ($Summary.TotalModules -gt 0) { 
        [math]::Round(($Summary.CompliantModules / $Summary.TotalModules) * 100, 1) 
    } else { 0 }
    
    $markdown = @"
# Terraform Module Provider Configuration Compliance Report

**Generated:** $(Get-Date -Format "yyyy-MM-dd HH:mm:ss")  
**Root Path:** $(Resolve-Path $RootPath)  
**Total Modules:** $($Summary.TotalModules)  
**Compliance Rate:** $compliancePercentage%

## Summary

| Status | Count | Percentage |
|--------|-------|------------|
| ✅ Compliant | $($Summary.CompliantModules) | $([math]::Round(($Summary.CompliantModules / $Summary.TotalModules) * 100, 1))% |
| ⚠️ Partially Compliant | $($Summary.PartiallyCompliantModules) | $([math]::Round(($Summary.PartiallyCompliantModules / $Summary.TotalModules) * 100, 1))% |
| ❌ Non-Compliant | $($Summary.NonCompliantModules) | $([math]::Round(($Summary.NonCompliantModules / $Summary.TotalModules) * 100, 1))% |

## Module Details

| Module | Status | Provider File | Description | Issues |
|--------|--------|---------------|-------------|--------|
"@

    foreach ($result in $Results | Sort-Object ModuleName) {
        $statusIcon = switch ($result.Status) {
            "COMPLIANT" { "✅" }
            "PARTIALLY_COMPLIANT" { "⚠️" }
            "NON-COMPLIANT" { "❌" }
        }
        
        $issues = if ($result.Issues.Count -gt 0) { $result.Issues -join "; " } else { "-" }
        $providerFile = if ($result.ProviderFile) { $result.ProviderFile } else { "None" }
        
        $markdown += "`n| $($result.ModuleName) | $statusIcon $($result.Status) | $providerFile | $($result.Description) | $issues |"
    }
    
    $markdown += @"

## Recommendations

### For Non-Compliant Modules
1. Create a `versions.tf` file in each module directory
2. Include a `terraform` block with `required_providers`
3. Follow the Azure Terraform Module Catalog Criterion standards

### For Partially Compliant Modules
1. Review and address the issues listed above
2. Consider renaming provider files to `versions.tf` for consistency
3. Ensure all required provider blocks are properly defined

### Best Practices
- Use `versions.tf` as the preferred filename for provider configurations
- Include version constraints for all required providers
- Follow semantic versioning for provider constraints
- Regularly update provider versions for security patches

## Provider File Priority Order
1. `versions.tf` - Recommended (Azure Terraform Module Catalog standard)
2. `required_providers.tf` - Common alternative
3. `required-providers.tf` - Alternative with hyphen
4. `providers.tf` - Legacy pattern
5. `provider.tf` - Minimal pattern

---
*Report generated by Terraform Module Provider Configuration Compliance Checker v1.0.0*
"@

    $markdown | Out-File -FilePath $FilePath -Encoding UTF8
}

# Main execution
Write-Header

# Resolve root path
$RootPath = Resolve-Path $RootPath

# Get all module directories
Write-Host "🔍 Discovering Terraform modules..." -ForegroundColor Yellow
$moduleDirectories = Get-ModuleDirectories -RootPath $RootPath

if ($moduleDirectories.Count -eq 0) {
    Write-Host "❌ No Terraform modules found in the specified directory." -ForegroundColor Red
    Write-Host "💡 Make sure the directory contains subdirectories with .tf files." -ForegroundColor Yellow
    exit 1
}

Write-Host "📁 Found $($moduleDirectories.Count) Terraform modules to analyze..." -ForegroundColor Green
Write-Host ""

# Analyze each module
Write-Host "🔬 Analyzing provider configurations..." -ForegroundColor Yellow

$progressCount = 0
foreach ($moduleDir in $moduleDirectories) {    $progressCount++
    $moduleName = Split-Path $moduleDir -Leaf
    
    if ($VerboseOutput) {
        Write-Host "   [$progressCount/$($moduleDirectories.Count)] Analyzing $moduleName..." -ForegroundColor Gray
    }
    
    $result = Test-ProviderConfiguration -ModulePath $moduleDir
    $Results += $result
    
    # Update summary
    $Summary.TotalModules++
    switch ($result.Status) {
        "COMPLIANT" { $Summary.CompliantModules++ }
        "PARTIALLY_COMPLIANT" { $Summary.PartiallyCompliantModules++ }
        "NON-COMPLIANT" { $Summary.NonCompliantModules++ }
    }
}

Write-Host "✅ Analysis complete!" -ForegroundColor Green

# Output results
switch ($OutputFormat) {
    "console" {
        Format-ConsoleOutput -Results $Results
        Format-Summary -Summary $Summary
    }
    default {
        if ($GenerateReport) {
            Export-Results -Results $Results -Format $OutputFormat
        }
        Format-ConsoleOutput -Results $Results
        Format-Summary -Summary $Summary
    }
}

# Generate report if requested
if ($GenerateReport -and $OutputFormat -eq "console") {
    Export-Results -Results $Results -Format "markdown"
}

# Recommendations
Write-Host "`n💡 " -ForegroundColor Blue -NoNewline
Write-Host "RECOMMENDATIONS:" -ForegroundColor White -BackgroundColor DarkBlue
Write-Host ""

if ($Summary.NonCompliantModules -gt 0) {
    Write-Host "   🔧 For Non-Compliant Modules:" -ForegroundColor Red
    Write-Host "      • Create 'versions.tf' files with terraform and required_providers blocks" -ForegroundColor White
    Write-Host "      • Follow Azure Terraform Module Catalog Criterion standards" -ForegroundColor White
    Write-Host ""
}

if ($Summary.PartiallyCompliantModules -gt 0) {
    Write-Host "   ⚠️  For Partially Compliant Modules:" -ForegroundColor Yellow
    Write-Host "      • Review and address specific issues listed above" -ForegroundColor White
    Write-Host "      • Consider standardizing on 'versions.tf' filename" -ForegroundColor White
    Write-Host ""
}

Write-Host "   🎯 Next Steps:" -ForegroundColor Green
Write-Host "      • Use 'versions.tf' as the preferred provider configuration file" -ForegroundColor White
Write-Host "      • Run quality checks with: .\run-terraform-checks-fixed.ps1 -ModulePath <module>" -ForegroundColor White
Write-Host "      • Consider running with -GenerateReport for detailed documentation" -ForegroundColor White

Write-Host "`n🎉 Provider configuration compliance check completed!" -ForegroundColor Cyan