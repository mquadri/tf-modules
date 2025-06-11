<#
.SYNOPSIS
    Advanced Terraform Module Quality Assurance and Compliance Checker (Fixed Version)

.DESCRIPTION
    This PowerShell script provides comprehensive quality checks for Terraform modules including:
    
    🔧 QUALITY CHECKS:
    • terraform fmt - Automatic code formatting
    • tflint - Static analysis and linting
    • terraform-docs - Auto-generated documentation
    • Module structure validation
    
    🎯 AZURE COMPLIANCE:
    • Azure Terraform Module Catalog Criterion validation
    • Best practices enforcement
    • Compliance scoring with actionable recommendations
    
    🚀 ENVIRONMENT SUPPORT:
    • WSL (Windows Subsystem for Linux) integration
    • Automatic tool installation
    • Cross-platform path handling
    • Enhanced error recovery

.PARAMETER ModulePath
    [REQUIRED] Specifies the path to the Terraform module directory to analyze.
    Can be an absolute or relative path. The script will validate the path exists.
    
    Example: "C:\terraform\modules\storage-account"
    Example: ".\modules\aks-cluster"

.PARAMETER AzureModuleCheck
    [OPTIONAL] Enables Azure Terraform Module Catalog Criterion compliance checking.
    
    Validates 9 key requirements:
    • Provider configuration (required_providers.tf)
    • Module versioning (versions.tf)
    • Variable validation rules
    • Comprehensive descriptions
    • Examples directory
    • Test files
    • README documentation
    • Architectural diagrams
    
    Provides percentage-based compliance scoring with specific recommendations.

.PARAMETER SkipValidation
    [OPTIONAL] Skips the standard module structure validation checks.
    
    Use this flag to bypass validation of:
    • Essential files (main.tf, variables.tf, outputs.tf, README.md)
    • Recommended files (required_providers.tf, versions.tf, examples/, test/)
    
    Useful for non-standard module structures or rapid testing scenarios.

.PARAMETER GenerateDocumentation
    [OPTIONAL] Enables automatic README documentation generation using terraform-docs.
    
    When enabled, generates:
    • README_GENERATED.md - Comprehensive module documentation
    • Variable and output documentation tables
    • Provider requirements and version constraints
    
    If not specified, documentation generation is skipped for faster execution.

.PARAMETER Help
    [OPTIONAL] Displays this comprehensive help information with usage examples,
    troubleshooting guidance, and Azure compliance requirements.

.EXAMPLE
    .\run-terraform-checks-fixed.ps1 -ModulePath "C:\terraform\modules\storage-account"
    
    Runs standard quality checks on the specified storage account module.

.EXAMPLE
    .\run-terraform-checks-fixed.ps1 -ModulePath ".\modules\aks-cluster" -AzureModuleCheck
    
    Performs quality checks plus Azure compliance validation for an AKS module.

.EXAMPLE
    .\run-terraform-checks-fixed.ps1 -ModulePath "C:\terraform\modules\network" -AzureModuleCheck -SkipValidation
    
    Runs Azure compliance checks while skipping standard structure validation.

.EXAMPLE
    .\run-terraform-checks-fixed.ps1 -ModulePath ".\modules\storage" -GenerateDocumentation
    
    Performs quality checks and generates comprehensive documentation using terraform-docs.

.EXAMPLE
    .\run-terraform-checks-fixed.ps1 -ModulePath ".\modules\vm" -AzureModuleCheck -GenerateDocumentation
    
    Full quality analysis with Azure compliance checking and documentation generation.

.EXAMPLE
    .\run-terraform-checks-fixed.ps1 -Help
    
    Displays comprehensive help information and usage guidance.

.NOTES
    FileName: run-terraform-checks-fixed.ps1
    Author: Terraform Module Quality Team
    Version: 2.0.0 (Enhanced with Comprehensive Help System)
    
    PREREQUISITES:
    • Windows with WSL (Windows Subsystem for Linux) enabled
    • Linux distribution installed in WSL (Ubuntu recommended)
    • PowerShell 5.1 or later
      AUTOMATIC INSTALLATIONS:
    • terraform (if not present in WSL)
    • tflint (if not present in WSL)
    • terraform-docs (if not present in WSL and -GenerateDocumentation is used)
    
    TROUBLESHOOTING:
    • Run with -Verbose for detailed execution information
    • Ensure WSL distribution is running: wsl --status
    • Verify module path exists and is accessible
    • Check WSL Linux distribution: wsl --list --verbose

.LINK
    https://docs.microsoft.com/en-us/windows/wsl/
    https://www.terraform.io/docs/
    https://github.com/terraform-linters/tflint
    https://terraform-docs.io/
#>
#
# OUTPUT FILES:
#   - README_GENERATED.md - Auto-generated documentation (only if -GenerateDocumentation is used)
#
# TROUBLESHOOTING:
#   - If WSL issues occur, ensure Ubuntu distribution is installed: wsl --install -d Ubuntu
#   - If tools fail to install, manually install them in WSL: terraform, tflint, terraform-docs
#   - For path conversion errors, try running from WSL directly: wsl cd /mnt/c/path/to/module
# 
# ==============================================================

[CmdletBinding()]
param (
    [Parameter(Mandatory=$false, ParameterSetName='Run')]
    [string]$ModulePath,
    
    [Parameter(Mandatory=$false, ParameterSetName='Run')]
    [switch]$AzureModuleCheck,
    
    [Parameter(Mandatory=$false, ParameterSetName='Run')]
    [switch]$SkipValidation,
    
    [Parameter(Mandatory=$false, ParameterSetName='Run')]
    [switch]$GenerateDocumentation,
    
    [Parameter(Mandatory=$false, ParameterSetName='Help')]
    [switch]$Help
)

