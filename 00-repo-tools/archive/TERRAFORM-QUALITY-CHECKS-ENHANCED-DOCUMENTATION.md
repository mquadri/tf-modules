# Terraform Module Quality Checker - Enhanced Documentation

## Overview

The `run-terraform-checks-improved.ps1` script has been significantly enhanced with comprehensive help functionality, better user guidance, and improved output formatting. This document outlines all the enhancements and how to use them effectively.

## 🚀 Key Enhancements

### 1. Comprehensive Help System

#### Built-in Help (`-Help` flag)
```powershell
.\run-terraform-checks-improved.ps1 -Help
```

- **Visual Design**: Beautiful ASCII art headers and organized sections
- **Detailed Parameters**: Complete explanation of all parameters and switches
- **Usage Scenarios**: Three main use cases with explanations
- **Azure Requirements**: All 9 Azure Module Catalog requirements detailed
- **Compliance Scoring**: Color-coded scoring system explanation
- **Troubleshooting**: Common issues and solutions
- **System Requirements**: Complete technical prerequisites

#### PowerShell Standard Help
```powershell
Get-Help .\run-terraform-checks-improved.ps1 -Detailed
Get-Help .\run-terraform-checks-improved.ps1 -Examples
```

- **Comment-Based Help**: Proper PowerShell `.SYNOPSIS`, `.DESCRIPTION`, `.PARAMETER` blocks
- **Standard Examples**: 4 comprehensive usage examples
- **Parameter Documentation**: Detailed parameter descriptions
- **Links**: Relevant Azure and Terraform documentation

### 2. Enhanced Error Messages

#### No Parameters Provided
When run without parameters, shows:
- Clear error message with visual formatting
- Quick start examples for all scenarios
- Help command options
- Feature overview

#### User-Friendly Guidance
- Color-coded messages (Red for errors, Yellow for warnings, Green for success)
- Clear next steps and recommendations
- Usage tips and command examples

### 3. Improved Output and Reporting

#### Visual Headers and Sections
```
╔══════════════════════════════════════════════════════════════════════════════╗
║                    TERRAFORM MODULE QUALITY CHECKER                          ║
╚══════════════════════════════════════════════════════════════════════════════╝
```

#### Enhanced Completion Summary
- **Azure Compliance Summary**: Detailed scoring with next steps
- **Quality Check Complete**: Comprehensive summary of tools used
- **Usage Tips**: Context-aware suggestions for improvement
- **Output Files**: Clear documentation of generated files

### 4. Azure Compliance Scoring Enhancement

#### Color-Coded Results
- 🟢 **80-100%**: Excellent - Ready for Azure marketplace
- 🟡 **60-79%**: Good - Minor improvements needed
- 🔴 **0-59%**: Needs work - Significant gaps to address

#### Detailed Next Steps
- Specific recommendations based on compliance score
- Prioritized action items
- File-specific guidance

## 📋 Usage Scenarios

### 1. Basic Quality Check
```powershell
.\run-terraform-checks-improved.ps1 -ModulePath "C:\path\to\terraform\module"
```
**What it does:**
- terraform fmt (code formatting)
- tflint (static analysis)
- terraform-docs (documentation generation)
- Structure validation (file organization)

**Output:** README_GENERATED.md with complete module documentation

### 2. Azure Compliance Check
```powershell
.\run-terraform-checks-improved.ps1 -ModulePath "C:\path\to\terraform\module" -AzureModuleCheck
```
**What it includes:**
- All basic checks PLUS
- Azure Terraform Module Catalog Criterion validation
- Compliance percentage score
- Detailed requirement breakdown
- Specific recommendations for improvement

**Target:** 80%+ compliance for marketplace readiness

### 3. Quick Format & Lint
```powershell
.\run-terraform-checks-improved.ps1 -ModulePath "C:\path\to\terraform\module" -SkipValidation
```
**What it does:**
- terraform fmt, tflint, terraform-docs only
- Skips structure validation for faster execution
- Ideal for CI/CD pipelines

## 🔧 Azure Module Catalog Requirements

The script checks for these 9 specific requirements when `-AzureModuleCheck` is enabled:

