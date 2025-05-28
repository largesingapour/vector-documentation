# GitBook Workflow Setup Script for Windows PowerShell
# This script sets up the local environment for GitBook-GitHub-Local workflow

param(
    [Parameter(Mandatory=$false)]
    [string]$RepoUrl,
    
    [Parameter(Mandatory=$false)]
    [string]$UserName,
    
    [Parameter(Mandatory=$false)]
    [string]$UserEmail,
    
    [Parameter(Mandatory=$false)]
    [string]$Branch = "main"
)

Write-Host "🚀 GitBook Workflow Setup Script" -ForegroundColor Cyan
Write-Host "=================================" -ForegroundColor Cyan

# Function to check if git is installed
function Test-GitInstallation {
    try {
        git --version | Out-Null
        return $true
    }
    catch {
        return $false
    }
}

# Function to configure git if needed
function Set-GitConfiguration {
    param($Name, $Email)
    
    if ($Name -and $Email) {
        Write-Host "📝 Configuring Git..." -ForegroundColor Yellow
        git config --global user.name "$Name"
        git config --global user.email "$Email"
        Write-Host "✅ Git configured with name: $Name and email: $Email" -ForegroundColor Green
    } else {
        Write-Host "⚠️  Git user configuration not provided. You may need to configure it manually." -ForegroundColor Yellow
        Write-Host "   Use: git config --global user.name 'Your Name'" -ForegroundColor Gray
        Write-Host "   Use: git config --global user.email 'your.email@example.com'" -ForegroundColor Gray
    }
}

# Function to clone repository
function Clone-Repository {
    param($Url, $BranchName)
    
    if (-not $Url) {
        Write-Host "❌ Repository URL not provided." -ForegroundColor Red
        Write-Host "Please provide repository URL when running the script:" -ForegroundColor Yellow
        Write-Host ".\setup_gitbook_workflow.ps1 -RepoUrl 'https://github.com/username/repo.git'" -ForegroundColor Gray
        return $false
    }
    
    # Extract repository name from URL
    $repoName = ($Url -split '/')[-1] -replace '\.git$', ''
    
    Write-Host "📂 Cloning repository: $repoName" -ForegroundColor Yellow
    Write-Host "🌐 URL: $Url" -ForegroundColor Gray
    Write-Host "🌿 Branch: $BranchName" -ForegroundColor Gray
    
    try {
        if (Test-Path $repoName) {
            Write-Host "⚠️  Directory '$repoName' already exists." -ForegroundColor Yellow
            $response = Read-Host "Do you want to remove it and re-clone? (y/n)"
            if ($response -eq 'y' -or $response -eq 'Y') {
                Remove-Item -Path $repoName -Recurse -Force
                Write-Host "🗑️  Removed existing directory" -ForegroundColor Yellow
            } else {
                Write-Host "❌ Skipping clone operation" -ForegroundColor Red
                return $false
            }
        }
        
        git clone --branch $BranchName $Url
        
        if (Test-Path $repoName) {
            Write-Host "✅ Repository cloned successfully!" -ForegroundColor Green
            Set-Location $repoName
            Write-Host "📍 Changed directory to: $(Get-Location)" -ForegroundColor Green
            return $true
        } else {
            Write-Host "❌ Failed to clone repository" -ForegroundColor Red
            return $false
        }
    }
    catch {
        Write-Host "❌ Error cloning repository: $_" -ForegroundColor Red
        return $false
    }
}

# Function to analyze GitBook structure
function Show-GitBookStructure {
    Write-Host "📋 Analyzing GitBook structure..." -ForegroundColor Yellow
    
    $files = @()
    
    if (Test-Path "README.md") {
        $files += "README.md (Main page)"
    }
    
    if (Test-Path "SUMMARY.md") {
        $files += "SUMMARY.md (Table of contents)"
    }
    
    if (Test-Path ".gitbook.yaml") {
        $files += ".gitbook.yaml (GitBook configuration)"
    }
    
    if (Test-Path "book.json") {
        $files += "book.json (Legacy GitBook configuration)"
    }
    
    # Find markdown files
    $mdFiles = Get-ChildItem -Recurse -Filter "*.md" | Where-Object { $_.Name -ne "README.md" -and $_.Name -ne "SUMMARY.md" }
    
    Write-Host "📚 GitBook Structure Analysis:" -ForegroundColor Cyan
    if ($files.Count -gt 0) {
        foreach ($file in $files) {
            Write-Host "  ✅ $file" -ForegroundColor Green
        }
    } else {
        Write-Host "  ⚠️  No GitBook configuration files found" -ForegroundColor Yellow
    }
    
    if ($mdFiles.Count -gt 0) {
        Write-Host "📄 Found $($mdFiles.Count) additional markdown files:" -ForegroundColor Cyan
        foreach ($file in $mdFiles | Select-Object -First 10) {
            Write-Host "  📝 $($file.FullName.Replace((Get-Location).Path, '.'))" -ForegroundColor Gray
        }
        if ($mdFiles.Count -gt 10) {
            Write-Host "  ... and $($mdFiles.Count - 10) more files" -ForegroundColor Gray
        }
    }
}

