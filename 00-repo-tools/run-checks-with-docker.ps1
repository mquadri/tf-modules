<#
.SYNOPSIS
    Run Terraform quality checks using Docker for SuperLinter

.DESCRIPTION
    This script runs Terraform quality checks using Docker for the SuperLinter component.
    It is designed to bypass sudo password prompts by configuring Docker to run without sudo.

.PARAMETER ModulePath
    Path to the Terraform module directory to analyze
    Example: "C:\terraform\modules\storage-account"
#>

param (
    [Parameter(Mandatory=$true)]
    [string]$ModulePath
)

Write-Host "Running quality checks for module: $ModulePath" -ForegroundColor Green

# Convert Windows path to WSL path
try {
    # Primary method: Use direct path mapping
    if ($ModulePath -match '^([A-Za-z]):\\(.*)$') {
        $driveLetter = $Matches[1].ToLower()
        $restOfPath = $Matches[2].Replace('\', '/')
        $wslPath = "/mnt/$driveLetter/$restOfPath"
        Write-Host "Constructed WSL path: $wslPath" -ForegroundColor Yellow
    } else {
        Write-Host "Error: Could not parse Windows path format." -ForegroundColor Red
        exit 1
    }
} catch {
    Write-Host "Error converting path: $_" -ForegroundColor Red
    exit 1
}

# Get WSL distribution - Ultra simplified approach
[string]$ubuntuDistro = "Ubuntu-22.04"  # Default to common distribution name
Write-Host "Using WSL distribution: $ubuntuDistro" -ForegroundColor Cyan

# Define bash operators to avoid PowerShell parsing issues
$andOperator = [char]38 + [char]38  # &&
$orOperator = [char]124 + [char]124  # ||

# Step 3: Run Super-Linter for README.md analysis
Write-Host "`nRunning Super-Linter for README.md analysis..." -ForegroundColor Yellow

# Check if README.md exists before running superlinter
$readmeCheck = wsl.exe --distribution $ubuntuDistro --exec bash -c "test -f '$wslPath/README.md' && echo 'exists' || echo 'missing'"
if ($readmeCheck -eq "missing") {
    Write-Host "Warning: README.md file not found. Skipping Super-Linter analysis." -ForegroundColor Yellow
    exit 0
}

# Initialize a temporary Git repository if one doesn't exist to satisfy Super-Linter requirements
Write-Host "Setting up Git repository for Super-Linter..." -ForegroundColor Cyan
$gitInitCommand = "cd '$wslPath' && if [ ! -d .git ]; then git init >/dev/null 2>&1 && git config user.email 'terraform-check@local.dev' && git config user.name 'Terraform Quality Check' && git add . >/dev/null 2>&1 && git commit -m 'Initial commit for linting' >/dev/null 2>&1; fi"
wsl.exe --distribution $ubuntuDistro --exec bash -c $gitInitCommand

# Create direct docker run command (using single-line format)
Write-Host "Running Super-Linter with Docker..." -ForegroundColor Cyan

# Single-line Docker command
$dockerCommand = "cd '$wslPath' && docker run --rm -e RUN_LOCAL=true -e VALIDATE_MARKDOWN=true -e LOG_LEVEL=VERBOSE -e GIT_DISCOVERY_ACROSS_FILESYSTEM=1 -e GITHUB_WORKSPACE=/tmp/lint -e DEFAULT_BRANCH=main -v '${wslPath}:/tmp/lint' --workdir /tmp/lint github/super-linter:latest"

# Run the Docker command
$output = wsl.exe --distribution $ubuntuDistro --exec bash -c "$dockerCommand" 2>&1
$exitCode = $LASTEXITCODE

# Display results
if ($exitCode -eq 0) {
    Write-Host "`n✅ Super-Linter completed successfully! No issues found." -ForegroundColor Green
} else {
    Write-Host "`n⚠️ Super-Linter found issues. Review the output for details." -ForegroundColor Yellow
    
    # Parse and display results
    if ($output -match "ERROR") {
        $markdownErrors = $output | Select-String -Pattern "README\.md:(\d+):?(\d*)\s+(MD\d+)" -AllMatches
        
        if ($markdownErrors -and $markdownErrors.Matches.Count -gt 0) {
            Write-Host "`n📋 MARKDOWN VIOLATIONS FOUND:" -ForegroundColor Red
            Write-Host "Total violations: $($markdownErrors.Matches.Count)" -ForegroundColor Red
            
            Write-Host ""
            Write-Host "┌─────────┬────────┬─────────┬──────────────────────────────────────────────────────┐" -ForegroundColor Gray
            Write-Host "│ Line    │ Column │ Rule    │ Description                                          │" -ForegroundColor Gray
            Write-Host "├─────────┼────────┼─────────┼──────────────────────────────────────────────────────┤" -ForegroundColor Gray
            
            foreach ($match in $markdownErrors.Matches) {
                $line = $match.Groups[1].Value.PadLeft(7)
                $col = if ($match.Groups[2].Value) { $match.Groups[2].Value.PadLeft(6) } else { "1".PadLeft(6) }
                $rule = $match.Groups[3].Value.PadLeft(7)
                
                # Get description based on rule
                $desc = switch ($rule) {
                    "MD041" { "First line should be a top level header".PadRight(52) }
                    "MD013" { "Line too long".PadRight(52) }
                    "MD034" { "Bare URL used".PadRight(52) }
                    "MD047" { "File should end with a single newline".PadRight(52) }
                    "MD012" { "Multiple consecutive blank lines".PadRight(52) }
                    default { "Markdown formatting issue".PadRight(52) }
                }
                
                Write-Host "│ $line │ $col │ $rule │ $desc │" -ForegroundColor Red
            }
            
            Write-Host "└─────────┴────────┴─────────┴──────────────────────────────────────────────────────┘" -ForegroundColor Gray
        } else {
            Write-Host "Markdown issues were detected but could not be parsed. See full output below:" -ForegroundColor Yellow
            Write-Host $output -ForegroundColor Gray
        }
    } else {
        Write-Host "Output could not be parsed. See full output below:" -ForegroundColor Yellow
        Write-Host $output -ForegroundColor Gray
    }
}

# Clean up temporary Git repository if it was created for linting
$cleanupCommand = "cd '$wslPath' && if [ -f .git/config ] && grep -q 'terraform-check@local.dev' .git/config >/dev/null 2>&1; then rm -rf .git >/dev/null 2>&1; fi"
wsl.exe --distribution $ubuntuDistro --exec bash -c $cleanupCommand

Write-Host "`nSuper-Linter analysis completed." -ForegroundColor Green
