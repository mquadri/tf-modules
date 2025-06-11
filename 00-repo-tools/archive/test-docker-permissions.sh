#!/bin/bash
# Terraform Docker Permission Test Script
# This script helps diagnose permission issues with Docker volume mounts
# Usage: ./test-docker-permissions.sh <module-path>

MODULE_PATH="$1"

if [ -z "$MODULE_PATH" ]; then
    echo "Error: No module path provided."
    echo "Usage: $0 <module-path>"
    exit 1
fi

ABSOLUTE_PATH=$(realpath "$MODULE_PATH")

echo "Running Docker permission tests for directory: $ABSOLUTE_PATH"

# Test writing to various locations
echo "Testing Docker container file permissions..."

# Create temp dir for output
TEMP_DIR=$(mktemp -d)
echo "Created temporary directory: $TEMP_DIR"

docker run --rm \
    -v "${ABSOLUTE_PATH}:/workspace" \
    -v "${TEMP_DIR}:/output" \
    --user root \
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
        
        echo 'Test 5: Running terraform-docs'
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

# Check if test files were created
echo ""
echo "Checking test files in module directory..."
if [ -f "$ABSOLUTE_PATH/test-file.txt" ]; then
    echo "✅ test-file.txt was created in the module directory"
    # Clean up test file
    rm "$ABSOLUTE_PATH/test-file.txt"
else
    echo "❌ test-file.txt was NOT created in the module directory"
fi

if [ -f "$ABSOLUTE_PATH/README_GENERATED.md" ]; then
    echo "✅ README_GENERATED.md was created in the module directory"
    # Clean up test file
    rm "$ABSOLUTE_PATH/README_GENERATED.md"
else
    echo "❌ README_GENERATED.md was NOT created in the module directory"
fi

echo ""
echo "Checking test files in temp output directory..."
if [ -f "$TEMP_DIR/test-file.txt" ]; then
    echo "✅ test-file.txt was created in the output directory"
else
    echo "❌ test-file.txt was NOT created in the output directory"
fi

if [ -f "$TEMP_DIR/README_GENERATED.md" ]; then
    echo "✅ README_GENERATED.md was created in the output directory"
else
    echo "❌ README_GENERATED.md was NOT created in the output directory"
fi

# Clean up the temp directory
rm -rf "$TEMP_DIR"
echo "Cleaned up temporary directory"

echo ""
echo "Test completed. Use this information to diagnose permission issues with Docker volume mounts."