# Function to create sample GitBook files if needed
function Initialize-GitBookStructure {
    Write-Host "🛠️  Setting up GitBook structure..." -ForegroundColor Yellow
    
    if (-not (Test-Path "README.md")) {
        $readmeContent = @"
# Documentation

Welcome to our documentation!

This documentation is synced with GitBook and GitHub.

## Getting Started

This repository contains our project documentation. The content is written in Markdown and automatically synced with GitBook.

## Structure

- Use SUMMARY.md to define the table of contents
- Organize content in folders for better structure
- Follow GitBook's Markdown conventions for best results
"@
        $readmeContent | Out-File -FilePath "README.md" -Encoding UTF8
        Write-Host "  ✅ Created README.md" -ForegroundColor Green
    }
    
    if (-not (Test-Path "SUMMARY.md")) {
        $summaryContent = @"
# Table of Contents

* [Introduction](README.md)
* [Getting Started](getting-started/README.md)
  * [Installation](getting-started/installation.md)
  * [Configuration](getting-started/configuration.md)
* [User Guide](user-guide/README.md)
  * [Basic Usage](user-guide/basic-usage.md)
  * [Advanced Features](user-guide/advanced-features.md)
* [API Reference](api-reference/README.md)
* [FAQ](faq.md)
"@
        $summaryContent | Out-File -FilePath "SUMMARY.md" -Encoding UTF8
        Write-Host "  ✅ Created SUMMARY.md" -ForegroundColor Green
    }
    
    if (-not (Test-Path ".gitbook.yaml")) {
        $configContent = @"
root: ./

structure:
  readme: README.md
  summary: SUMMARY.md
"@
        $configContent | Out-File -FilePath ".gitbook.yaml" -Encoding UTF8
        Write-Host "  ✅ Created .gitbook.yaml" -ForegroundColor Green
    }
}

# Main execution
Write-Host ""

# Check Git installation
if (-not (Test-GitInstallation)) {
    Write-Host "❌ Git is not installed or not available in PATH" -ForegroundColor Red
    Write-Host "Please install Git from: https://git-scm.com/download/win" -ForegroundColor Yellow
    exit 1
}

Write-Host "✅ Git is installed" -ForegroundColor Green

# Configure Git if parameters provided
Set-GitConfiguration -Name $UserName -Email $UserEmail

# Clone repository if URL provided
if ($RepoUrl) {
    if (Clone-Repository -Url $RepoUrl -BranchName $Branch) {
        Show-GitBookStructure
        
        # Ask if user wants to initialize GitBook structure
        $response = Read-Host "Do you want to initialize GitBook structure files? (y/n)"
        if ($response -eq 'y' -or $response -eq 'Y') {
            Initialize-GitBookStructure
        }
        
        Write-Host ""
        Write-Host "🎉 Setup Complete!" -ForegroundColor Green
        Write-Host "You can now:" -ForegroundColor Cyan
        Write-Host "  1. Edit files using the assistant" -ForegroundColor Gray
        Write-Host "  2. Commit changes: git add . && git commit -m 'Your message'" -ForegroundColor Gray
        Write-Host "  3. Push to GitHub: git push" -ForegroundColor Gray
        Write-Host "  4. Changes will automatically sync to GitBook!" -ForegroundColor Gray
    }
} else {
    Write-Host "ℹ️  No repository URL provided. Please run with -RepoUrl parameter to clone a repository." -ForegroundColor Blue
    Write-Host ""
    Write-Host "Example usage:" -ForegroundColor Yellow
    Write-Host ".\setup_gitbook_workflow.ps1 -RepoUrl 'https://github.com/username/repo.git' -UserName 'Your Name' -UserEmail 'your.email@example.com'" -ForegroundColor Gray
}

Write-Host ""
Write-Host "📚 For more information, see: GitBook-GitHub-Workflow-Guide.md" -ForegroundColor Cyan 