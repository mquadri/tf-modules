#!/bin/bash
# Terraform Module Quality Check Script (Docker bash version)
# Aligned with Azure Terraform Module Catalog Criterion v2.0
# This script runs formatting, linting, Azure compliance checks, and optional documentation generation
# 
# Usage: 
#   ./run-terraform-checks.sh <path-to-module>
# Environment Variables:
#   GENERATE_DOCS: Set to "true" to enable terraform-docs generation (default: false)

# Check if a module path was provided
if [ "$#" -ne 1 ]; then
    echo "Error: No module path provided."
    echo "Usage: $0 <path-to-module>"
    exit 1
fi

MODULE_PATH="$1"
WORKSPACE="/workspace"

# Check if the module path exists
if [ ! -d "$MODULE_PATH" ]; then
    echo "Error: Module path does not exist: $MODULE_PATH"
    exit 1
fi

echo "🔍 Running Azure Terraform Module Catalog quality checks on: $MODULE_PATH"
echo "📋 Azure compliance checks aligned with Lumen enterprise standards"
echo ""

# Step 1: Run terraform fmt
echo -e "\nStep 1: Running terraform fmt..."
if ! terraform fmt -recursive -check; then
    echo "terraform fmt found formatting issues. Fixing..."
    terraform fmt -recursive
    echo "Formatting fixed with terraform fmt."
else
    echo "terraform fmt check completed successfully. No formatting issues found."
fi

# Step 2: Run tflint
echo -e "\nStep 2: Running tflint..."
if ! tflint --recursive; then
    echo "Warning: tflint found issues that need to be addressed."
else
    echo "tflint completed successfully with no issues."
fi

# Step 3: Conditional terraform-docs generation
echo -e "\n📝 Step 3: Documentation Generation"
if [ "$GENERATE_DOCS" = "true" ]; then
    echo "✅ Running terraform-docs (documentation generation enabled)..."
    
    # Create a temporary directory with proper permissions inside the container
    mkdir -p /tmp/terraform-docs-output
    chmod 777 /tmp/terraform-docs-output

    if ! terraform-docs markdown table . > /tmp/terraform-docs-output/README_GENERATED.md; then
        echo "⚠️  Warning: terraform-docs had issues."
    else
        echo "✅ terraform-docs completed successfully."
        
        # First try to write directly to the output mount
        if [ -d "/output" ] && [ -w "/output" ]; then
            echo "📁 Writing documentation to /output directory..."
            cp /tmp/terraform-docs-output/README_GENERATED.md /output/README_GENERATED.md
            chmod 666 /output/README_GENERATED.md
            echo "✅ Documentation generated: /output/README_GENERATED.md"
        fi
        
        # Also try writing to workspace (this might fail due to permissions)
        echo "📁 Attempting to write to workspace directory..."
        if cp /tmp/terraform-docs-output/README_GENERATED.md ./README_GENERATED.md 2>/dev/null; then
            chmod 666 ./README_GENERATED.md 2>/dev/null
            echo "✅ Documentation also generated: ./README_GENERATED.md"
        else
            echo "ℹ️  Note: Could not write README_GENERATED.md to workspace directory due to permissions."
        fi
        
        # Check if at least one of the files was created successfully
        if [ ! -f "/output/README_GENERATED.md" ] && [ ! -f "./README_GENERATED.md" ]; then
            echo "⚠️  Warning: README_GENERATED.md file was not created in either location."
        fi
    fi
else
    echo "⏭️  Documentation generation disabled (GENERATE_DOCS != 'true')"
    echo "💡 Tip: Use -GenerateDocumentation parameter to enable README creation"
fi

# Step 4: Azure Terraform Module Catalog Criterion Compliance Check
echo -e "\n🔧 Step 4: Azure Terraform Module Catalog Criterion Compliance Check"
echo "📋 Checking compliance with Lumen Azure Terraform Module standards..."

# Initialize compliance tracking
total_checks=0
passed_checks=0

