#!/bin/bash
# Terraform Module Quality Check Script (Docker bash version)
# This script runs formatting, linting, and documentation generation for Terraform modules
# 
# Usage: 
#   ./run-terraform-checks.sh <path-to-module>

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

echo "Running quality checks on Terraform module at: $MODULE_PATH"

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

# Step 3: Run terraform-docs
echo -e "\nStep 3: Running terraform-docs..."
# Create a temporary directory with proper permissions inside the container
mkdir -p /tmp/terraform-docs-output
chmod 777 /tmp/terraform-docs-output

if ! terraform-docs markdown table . > /tmp/terraform-docs-output/README_GENERATED.md; then
    echo "Warning: terraform-docs had issues."
else
    echo "terraform-docs completed successfully."
    
    # First try to write directly to the output mount
    if [ -d "/output" ] && [ -w "/output" ]; then
        echo "Writing to /output directory..."
        cp /tmp/terraform-docs-output/README_GENERATED.md /output/README_GENERATED.md
        chmod 666 /output/README_GENERATED.md
        echo "Documentation generated to: /output/README_GENERATED.md"
    fi
    
    # Also try writing to workspace (this might fail due to permissions)
    echo "Attempting to write to workspace directory..."
    if cp /tmp/terraform-docs-output/README_GENERATED.md ./README_GENERATED.md 2>/dev/null; then
        chmod 666 ./README_GENERATED.md 2>/dev/null
        echo "Documentation also generated to: ./README_GENERATED.md"
    else
        echo "Note: Could not write README_GENERATED.md to workspace directory due to permissions."
    fi
    
    # Check if at least one of the files was created successfully
    if [ ! -f "/output/README_GENERATED.md" ] && [ ! -f "./README_GENERATED.md" ]; then
        echo "Warning: README_GENERATED.md file was not created in either location. Check for errors in terraform-docs execution."
    fi
fi

# Step 4: Validate module structure
echo -e "\nStep 4: Validating module structure..."

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