| # | Requirement | File/Directory | Pattern/Check |
|---|-------------|----------------|---------------|
| 1 | **Provider Configuration** | `required_providers.tf` | Contains `required_providers` block |
| 2 | **Module Versioning** | `versions.tf` | Contains `required_version` specification |
| 3 | **Variable Validation** | `variables.tf` | Contains `validation {` blocks |
| 4 | **Variable Descriptions** | `variables.tf` | All variables have description fields |
| 5 | **Output Descriptions** | `outputs.tf` | All outputs have description fields |
| 6 | **Examples Directory** | `examples/` | Directory exists with usage examples |
| 7 | **Test Files** | `test/` | Directory exists with test code |
| 8 | **README Documentation** | `README.md` | Contains "## Usage" section |
| 9 | **Architectural Diagram** | `diagram/` | Directory exists with architecture visuals |

## 🎯 Best Practices for Module Development

### Getting Started
1. **Run Basic Check First**
   ```powershell
   .\run-terraform-checks-improved.ps1 -ModulePath "C:\path\to\module"
   ```

2. **Review Generated Documentation**
   - Check `README_GENERATED.md` for completeness
   - Ensure all variables and outputs are documented

3. **Address Structure Issues**
   - Add missing essential files (main.tf, variables.tf, outputs.tf)
   - Create recommended files (versions.tf, required_providers.tf)

### Preparing for Azure Marketplace
1. **Run Azure Compliance Check**
   ```powershell
   .\run-terraform-checks-improved.ps1 -ModulePath "C:\path\to\module" -AzureModuleCheck
   ```

2. **Target 80%+ Compliance**
   - Focus on missing requirements with highest impact
   - Prioritize: versions.tf, validation blocks, descriptions

3. **Create Supporting Structure**
   - `examples/` directory with working examples
   - `test/` directory with test cases
   - `diagram/` directory with architecture visuals

## 🔍 Troubleshooting

### Common Issues and Solutions

#### WSL Distribution Not Found
**Problem:** "WSL distribution not found"
**Solution:** 
```powershell
wsl --install -d Ubuntu-22.04
```

#### Path Conversion Failed
**Problem:** "Path conversion failed"
**Solutions:**
- Ensure path has no special characters
- Try shorter path names
- Check WSL distribution is running

#### Tool Installation Failed
**Problem:** "Tool installation failed"
**Solutions:**
- Check internet connection
- Install tools manually in WSL:
  ```bash
  # In WSL
  sudo apt update
  sudo apt install terraform
  curl -s https://raw.githubusercontent.com/terraform-linters/tflint/master/install_linux.sh | bash
  ```

### Getting More Help

#### Built-in Help Options
```powershell
# Comprehensive help with examples
.\run-terraform-checks-improved.ps1 -Help

# Standard PowerShell help
Get-Help .\run-terraform-checks-improved.ps1 -Detailed
Get-Help .\run-terraform-checks-improved.ps1 -Examples
Get-Help .\run-terraform-checks-improved.ps1 -Full
```

## 🎉 Success Indicators

### Module is Ready When:
- ✅ All tools run without errors
- ✅ terraform fmt reports no issues
- ✅ tflint shows no warnings
- ✅ README_GENERATED.md is complete and accurate
- ✅ All essential files present
- ✅ Azure compliance ≥ 80% (if targeting marketplace)

### Next Steps After Success:
1. Review and customize README_GENERATED.md
2. Add module to version control
3. Consider publishing to Terraform Registry
4. Set up CI/CD pipeline with quality checks

## 📚 Additional Resources

- [Azure Terraform Documentation](https://docs.microsoft.com/en-us/azure/terraform/)
- [Terraform Registry - Azure Modules](https://registry.terraform.io/browse/modules?provider=azurerm)
- [Terraform Best Practices](https://www.terraform.io/docs/cloud/guides/recommended-practices/index.html)
- [Azure Terraform Module Guidelines](https://docs.microsoft.com/en-us/azure/terraform/best-practices)

---

**Last Updated:** June 5, 2025  
**Script Version:** Enhanced v1.0  
**Compatibility:** Windows 10/11 with WSL, PowerShell 5.1+