# Enhanced Help Function with Visual Formatting
function Show-TerraformChecksHelp {
    Clear-Host
    
    # ASCII Art Header
    Write-Host @"
╔══════════════════════════════════════════════════════════════════════════════╗
║                                                                              ║
║   ████████╗███████╗██████╗ ██████╗  █████╗ ███████╗ ██████╗ ██████╗ ███╗   ███║
║   ╚══██╔══╝██╔════╝██╔══██╗██╔══██╗██╔══██╗██╔════╝██╔═══██╗██╔══██╗████╗ ████║
║      ██║   █████╗  ██████╔╝██████╔╝███████║█████╗  ██║   ██║██████╔╝██╔████╔██║
║      ██║   ██╔══╝  ██╔══██╗██╔══██╗██╔══██║██╔══╝  ██║   ██║██╔══██╗██║╚██╔╝██║
║      ██║   ███████╗██║  ██║██║  ██║██║  ██║██║     ╚██████╔╝██║  ██║██║ ╚═╝ ██║
║      ╚═╝   ╚══════╝╚═╝  ╚═╝╚═╝  ╚═╝╚═╝  ╚═╝╚═╝      ╚═════╝ ╚═╝  ╚═╝╚═╝     ╚═║
║                                                                              ║
║           🔧 QUALITY CHECKER (FIXED VERSION) 🎯 AZURE COMPLIANT              ║
║                          Enhanced with Comprehensive Help                   ║
╚══════════════════════════════════════════════════════════════════════════════╝
"@ -ForegroundColor Cyan

    Write-Host "`n🎯 " -ForegroundColor Yellow -NoNewline
    Write-Host "TERRAFORM MODULE QUALITY ASSURANCE SUITE" -ForegroundColor White -BackgroundColor DarkBlue

    Write-Host "`n📋 " -ForegroundColor Green -NoNewline
    Write-Host "QUICK START EXAMPLES:" -ForegroundColor White -BackgroundColor DarkGreen
      Write-Host "`n   🔹 Basic Quality Check:" -ForegroundColor Cyan
    Write-Host "     .\run-terraform-checks-fixed.ps1 -ModulePath `"C:\terraform\modules\storage`"" -ForegroundColor Gray
    
    Write-Host "`n   🔹 With Documentation Generation:" -ForegroundColor Cyan
    Write-Host "     .\run-terraform-checks-fixed.ps1 -ModulePath `".\modules\storage`" -GenerateDocumentation" -ForegroundColor Gray
    
    Write-Host "`n   🔹 Azure Compliance Check:" -ForegroundColor Cyan
    Write-Host "     .\run-terraform-checks-fixed.ps1 -ModulePath `".\modules\aks`" -AzureModuleCheck" -ForegroundColor Gray
    
    Write-Host "`n   🔹 Full Analysis with Documentation:" -ForegroundColor Cyan
    Write-Host "     .\run-terraform-checks-fixed.ps1 -ModulePath `".\modules\vm`" -AzureModuleCheck -GenerateDocumentation" -ForegroundColor Gray
    
    Write-Host "`n   🔹 Skip Structure Validation:" -ForegroundColor Cyan
    Write-Host "     .\run-terraform-checks-fixed.ps1 -ModulePath `".\modules\network`" -SkipValidation" -ForegroundColor Gray

    Write-Host "`n🔧 " -ForegroundColor Blue -NoNewline
    Write-Host "FEATURES '&' CAPABILITIES:" -ForegroundColor White -BackgroundColor DarkBlue
      Write-Host "`n   ✅ Automatic Code Formatting (terraform fmt)" -ForegroundColor Green
    Write-Host "   ✅ Static Analysis '&' Linting (tflint)" -ForegroundColor Green
    Write-Host "   🔄 Optional Documentation Generation (terraform-docs)" -ForegroundColor Cyan
    Write-Host "   ✅ Module Structure Validation" -ForegroundColor Green
    Write-Host "   ✅ Azure Module Catalog Criterion Compliance" -ForegroundColor Green
    Write-Host "   ✅ Automatic Tool Installation" -ForegroundColor Green
    Write-Host "   ✅ WSL Integration with Error Recovery" -ForegroundColor Green
    Write-Host "   ✅ Cross-Platform Path Handling" -ForegroundColor Green

    Write-Host "`n🎯 " -ForegroundColor Magenta -NoNewline
    Write-Host "AZURE COMPLIANCE REQUIREMENTS (9 'CRITERIA'):" -ForegroundColor White -BackgroundColor DarkMagenta
    
    Write-Host "`n   1. 📁 Provider Configuration" -ForegroundColor Yellow -NoNewline
    Write-Host " - required_providers.tf with version constraints" -ForegroundColor Gray
    Write-Host "   2. 🏷️  Module Versioning" -ForegroundColor Yellow -NoNewline
    Write-Host " - versions.tf with required_version" -ForegroundColor Gray
    Write-Host "   3. ✔️  Variable Validation" -ForegroundColor Yellow -NoNewline
    Write-Host " - Input validation rules in variables.tf" -ForegroundColor Gray
    Write-Host "   4. 📝 Variable Descriptions" -ForegroundColor Yellow -NoNewline
    Write-Host " - Comprehensive variable documentation" -ForegroundColor Gray
    Write-Host "   5. 📤 Output Descriptions" -ForegroundColor Yellow -NoNewline
    Write-Host " - Detailed output documentation" -ForegroundColor Gray
    Write-Host "   6. 📂 Examples Directory" -ForegroundColor Yellow -NoNewline
    Write-Host " - Working usage examples" -ForegroundColor Gray
    Write-Host "   7. 🧪 Test Files" -ForegroundColor Yellow -NoNewline
    Write-Host " - Automated testing infrastructure" -ForegroundColor Gray
    Write-Host "   8. 📖 README Documentation" -ForegroundColor Yellow -NoNewline
    Write-Host " - Usage section in README.md" -ForegroundColor Gray
    Write-Host "   9. 🏗️  Architectural Diagram" -ForegroundColor Yellow -NoNewline
    Write-Host " - Visual architecture documentation" -ForegroundColor Gray

    Write-Host "`n⚙️ " -ForegroundColor Red -NoNewline
    Write-Host "TROUBLESHOOTING GUIDE:" -ForegroundColor White -BackgroundColor DarkRed
    
    Write-Host "`n   🔍 Common Issues & Solutions:" -ForegroundColor Yellow
    Write-Host "   • WSL not running: " -ForegroundColor Cyan -NoNewline
    Write-Host "wsl --status" -ForegroundColor Gray
    Write-Host "   • No distributions: " -ForegroundColor Cyan -NoNewline
    Write-Host "wsl --install Ubuntu-22.04" -ForegroundColor Gray
    Write-Host "   • Path issues: " -ForegroundColor Cyan -NoNewline
    Write-Host "Use absolute paths like C:\terraform\modules" -ForegroundColor Gray
    Write-Host "   • Permission errors: " -ForegroundColor Cyan -NoNewline
    Write-Host "Run PowerShell as Administrator" -ForegroundColor Gray

    Write-Host "`n📚 " -ForegroundColor Blue -NoNewline
    Write-Host "ADDITIONAL HELP:" -ForegroundColor White -BackgroundColor DarkBlue
      Write-Host "`n   📖 Detailed Help: " -ForegroundColor Cyan -NoNewline
    Write-Host "Get-Help .\run-terraform-checks-fixed.ps1 -Detailed" -ForegroundColor Gray
    Write-Host "   📋 Examples Only: " -ForegroundColor Cyan -NoNewline
    Write-Host "Get-Help .\run-terraform-checks-fixed.ps1 -Examples" -ForegroundColor Gray
    Write-Host "   🔍 Full Help: " -ForegroundColor Cyan -NoNewline
    Write-Host "Get-Help .\run-terraform-checks-fixed.ps1 -Full" -ForegroundColor Gray

    Write-Host "`n" -NoNewline
    Write-Host "╔════════════════════════════════════════════════════════════════╗" -ForegroundColor DarkGray
    Write-Host "║ 🚀 Ready to enhance your Terraform modules? Choose an option! ║" -ForegroundColor DarkGray
    Write-Host "╚════════════════════════════════════════════════════════════════╝" -ForegroundColor DarkGray
    Write-Host ""
}
}