# Function to check compliance item
check_compliance() {
    local check_name="$1"
    local condition="$2"
    local file_path="$3"
    local pattern="$4"
    
    total_checks=$((total_checks + 1))
    echo -n "   Checking $check_name... "
    
    if [ "$condition" = "file_exists" ]; then
        if [ -f "$file_path" ]; then
            echo "✅ PASS"
            passed_checks=$((passed_checks + 1))
        else
            echo "❌ FAIL (file missing: $file_path)"
        fi
    elif [ "$condition" = "dir_exists" ]; then
        if [ -d "$file_path" ]; then
            echo "✅ PASS"
            passed_checks=$((passed_checks + 1))
        else
            echo "❌ FAIL (directory missing: $file_path)"
        fi
    elif [ "$condition" = "pattern_in_file" ]; then
        if [ -f "$file_path" ] && grep -q "$pattern" "$file_path"; then
            echo "✅ PASS"
            passed_checks=$((passed_checks + 1))
        else
            echo "❌ FAIL (pattern '$pattern' not found in $file_path)"
        fi
    fi
}

# Core module structure requirements
check_compliance "Essential file: main.tf" "file_exists" "main.tf"
check_compliance "Essential file: variables.tf" "file_exists" "variables.tf"
check_compliance "Essential file: outputs.tf" "file_exists" "outputs.tf"
check_compliance "Essential file: README.md" "file_exists" "README.md"

# Azure Terraform Module Catalog specific requirements
check_compliance "Provider requirements (versions.tf)" "file_exists" "versions.tf"
check_compliance "Required providers block" "pattern_in_file" "versions.tf" "required_providers"
check_compliance "Terraform version constraint" "pattern_in_file" "versions.tf" "required_version"
check_compliance "Variable descriptions" "pattern_in_file" "variables.tf" "description"
check_compliance "Output descriptions" "pattern_in_file" "outputs.tf" "description"
check_compliance "Examples directory" "dir_exists" "examples"
check_compliance "Test directory" "dir_exists" "test"
check_compliance "README usage section" "pattern_in_file" "README.md" "## Usage\|## Example\|## Examples"

# Additional Azure-specific checks
check_compliance "Variable validation blocks" "pattern_in_file" "variables.tf" "validation"
check_compliance "Resource tagging references" "pattern_in_file" "main.tf" "tags\|tag"

# Calculate compliance percentage
compliance_percentage=$((passed_checks * 100 / total_checks))

echo ""
echo "📊 Azure Terraform Module Catalog Criterion Compliance Report:"
echo "   Total Checks: $total_checks"
echo "   Passed: $passed_checks"
echo "   Failed: $((total_checks - passed_checks))"
echo "   Compliance Score: $compliance_percentage%"

if [ $compliance_percentage -ge 80 ]; then
    echo "   Status: ✅ COMPLIANT (≥80%)"
elif [ $compliance_percentage -ge 60 ]; then
    echo "   Status: ⚠️  PARTIALLY COMPLIANT (60-79%)"
else
    echo "   Status: ❌ NON-COMPLIANT (<60%)"
fi

# Step 5: Validate module structure
echo -e "\nStep 5: Validating module structure..."

# Define expected files for a standard Terraform module
expected_files=("main.tf" "variables.tf" "outputs.tf" "README.md")
recommended_files=("required_providers.tf" "versions.tf" "examples/" "test/")

# Check for expected files
echo "Checking for essential module files..."
for file in "${expected_files[@]}"; do
    if [ -e "$file" ]; then
        echo "Essential file '$file' exists."
    else
        echo "Warning: Essential file '$file' is missing from the module."
    fi
done

# Check for recommended files
echo -e "\nChecking for recommended module files/directories..."
for file in "${recommended_files[@]}"; do
    if [ -e "$file" ]; then
        echo "Recommended file/directory '$file' exists."
    else
        echo "Note: Recommended file/directory '$file' is missing from the module."
    fi
done

echo -e "\nModule structure validation completed."
echo -e "\nAll checks and validations completed!"
echo "Please review the output and address any issues identified by the tools."
