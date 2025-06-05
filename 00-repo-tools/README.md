# Terraform Module Quality Check Tools

This directory contains scripts for checking the quality of Terraform modules, including formatting, linting, and documentation generation. The tools are designed to work in both Windows and Linux environments and include Docker-based versions to avoid dependency on WSL.

## Scripts Overview

### Docker-Based Scripts (Recommended)

- **run-checks-with-docker.ps1**: Main script to run all quality checks using Docker
- **run-terraform-checks-docker.ps1**: Docker-specific implementation of Terraform checks
- **Dockerfile**: Defines the Docker image with all required tools
- **run-terraform-checks.sh**: Shell script that runs inside the Docker container

### WSL-Based Scripts

- **run-terraform-checks.ps1**: Original script that uses WSL for running checks
- **run-terraform-checks-improved.ps1**: Improved version with better WSL path handling

### Troubleshooting Tools

- **test-docker-permissions.ps1**: PowerShell script to test Docker volume mount permissions
- **test-docker-permissions.sh**: Bash script to test Docker volume mount permissions

## Usage

### Docker-Based Approach (Recommended)

This approach doesn't require WSL and avoids permission issues:

```powershell
# Run checks for a module
.\run-checks-with-docker.ps1 -ModulePath "C:\path\to\module"

# Force rebuilding the Docker image
.\run-checks-with-docker.ps1 -ModulePath "C:\path\to\module" -RebuildImage

# Use a custom image name
.\run-checks-with-docker.ps1 -ModulePath "C:\path\to\module" -ImageName "my-terraform-checks"
```

### WSL-Based Approach

If you prefer using WSL:

```powershell
# Run checks for a module using WSL
.\run-terraform-checks-improved.ps1 -ModulePath "C:\path\to\module"

# Specify a WSL distribution
.\run-terraform-checks-improved.ps1 -ModulePath "C:\path\to\module" -WslDistribution "Ubuntu-20.04"
```

### Troubleshooting Permission Issues

If you're experiencing permission issues, use these tools to diagnose:

```powershell
# Test Docker permissions
.\test-docker-permissions.ps1 -ModulePath "C:\path\to\module"
```

## Requirements

### For Docker-Based Approach
- Docker Desktop installed and running
- PowerShell 5.1 or later

### For WSL-Based Approach
- Windows Subsystem for Linux (WSL) installed
- A Linux distribution with terraform, tflint, and terraform-docs installed

## Resolving Common Issues

### Permission Denied Errors

If you see "Permission denied" errors when running the tools:

1. Use the Docker-based approach which runs as root inside the container
2. Make sure your Windows user has full permissions on the module directory
3. Run the permission test script to identify specific permission issues

### WSL Path Conversion Issues

If you see path conversion errors with WSL:

1. Switch to the Docker-based approach
2. Use the improved WSL script which has better path handling
3. Make sure your module path doesn't contain special characters

## How It Works

The Docker-based solution works by:

1. Creating a Docker image with Terraform, tflint, and terraform-docs
2. Mounting your module directory as a volume inside the container
3. Running the quality checks inside the container where all tools are available
4. Copying the generated files back to your module directory

This approach isolates the tools and their dependencies from your host system, avoiding version conflicts and environment issues.