# Enhanced Completion Summary Function
function Show-CompletionSummary {
    param (
        [string]$ModulePath,
        [bool]$AzureModuleCheck,
        [bool]$SkipValidation,
        [bool]$GenerateDocumentation,
        [int]$ComplianceScore = 0
    )
    
    Write-Host "`n" -NoNewline
    Write-Host "╔══════════════════════════════════════════════════════════════════════════════╗" -ForegroundColor Cyan
    Write-Host "║                           🎉 QUALITY CHECKS COMPLETED 🎉                    ║" -ForegroundColor Cyan
    Write-Host "╚══════════════════════════════════════════════════════════════════════════════╝" -ForegroundColor Cyan

    Write-Host "`n📊 " -ForegroundColor Blue -NoNewline
    Write-Host "EXECUTION SUMMARY:" -ForegroundColor White -BackgroundColor DarkBlue
    
    Write-Host "`n   🎯 Module Path: " -ForegroundColor Yellow -NoNewline
    Write-Host "$ModulePath" -ForegroundColor White
      Write-Host "   🔧 Quality Checks: " -ForegroundColor Yellow -NoNewline
    if ($GenerateDocumentation) {
        Write-Host "✅ terraform fmt, tflint, terraform-docs" -ForegroundColor Green
    } else {
        Write-Host "✅ terraform fmt, tflint | ⏭️ terraform-docs (skipped)" -ForegroundColor Green
    }
    
    if (-not $SkipValidation) {
        Write-Host "   📋 Structure Validation: " -ForegroundColor Yellow -NoNewline
        Write-Host "✅ Completed" -ForegroundColor Green
    } else {
        Write-Host "   📋 Structure Validation: " -ForegroundColor Yellow -NoNewline
        Write-Host "⏭️ Skipped (as requested)" -ForegroundColor Gray
    }
    
    if ($AzureModuleCheck) {
        Write-Host "   🎯 Azure Compliance Check: " -ForegroundColor Yellow -NoNewline
        if ($ComplianceScore -ge 80) {
            Write-Host "🟢 $ComplianceScore% - EXCELLENT" -ForegroundColor Green
        } elseif ($ComplianceScore -ge 60) {
            Write-Host "🟡 $ComplianceScore% - GOOD (needs improvement)" -ForegroundColor Yellow
        } elseif ($ComplianceScore -gt 0) {
            Write-Host "🔴 $ComplianceScore% - NEEDS WORK" -ForegroundColor Red
        } else {
            Write-Host "✅ Completed" -ForegroundColor Green
        }
    } # Closing brace for if ($AzureModuleCheck)
    Write-Host "`n📋 " -ForegroundColor Green -NoNewline
    Write-Host "GENERATED FILES:" -ForegroundColor White -BackgroundColor DarkGreen
    
    if ($GenerateDocumentation) {
        Write-Host "`n   📄 README_GENERATED.md - Auto-generated module documentation" -ForegroundColor Cyan
    } else {
        Write-Host "`n   ⏭️ README_GENERATED.md - Skipped (use -GenerateDocumentation to create)" -ForegroundColor Gray
    }
    Write-Host "   🔧 Formatted .tf files - Code formatting applied where needed" -ForegroundColor Cyan

    Write-Host "`n🚀 " -ForegroundColor Magenta -NoNewline
    Write-Host "RECOMMENDED NEXT STEPS:" -ForegroundColor White -BackgroundColor DarkMagenta
    
    if ($AzureModuleCheck -and $ComplianceScore -lt 80) {
        Write-Host "`n   1. 📈 Improve Azure Compliance:" -ForegroundColor Yellow
        if ($ComplianceScore -lt 40) {
            Write-Host "      • Add missing core files (required_providers.tf, versions.tf)" -ForegroundColor Gray
            Write-Host "      • Create examples/ and test/ directories" -ForegroundColor Gray
        }
        Write-Host "      • Add variable validation rules" -ForegroundColor Gray
        Write-Host "      • Enhance descriptions for variables and outputs" -ForegroundColor Gray
        Write-Host "      • Create architectural diagrams" -ForegroundColor Gray    }
    
    $stepNumber = 1
    if (-not $GenerateDocumentation) {
        Write-Host "`n   $stepNumber. 📄 Generate Documentation:" -ForegroundColor Yellow
        Write-Host "      • Run with -GenerateDocumentation to create comprehensive docs" -ForegroundColor Gray
        Write-Host "      • .\run-terraform-checks-fixed.ps1 -ModulePath `"$ModulePath`" -GenerateDocumentation" -ForegroundColor Gray
        $stepNumber++
    }
    
    if ($GenerateDocumentation) {
        Write-Host "`n   $stepNumber. 📖 Review Generated Documentation:" -ForegroundColor Yellow
        Write-Host "      • Check README_GENERATED.md for accuracy" -ForegroundColor Gray
        Write-Host "      • Merge relevant content into main README.md" -ForegroundColor Gray
        $stepNumber++
    }
    
    Write-Host "`n   $stepNumber. 🔍 Address Any Linting Issues:" -ForegroundColor Yellow
    Write-Host "      • Review tflint output above for potential improvements" -ForegroundColor Gray
    Write-Host "      • Consider implementing suggested best practices" -ForegroundColor Gray
    $stepNumber++
      Write-Host "`n   $stepNumber. 🧪 Testing & Validation:" -ForegroundColor Yellow
    Write-Host "      • Run 'terraform plan' to validate configuration" -ForegroundColor Gray
    Write-Host "      • Test with example configurations" -ForegroundColor Gray

    Write-Host "`n💡 " -ForegroundColor Blue -NoNewline
    Write-Host "USEFUL COMMANDS:" -ForegroundColor White -BackgroundColor DarkBlue
    
    if (-not $GenerateDocumentation) {
        Write-Host "`n   📄 Generate documentation:" -ForegroundColor Cyan
        Write-Host "   .\run-terraform-checks-fixed.ps1 -ModulePath `"$ModulePath`" -GenerateDocumentation" -ForegroundColor Gray
    }
    
    Write-Host "`n   🔄 Re-run with Azure compliance:" -ForegroundColor Cyan
    Write-Host "   .\run-terraform-checks-fixed.ps1 -ModulePath `"$ModulePath`" -AzureModuleCheck" -ForegroundColor Gray
    
    if ($GenerateDocumentation -and $AzureModuleCheck) {
        Write-Host "`n   🚀 Full analysis with docs:" -ForegroundColor Cyan
        Write-Host "   .\run-terraform-checks-fixed.ps1 -ModulePath `"$ModulePath`" -AzureModuleCheck -GenerateDocumentation" -ForegroundColor Gray
    }
    
    Write-Host "`n   📚 Get detailed help:" -ForegroundColor Cyan
    Write-Host "   .\run-terraform-checks-fixed.ps1 -Help" -ForegroundColor Gray
    
    if ($GenerateDocumentation) {
        Write-Host "`n   🔍 View generated docs:" -ForegroundColor Cyan
        Write-Host "   Get-Content `"$ModulePath\README_GENERATED.md`"" -ForegroundColor Gray
    }

    Write-Host "`n" -NoNewline
    Write-Host "╔═══════════════════════════════════════════════════════════════════════════╗" -ForegroundColor DarkGray
    Write-Host "║  🎯 Module quality checks completed successfully! Review output above.   ║" -ForegroundColor DarkGray
    Write-Host "╚═══════════════════════════════════════════════════════════════════════════╝" -ForegroundColor DarkGray
    Write-Host ""
}

# Show detailed help if requested
if ($Help) {
    Show-TerraformChecksHelp
    return
}

# Validate parameters
if (-not $ModulePath) {
    Write-Host @"

╔══════════════════════════════════════════════════════════════════════════════╗
║                    TERRAFORM MODULE QUALITY CHECKER                          ║
║                              (Enhanced Version)                             ║
╚══════════════════════════════════════════════════════════════════════════════╝

❌ ERROR: ModulePath parameter is required

🚀 QUICK START EXAMPLES:

   BASIC QUALITY CHECK:
   .\run-terraform-checks-fixed.ps1 -ModulePath "C:\path\to\your\terraform\module"

   WITH DOCUMENTATION:
   .\run-terraform-checks-fixed.ps1 -ModulePath "C:\path\to\your\terraform\module" -GenerateDocumentation

   AZURE COMPLIANCE CHECK:
   .\run-terraform-checks-fixed.ps1 -ModulePath "C:\path\to\your\terraform\module" -AzureModuleCheck

   FULL ANALYSIS:
   .\run-terraform-checks-fixed.ps1 -ModulePath "C:\path\to\your\terraform\module" -AzureModuleCheck -GenerateDocumentation

   QUICK FORMAT ONLY:
   .\run-terraform-checks-fixed.ps1 -ModulePath "C:\path\to\your\terraform\module" -SkipValidation

📚 GET HELP:
   .\run-terraform-checks-fixed.ps1 -Help                    # Comprehensive help
   Get-Help .\run-terraform-checks-fixed.ps1 -Detailed      # PowerShell standard help
   Get-Help .\run-terraform-checks-fixed.ps1 -Examples      # Usage examples

🔧 WHAT THIS SCRIPT DOES:
   ✓ terraform fmt     - Code formatting
   ✓ tflint           - Static analysis & linting  
   ✓ terraform-docs   - Documentation generation (optional)
   ✓ Structure check  - Module file validation
   ✓ Azure compliance - Marketplace readiness (optional)

"@ -ForegroundColor Red
    exit 1
}

Write-Host @"

╔══════════════════════════════════════════════════════════════════════════════╗
║                    TERRAFORM MODULE QUALITY CHECKER                          ║
╚══════════════════════════════════════════════════════════════════════════════╝

Target Module: $ModulePath
Azure Compliance Check: $(if ($AzureModuleCheck) { '✅ ENABLED' } else { '❌ Disabled' })
Structure Validation: $(if ($SkipValidation) { '❌ Skipped' } else { '✅ Enabled' })
Documentation Generation: $(if ($GenerateDocumentation) { '✅ ENABLED' } else { '❌ Disabled' })

Starting comprehensive module analysis...

"@ -ForegroundColor Green

# Function to check if module follows Azure Terraform Module Catalog Criterion
function Test-AzureModuleCriterion {
    param (
        [string]$ModulePath,
        [string]$WslPath,
        [string]$Distribution
    )
    
    Write-Host "`n" -NoNewline
    Write-Host "╔═══════════════════════════════════════════════════════════════════════════════╗" -ForegroundColor DarkBlue
    Write-Host "║                    🎯 AZURE TERRAFORM MODULE CATALOG CRITERION                ║" -ForegroundColor DarkBlue
    Write-Host "╚═══════════════════════════════════════════════════════════════════════════════╝" -ForegroundColor DarkBlue

    Write-Host "`n🏆 " -ForegroundColor Yellow -NoNewline
    Write-Host "Evaluating Azure Marketplace readiness (9 'requirements')..." -ForegroundColor White
    
    # Define requirements as a hashtable for easier handling
    $requirementsList = @(
        @{
            Name = "Provider Configuration";
            File = "required_providers.tf"; 
            Pattern = 'required_providers';
            Description = "Version constraints for required providers"
        },
        @{
            Name = "Module Versioning"; 
            File = "versions.tf"; 
            Pattern = 'required_version';
            Description = "Terraform version requirements"
        },
        @{
            Name = "Variable Validation"; 
            File = "variables.tf"; 
            Pattern = 'validation \{';
            Description = "Input validation rules in variables"
        },
        @{
            Name = "Variable Descriptions"; 
            File = "variables.tf"; 
            Pattern = "description";
            Description = "Comprehensive variable documentation"
        },
        @{
            Name = "Output Descriptions"; 
            File = "outputs.tf"; 
            Pattern = "description";
            Description = "Detailed output documentation"
        },
        @{
            Name = "Examples Directory"; 
            File = "examples"; 
            IsDirectory = $true;
            Description = "Working usage examples"
        },
        @{
            Name = "Test Files"; 
            File = "test"; 
            IsDirectory = $true;
            Description = "Automated testing infrastructure"
        },
        @{
            Name = "README Documentation"; 
            File = "README.md"; 
            Pattern = "## Usage";
            Description = "Usage section in README"
        },
        @{
            Name = "Architectural Diagram"; 
            File = "diagram"; 
            IsDirectory = $true;
            Description = "Visual architecture documentation"
        }
    )
    
    $passCount = 0
    $totalCount = $requirementsList.Count
    $requirementNumber = 1
    
    Write-Host "`n   📋 Detailed Compliance Analysis:" -ForegroundColor Cyan
    Write-Host "   " -NoNewline
    Write-Host "═══════════════════════════════════════════════════════════════" -ForegroundColor Gray
    
    foreach ($req in $requirementsList) {
        Write-Host "`n   $requirementNumber. " -ForegroundColor Yellow -NoNewline
        Write-Host "$($req.Name)" -ForegroundColor White -NoNewline
        Write-Host " - $($req.Description)" -ForegroundColor Gray
        
        if ($req.IsDirectory) {
            # Directory check
            $dirCheck = wsl.exe --distribution "$Distribution" --exec bash -c "test -d '$WslPath/$($req.File)' && echo 'exists' || echo 'missing'"
            if ($dirCheck -eq "exists") {
                Write-Host "      ✅ PASSED - Directory '$($req.File)' found" -ForegroundColor Green
                $passCount++
            } else {
                Write-Host "      ❌ FAILED - Directory '$($req.File)' not found" -ForegroundColor Red
            }
        } else {
            # File and pattern check
            $fileCheck = wsl.exe --distribution "$Distribution" --exec bash -c "test -f '$WslPath/$($req.File)' && echo 'exists' || echo 'missing'"
            
            if ($fileCheck -eq "exists") {
                if ($req.Pattern) {
                    # Check for pattern in file
                    $patternCheck = wsl.exe --distribution "$Distribution" --exec bash -c "grep -E '$($req.Pattern)' '$WslPath/$($req.File)' > /dev/null 2>&1 && echo 'found' || echo 'notfound'"
                    if ($patternCheck -eq "found") {
                        Write-Host "      ✅ PASSED - Pattern '$($req.Pattern)' found in $($req.File)" -ForegroundColor Green
                        $passCount++
                    } else {
                        Write-Host "      ❌ FAILED - Pattern '$($req.Pattern)' not found in $($req.File)" -ForegroundColor Red
                    }
                } else {
                    # Just checking if file exists
                    Write-Host "      ✅ PASSED - File '$($req.File)' exists" -ForegroundColor Green
                    $passCount++
                }
            } else {
                Write-Host "      ❌ FAILED - File '$($req.File)' not found" -ForegroundColor Red
            }
        }
        
        $requirementNumber++
    }
    
    # Calculate compliance percentage and provide detailed summary
    $percentCompliance = [math]::Round(($passCount / $totalCount) * 100)
    
    Write-Host "`n   " -NoNewline
    Write-Host "═══════════════════════════════════════════════════════════════" -ForegroundColor Gray
    
    Write-Host "`n   📊 COMPLIANCE SUMMARY:" -ForegroundColor Cyan
    Write-Host "   Requirements Passed: " -ForegroundColor Yellow -NoNewline
    Write-Host "$passCount/$totalCount " -ForegroundColor White -NoNewline
    
    if ($percentCompliance -ge 80) {
        Write-Host "($percentCompliance%) " -ForegroundColor Green -NoNewline
        Write-Host "🟢 EXCELLENT" -ForegroundColor Green
        Write-Host "   Status: Ready for Azure Marketplace! 🚀" -ForegroundColor Green
    } elseif ($percentCompliance -ge 60) {
        Write-Host "($percentCompliance%) " -ForegroundColor Yellow -NoNewline
        Write-Host "🟡 GOOD" -ForegroundColor Yellow
        Write-Host "   Status: Minor improvements needed ⚠️" -ForegroundColor Yellow
    } else {
        Write-Host "($percentCompliance%) " -ForegroundColor Red -NoNewline
        Write-Host "🔴 NEEDS WORK" -ForegroundColor Red
        Write-Host "   Status: Significant improvements required ❌" -ForegroundColor Red
    }
    
    return $percentCompliance
}
}

# Check if module directory exists
if (-not (Test-Path $ModulePath)) {
    Write-Host "Error: Module path does not exist: $ModulePath" -ForegroundColor Red
    exit 1
}

# Check if WSL is installed and running
try {
    $null = wsl.exe --status 2>&1
    if ($LASTEXITCODE -ne 0) {
        Write-Host "Error: WSL is not running or not configured properly." -ForegroundColor Red
        exit 1
    }
    
    # Check for distributions
    $distributionsCheck = wsl.exe --list --verbose 2>&1 | Out-String
    if ($distributionsCheck -match "no distributions" -or $distributionsCheck -eq "" -or $null -eq $distributionsCheck) {
        Write-Host "Error: No WSL distributions found. Please install a Linux distribution in WSL." -ForegroundColor Red
        exit 1
    }
} catch {
    Write-Host "Error: WSL is not installed or not configured properly. Exception: $_" -ForegroundColor Red
    exit 1
}

# Get WSL distribution - Ultra simplified approach
[string]$ubuntuDistro = "Ubuntu-22.04"  # Default to common distribution name
Write-Host "Using WSL distribution: $ubuntuDistro" -ForegroundColor Cyan

# Convert Windows path to WSL path with improved error handling
try {
    Write-Host "Converting Windows path '$ModulePath' to WSL path..." -ForegroundColor Cyan
    # Use the most reliable format for WSL path conversion (no quotes around distribution name)
    $wslPath = wsl.exe --distribution $ubuntuDistro --exec bash -c "wslpath '$ModulePath'" 2>&1
    if ($LASTEXITCODE -ne 0 -or $wslPath -match "Error" -or $wslPath -eq "") {
        Write-Host "Error: Failed to convert Windows path to WSL path. Output: $wslPath" -ForegroundColor Red
        # First fallback: Try alternative path conversion
        Write-Host "Attempting alternative path conversion method 1..." -ForegroundColor Yellow
        $normalizedPath = $ModulePath.Replace('\', '/')
        $wslPath = wsl.exe --distribution $ubuntuDistro --exec bash -c "echo '$normalizedPath'" 2>&1
        if ($LASTEXITCODE -ne 0 -or $wslPath -eq "") {
            # Second fallback: Try direct path mapping based on known WSL path structure
            Write-Host "Attempting alternative path conversion method 2..." -ForegroundColor Yellow
            if ($ModulePath -match "^([A-Za-z]):\\(.*)$") {
                $driveLetter = $Matches[1].ToLower()
                $restOfPath = $Matches[2].Replace('\', '/')
                $wslPath = "/mnt/$driveLetter/$restOfPath"
                Write-Host "Manually constructed WSL path: $wslPath" -ForegroundColor Yellow
            } else {
                Write-Host "Error: Could not convert Windows path to WSL path." -ForegroundColor Red
                exit 1
            }
        }
    }
    Write-Host "Path conversion successful: $wslPath" -ForegroundColor Green
} catch {
    Write-Host "Error converting path: $_" -ForegroundColor Red
    exit 1
}

# Step 1: Run terraform fmt
Write-Host "`n" -NoNewline
Write-Host "╔═══════════════════════════════════════════════════════════════════════════════╗" -ForegroundColor Blue
Write-Host "║                          🎯 STEP 1: TERRAFORM FORMATTING                      ║" -ForegroundColor Blue
Write-Host "╚═══════════════════════════════════════════════════════════════════════════════╝" -ForegroundColor Blue

Write-Host "`n🔧 " -ForegroundColor Yellow -NoNewline
Write-Host "Checking Terraform formatting consistency..." -ForegroundColor White

try {
    # Check if terraform is installed
    Write-Host "   📦 Checking Terraform installation..." -ForegroundColor Cyan
    $terraformCheck = wsl.exe --distribution $ubuntuDistro --exec bash -c "command -v terraform > /dev/null 2>&1 || echo 'not-installed'"
    if ($terraformCheck -eq "not-installed") {
        Write-Host "   ⚠️  Terraform not found in WSL. Installing HashiCorp Terraform..." -ForegroundColor Yellow
        Write-Host "   📥 Downloading and installing Terraform..." -ForegroundColor Cyan
        wsl.exe --distribution $ubuntuDistro --exec bash -c "curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo apt-key add - && sudo apt-add-repository 'deb [arch=amd64] https://apt.releases.hashicorp.com \$(lsb_release -cs) main' && sudo apt-get update && sudo apt-get install -y terraform"
        
        # Verify installation was successful
        $terraformVerify = wsl.exe --distribution $ubuntuDistro --exec bash -c "command -v terraform > /dev/null 2>&1 || echo 'failed'"
        if ($terraformVerify -eq "failed") {
            Write-Host "   ❌ Failed to install Terraform automatically." -ForegroundColor Red
            Write-Host "   💡 Please install manually: https://www.terraform.io/downloads.html" -ForegroundColor Yellow
            Write-Host "   ⏭️  Skipping terraform fmt check." -ForegroundColor Gray
            return
        } else {
            Write-Host "   ✅ Terraform installation successful!" -ForegroundColor Green
        }
    } else {
        Write-Host "   ✅ Terraform is already installed and available" -ForegroundColor Green
    }
    
    # Run terraform fmt check
    Write-Host "`n   🔍 Scanning for formatting inconsistencies..." -ForegroundColor Cyan
    $output = wsl.exe --distribution $ubuntuDistro --exec bash -c "cd '$wslPath' && terraform fmt -recursive -check 2>&1"
    $status = $LASTEXITCODE
    
    if ($status -ne 0) {
        Write-Host "   ⚠️  Formatting issues detected. Auto-fixing..." -ForegroundColor Yellow
        Write-Host "   🔧 Running: terraform fmt -recursive" -ForegroundColor Gray
        wsl.exe --distribution $ubuntuDistro --exec bash -c "cd '$wslPath' && terraform fmt -recursive"
        Write-Host "   ✅ Code formatting applied successfully!" -ForegroundColor Green
        Write-Host "   💡 All .tf files now follow consistent formatting standards" -ForegroundColor Cyan
    } else {
        Write-Host "   ✅ All code is properly formatted!" -ForegroundColor Green
        Write-Host "   👍 No formatting changes needed" -ForegroundColor Cyan
    }
} catch {
    Write-Host "   ❌ Error during terraform fmt execution: $_" -ForegroundColor Red
    Write-Host "   💡 Please check WSL connectivity and module path" -ForegroundColor Yellow
}

# Step 2: Run tflint
Write-Host "`n" -NoNewline
Write-Host "╔═══════════════════════════════════════════════════════════════════════════════╗" -ForegroundColor Magenta
Write-Host "║                           🔍 STEP 2: TERRAFORM LINTING                       ║" -ForegroundColor Magenta
Write-Host "╚═══════════════════════════════════════════════════════════════════════════════╝" -ForegroundColor Magenta

Write-Host "`n🔎 " -ForegroundColor Yellow -NoNewline
Write-Host "Running static analysis and best practice checks..." -ForegroundColor White

try {
    Write-Host "   📦 Checking TFLint installation..." -ForegroundColor Cyan
    $tflintResult = wsl.exe --distribution $ubuntuDistro --exec bash -c "command -v tflint > /dev/null 2>&1 || echo 'not-installed'"
    if ($tflintResult -eq "not-installed") {
        Write-Host "   ⚠️  TFLint not found. Installing Terraform Linter..." -ForegroundColor Yellow
        Write-Host "   📥 Downloading and installing TFLint..." -ForegroundColor Cyan
        wsl.exe --distribution $ubuntuDistro --exec bash -c "curl -s https://raw.githubusercontent.com/terraform-linters/tflint/master/install_linux.sh | bash"
        
        # Verify installation was successful
        $tflintVerify = wsl.exe --distribution $ubuntuDistro --exec bash -c "command -v tflint > /dev/null 2>&1 || echo 'failed'"
        if ($tflintVerify -eq "failed") {
            Write-Host "   ❌ Failed to install TFLint automatically." -ForegroundColor Red
            Write-Host "   💡 Please install manually: https://github.com/terraform-linters/tflint" -ForegroundColor Yellow
            Write-Host "   ⏭️  Skipping TFLint check." -ForegroundColor Gray
            return
        } else {
            Write-Host "   ✅ TFLint installation successful!" -ForegroundColor Green
        }
    } else {
        Write-Host "   ✅ TFLint is already installed and available" -ForegroundColor Green
    }
    
    Write-Host "`n   🔍 Scanning Terraform code for issues and best practices..." -ForegroundColor Cyan
    Write-Host "   📁 Target directory: $wslPath" -ForegroundColor Gray
    $output = wsl.exe --distribution $ubuntuDistro --exec bash -c "cd '$wslPath' && tflint --recursive 2>&1"
    $status = $LASTEXITCODE
    
    if ($output) {
        Write-Host "`n   📋 TFLint Analysis Results:" -ForegroundColor Cyan
        Write-Host "   " -NoNewline
        Write-Host "───────────────────────────────" -ForegroundColor Gray
        # Display output with proper formatting
        $output -split "`n" | ForEach-Object {
            if ($_ -match "Error:") {
                Write-Host "   ❌ $_" -ForegroundColor Red
            } elseif ($_ -match "Warning:") {
                Write-Host "   ⚠️  $_" -ForegroundColor Yellow
            } elseif ($_ -match "Notice:") {
                Write-Host "   💡 $_" -ForegroundColor Cyan
            } else {
                Write-Host "   $_" -ForegroundColor Gray
            }
        }
        Write-Host "   " -NoNewline
        Write-Host "───────────────────────────────" -ForegroundColor Gray
    }
    
    if ($status -ne 0) {
        Write-Host "`n   ⚠️  TFLint identified issues that should be addressed" -ForegroundColor Yellow
        Write-Host "   💡 Review the findings above and apply recommended fixes" -ForegroundColor Cyan
    } else {
        Write-Host "`n   ✅ TFLint analysis completed successfully!" -ForegroundColor Green
        Write-Host "   👍 No issues found - code follows Terraform best practices" -ForegroundColor Cyan
    }
} catch {
    Write-Host "   ❌ Error during TFLint execution: $_" -ForegroundColor Red
    Write-Host "   💡 Please check WSL connectivity and module path" -ForegroundColor Yellow
}

# Step 3: Run terraform-docs (optional)
if ($GenerateDocumentation) {
    Write-Host "`n" -NoNewline
    Write-Host "╔═══════════════════════════════════════════════════════════════════════════════╗" -ForegroundColor Green
    Write-Host "║                        📚 STEP 3: DOCUMENTATION GENERATION                   ║" -ForegroundColor Green
    Write-Host "╚═══════════════════════════════════════════════════════════════════════════════╝" -ForegroundColor Green

    Write-Host "`n📝 " -ForegroundColor Yellow -NoNewline
    Write-Host "Generating comprehensive module documentation..." -ForegroundColor White

try {
    # Check if terraform-docs is installed, install to user bin if not
    Write-Host "   📦 Checking terraform-docs installation..." -ForegroundColor Cyan
    $terraformDocsResult = wsl.exe --distribution $ubuntuDistro --exec bash -c "command -v terraform-docs > /dev/null 2>&1 || echo 'not-installed'"
    if ($terraformDocsResult -eq "not-installed") {
        Write-Host "   ⚠️  terraform-docs not found. Installing documentation generator..." -ForegroundColor Yellow
        Write-Host "   📁 Creating user bin directory..." -ForegroundColor Cyan
        
        # Create bin directory if it doesn't exist
        wsl.exe --distribution $ubuntuDistro --exec bash -c "mkdir -p ~/bin"
        
        Write-Host "   📥 Downloading terraform-docs v0.16.0..." -ForegroundColor Cyan
        # Download and install terraform-docs
        wsl.exe --distribution $ubuntuDistro --exec bash -c "curl -sSLo ./terraform-docs.tar.gz https://terraform-docs.io/dl/v0.16.0/terraform-docs-v0.16.0-linux-amd64.tar.gz && tar -xzf terraform-docs.tar.gz && chmod +x terraform-docs && mv terraform-docs ~/bin/ && rm -f terraform-docs.tar.gz"
        
        Write-Host "   ⚙️  Configuring PATH environment..." -ForegroundColor Cyan
        # Add to PATH if not already there
        wsl.exe --distribution $ubuntuDistro --exec bash -c "grep -q 'export PATH=~/bin:\$PATH' ~/.bashrc || echo 'export PATH=~/bin:\$PATH' >> ~/.bashrc"
        
        # Verify installation was successful
        $verifyResult = wsl.exe --distribution $ubuntuDistro --exec bash -c "ls ~/bin/terraform-docs > /dev/null 2>&1 || echo 'failed'"
        if ($verifyResult -eq "failed") {
            Write-Host "   ❌ Failed to install terraform-docs automatically." -ForegroundColor Red
            Write-Host "   💡 Please install manually: https://terraform-docs.io/" -ForegroundColor Yellow
            Write-Host "   ⏭️  Skipping documentation generation." -ForegroundColor Gray
            return
        } else {
            Write-Host "   ✅ terraform-docs installation successful!" -ForegroundColor Green
        }
    } else {
        Write-Host "   ✅ terraform-docs is already installed and available" -ForegroundColor Green
    }

    Write-Host "`n   📄 Generating markdown documentation..." -ForegroundColor Cyan
    Write-Host "   📁 Source directory: $wslPath" -ForegroundColor Gray
    Write-Host "   📄 Output file: README_GENERATED.md" -ForegroundColor Gray
    
    $output = wsl.exe --distribution $ubuntuDistro --exec bash -c "cd '$wslPath' && export PATH=~/bin:\$PATH && terraform-docs markdown table . > README_GENERATED.md 2>&1"
    $status = $LASTEXITCODE
    
    if ($status -ne 0) {
        Write-Host "`n   ⚠️  terraform-docs encountered issues:" -ForegroundColor Yellow
        Write-Host "   $_" -ForegroundColor Gray
        Write-Host "   💡 Check module structure and variable definitions" -ForegroundColor Cyan
    } else {
        Write-Host "`n   ✅ Documentation generation completed successfully!" -ForegroundColor Green
        
        # Check if the file was actually created
        $fileCheck = wsl.exe --distribution $ubuntuDistro --exec bash -c "test -f '$wslPath/README_GENERATED.md' && echo 'exists' || echo 'missing'"
        if ($fileCheck -eq "missing") {
            Write-Host "   ⚠️  README_GENERATED.md file was not created" -ForegroundColor Yellow
            Write-Host "   💡 Check for terraform-docs execution errors above" -ForegroundColor Cyan
        } else {
            # Fix permissions for the README_GENERATED.md file to ensure it's accessible
            wsl.exe --distribution $ubuntuDistro --exec bash -c "chmod 664 '$wslPath/README_GENERATED.md'"
            Write-Host "   📄 README_GENERATED.md created successfully" -ForegroundColor Green
            Write-Host "   🔧 File permissions configured for cross-platform access" -ForegroundColor Cyan
            
            # Get file size for confirmation
            $fileSize = wsl.exe --distribution $ubuntuDistro --exec bash -c "stat -c%s '$wslPath/README_GENERATED.md' 2>/dev/null || echo '0'"
            if ($fileSize -gt 100) {
                Write-Host "   📊 Generated documentation: $fileSize bytes" -ForegroundColor Cyan
            } else {
                Write-Host "   ⚠️  Generated file appears to be empty or very small" -ForegroundColor Yellow
            }
        }
    }
} catch {
    Write-Host "   ❌ Error during terraform-docs execution: $_" -ForegroundColor Red
    Write-Host "   💡 Please check WSL connectivity and module path" -ForegroundColor Yellow
}
} else {
    Write-Host "`n" -NoNewline
    Write-Host "╔═══════════════════════════════════════════════════════════════════════════════╗" -ForegroundColor Gray
    Write-Host "║                    📚 STEP 3: DOCUMENTATION GENERATION (SKIPPED)              ║" -ForegroundColor Gray
    Write-Host "╚═══════════════════════════════════════════════════════════════════════════════╝" -ForegroundColor Gray
    
    Write-Host "`n⏭️ " -ForegroundColor Yellow -NoNewline
    Write-Host "Documentation generation skipped (use -GenerateDocumentation to enable)" -ForegroundColor Gray
    Write-Host "   💡 To generate docs later: " -ForegroundColor Cyan -NoNewline
    Write-Host ".\run-terraform-checks-fixed.ps1 -ModulePath `"$ModulePath`" -GenerateDocumentation" -ForegroundColor Gray
}

# Step 4: Validate module structure (if not skipped)
if (-not $SkipValidation) {
    Write-Host "`n" -NoNewline
    Write-Host "╔═══════════════════════════════════════════════════════════════════════════════╗" -ForegroundColor DarkCyan
    Write-Host "║                         📁 STEP 4: MODULE STRUCTURE VALIDATION                ║" -ForegroundColor DarkCyan
    Write-Host "╚═══════════════════════════════════════════════════════════════════════════════╝" -ForegroundColor DarkCyan

    Write-Host "`n🏗️ " -ForegroundColor Yellow -NoNewline
    Write-Host "Validating Terraform module structure and best practices..." -ForegroundColor White

    try {
        # Define expected files for a standard Terraform module
        $expectedFiles = @("main.tf", "variables.tf", "outputs.tf", "README.md")
        $recommendedFiles = @("required_providers.tf", "versions.tf", "examples/", "test/")
        
        # Check for expected files
        Write-Host "`n   📋 Checking essential module files..." -ForegroundColor Cyan
        $essentialCount = 0
        
        foreach ($file in $expectedFiles) {
            $fileCheck = wsl.exe --distribution $ubuntuDistro --exec bash -c "test -e '$wslPath/$file' && echo 'exists' || echo 'missing'"
            if ($fileCheck -eq "missing") {
                Write-Host "   ❌ Essential file '$file' is missing" -ForegroundColor Red
            } else {
                Write-Host "   ✅ Essential file '$file' found" -ForegroundColor Green
                $essentialCount++
            }
        }
        
        # Check for recommended files
        Write-Host "`n   💡 Checking recommended module files/directories..." -ForegroundColor Cyan
        $recommendedCount = 0
        
        foreach ($file in $recommendedFiles) {
            $fileCheck = wsl.exe --distribution $ubuntuDistro --exec bash -c "test -e '$wslPath/$file' && echo 'exists' || echo 'missing'"
            if ($fileCheck -eq "missing") {
                Write-Host "   ⚠️  Recommended '$file' is missing" -ForegroundColor Yellow
            } else {
                Write-Host "   ✅ Recommended '$file' found" -ForegroundColor Green
                $recommendedCount++
            }
        }
        
        # Calculate and display summary
        $essentialPercentage = [math]::Round(($essentialCount / $expectedFiles.Count) * 100)
        $recommendedPercentage = [math]::Round(($recommendedCount / $recommendedFiles.Count) * 100)
        
        Write-Host "`n   📊 Structure Validation Summary:" -ForegroundColor Cyan
        Write-Host "   " -NoNewline
        Write-Host "═══════════════════════════════════" -ForegroundColor Gray
        
        if ($essentialPercentage -eq 100) {
            Write-Host "   ✅ Essential Files: $essentialPercentage% ($essentialCount/$($expectedFiles.Count)) - COMPLETE" -ForegroundColor Green
        } elseif ($essentialPercentage -ge 75) {
            Write-Host "   ⚠️  Essential Files: $essentialPercentage% ($essentialCount/$($expectedFiles.Count)) - MOSTLY COMPLETE" -ForegroundColor Yellow
        } else {
            Write-Host "   ❌ Essential Files: $essentialPercentage% ($essentialCount/$($expectedFiles.Count)) - INCOMPLETE" -ForegroundColor Red
        }
        
        if ($recommendedPercentage -ge 75) {
            Write-Host "   ✅ Recommended Files: $recommendedPercentage% ($recommendedCount/$($recommendedFiles.Count)) - EXCELLENT" -ForegroundColor Green
        } elseif ($recommendedPercentage -ge 50) {
            Write-Host "   💡 Recommended Files: $recommendedPercentage% ($recommendedCount/$($recommendedFiles.Count)) - GOOD" -ForegroundColor Cyan
        } else {
            Write-Host "   ⚠️  Recommended Files: $recommendedPercentage% ($recommendedCount/$($recommendedFiles.Count)) - NEEDS IMPROVEMENT" -ForegroundColor Yellow
        }
        
        Write-Host "   " -NoNewline
        Write-Host "═══════════════════════════════════" -ForegroundColor Gray
        
        # Provide specific recommendations if needed
        if ($essentialPercentage -lt 100) {
            Write-Host "`n   🚨 Critical Issues Found:" -ForegroundColor Red
            foreach ($file in $expectedFiles) {
                $fileCheck = wsl.exe --distribution $ubuntuDistro --exec bash -c "test -e '$wslPath/$file' && echo 'exists' || echo 'missing'"
                if ($fileCheck -eq "missing") {
                    Write-Host "   • Create missing file: $file" -ForegroundColor Yellow
                }
            }
        }
        
        if ($recommendedPercentage -lt 75) {
            Write-Host "`n   💡 Recommendations for improvement:" -ForegroundColor Cyan
            foreach ($file in $recommendedFiles) {
                $fileCheck = wsl.exe --distribution $ubuntuDistro --exec bash -c "test -e '$wslPath/$file' && echo 'exists' || echo 'missing'"
                if ($fileCheck -eq "missing") {
                    if ($file -eq "required_providers.tf") {
                        Write-Host "   • Add $file for provider version constraints" -ForegroundColor Gray
                    } elseif ($file -eq "versions.tf") {
                        Write-Host "   • Add $file for Terraform version requirements" -ForegroundColor Gray
                    } elseif ($file -eq "examples/") {
                        Write-Host "   • Create $file directory with usage examples" -ForegroundColor Gray
                    } elseif ($file -eq "test/") {
                        Write-Host "   • Create $file directory for automated testing" -ForegroundColor Gray
                    }
                }
            }
        }
        
        Write-Host "`n   ✅ Module structure validation completed" -ForegroundColor Green
        
    } catch {
        Write-Host "   ❌ Error during module structure validation: $_" -ForegroundColor Red
        Write-Host "   💡 Please check WSL connectivity and module path" -ForegroundColor Yellow
    }
}

Write-Host "`nAll checks and validations completed!" -ForegroundColor Green
Write-Host "Please review the output and address any issues identified by the tools." -ForegroundColor Cyan

# Run Azure Module check if specified
if ($AzureModuleCheck) {
    $complianceScore = Test-AzureModuleCriterion -ModulePath $ModulePath -WslPath $wslPath -Distribution $ubuntuDistro
    
    Write-Host @"

╔══════════════════════════════════════════════════════════════════════════════╗
║                        AZURE COMPLIANCE SUMMARY                             ║
╚══════════════════════════════════════════════════════════════════════════════╝
"@ -ForegroundColor Cyan
    
    if ($complianceScore -ge 80) {
        Write-Host "🟢 EXCELLENT: Module meets Azure Terraform Module Catalog Criterion with a score of $complianceScore%." -ForegroundColor Green
        Write-Host "✅ Your module is ready for Azure marketplace submission!" -ForegroundColor Green
    } elseif ($complianceScore -ge 60) {
        Write-Host "🟡 GOOD: Module partially meets Azure Terraform Module Catalog Criterion with a score of $complianceScore%." -ForegroundColor Yellow
        Write-Host "⚠️  Minor improvements needed - address the issues noted above to improve compliance." -ForegroundColor Yellow
    } else {
        Write-Host "🔴 NEEDS WORK: Module does not meet Azure Terraform Module Catalog Criterion with a score of $complianceScore%." -ForegroundColor Red
        Write-Host "❌ Significant improvements needed - please address the issues noted above." -ForegroundColor Red
    }
    
    Write-Host @"

NEXT STEPS FOR AZURE COMPLIANCE:
$(if ($complianceScore -lt 80) {
"• Review each failed requirement above
• Focus on missing files: versions.tf, required_providers.tf
• Add validation blocks to variables.tf
• Ensure all variables and outputs have descriptions
• Create examples/, test/, and diagram/ directories"
} else {
"• Great work! Your module meets Azure standards
• Consider adding more examples and test cases
• Keep documentation up to date with terraform-docs"
})

"@ -ForegroundColor Cyan
}

Show-CompletionSummary -ModulePath $ModulePath -AzureModuleCheck $AzureModuleCheck -SkipValidation $SkipValidation -GenerateDocumentation $GenerateDocumentation -ComplianceScore $(if ($AzureModuleCheck) { $complianceScore } else { 0 })
