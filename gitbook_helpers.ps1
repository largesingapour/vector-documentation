# GitBook Workflow Helper Functions
# Common operations for the GitBook-GitHub-Local workflow

# Function to add, commit, and push changes
function Sync-ToGitBook {
    param(
        [Parameter(Mandatory=$true)]
        [string]$CommitMessage,
        
        [Parameter(Mandatory=$false)]
        [string]$Branch = "main"
    )
    
    Write-Host "🔄 Syncing changes to GitBook..." -ForegroundColor Cyan
    
    # Check if we're in a git repository
    if (-not (Test-Path ".git")) {
        Write-Host "❌ Not in a Git repository. Please navigate to your GitBook repository." -ForegroundColor Red
        return $false
    }
    
    try {
        # Add all changes
        Write-Host "📝 Adding changes..." -ForegroundColor Yellow
        git add .
        
        # Check if there are changes to commit
        $status = git status --porcelain
        if (-not $status) {
            Write-Host "ℹ️  No changes to commit." -ForegroundColor Blue
            return $true
        }
        
        # Commit changes
        Write-Host "💾 Committing changes..." -ForegroundColor Yellow
        git commit -m $CommitMessage
        
        # Push to GitHub
        Write-Host "🚀 Pushing to GitHub..." -ForegroundColor Yellow
        git push origin $Branch
        
        Write-Host "✅ Changes synced successfully!" -ForegroundColor Green
        Write-Host "🔄 GitBook will automatically sync from GitHub." -ForegroundColor Cyan
        
        return $true
    }
    catch {
        Write-Host "❌ Error during sync: $_" -ForegroundColor Red
        return $false
    }
}

# Function to create a new page
function New-GitBookPage {
    param(
        [Parameter(Mandatory=$true)]
        [string]$Path,
        
        [Parameter(Mandatory=$true)]
        [string]$Title,
        
        [Parameter(Mandatory=$false)]
        [string]$Content = ""
    )
    
    Write-Host "📄 Creating new GitBook page: $Path" -ForegroundColor Yellow
    
    # Create directory if it doesn't exist
    $directory = Split-Path $Path -Parent
    if ($directory -and -not (Test-Path $directory)) {
        New-Item -ItemType Directory -Path $directory -Force | Out-Null
        Write-Host "📁 Created directory: $directory" -ForegroundColor Green
    }
    
    # Create the page content
    $pageContent = @"
# $Title

$Content

"@
    
    # Write to file
    $pageContent | Out-File -FilePath $Path -Encoding UTF8
    Write-Host "✅ Created page: $Path" -ForegroundColor Green
    
    # Remind to update SUMMARY.md
    Write-Host "📋 Don't forget to add this page to SUMMARY.md for navigation!" -ForegroundColor Yellow
}

# Function to update SUMMARY.md
function Add-ToSummary {
    param(
        [Parameter(Mandatory=$true)]
        [string]$Title,
        
        [Parameter(Mandatory=$true)]
        [string]$Path,
        
        [Parameter(Mandatory=$false)]
        [int]$IndentLevel = 0
    )
    
    if (-not (Test-Path "SUMMARY.md")) {
        Write-Host "❌ SUMMARY.md not found. Please create it first." -ForegroundColor Red
        return $false
    }
    
    $indent = "  " * $IndentLevel
    $entry = "$indent* [$Title]($Path)"
    
    # Add to SUMMARY.md
    Add-Content -Path "SUMMARY.md" -Value $entry -Encoding UTF8
    Write-Host "✅ Added '$Title' to SUMMARY.md" -ForegroundColor Green
}

# Function to check GitBook sync status
function Get-SyncStatus {
    Write-Host "📊 Git Repository Status:" -ForegroundColor Cyan
    
    if (-not (Test-Path ".git")) {
        Write-Host "❌ Not in a Git repository." -ForegroundColor Red
        return
    }
    
    # Show current branch
    $branch = git rev-parse --abbrev-ref HEAD
    Write-Host "🌿 Current branch: $branch" -ForegroundColor Green
    
    # Show status
    Write-Host "📝 Git status:" -ForegroundColor Yellow
    git status --short
    
    # Show last commit
    Write-Host "💾 Last commit:" -ForegroundColor Yellow
    git log -1 --oneline
    
    # Check for unpushed commits
    $unpushed = git log origin/$branch..$branch --oneline
    if ($unpushed) {
        Write-Host "⚠️  Unpushed commits:" -ForegroundColor Yellow
        $unpushed
    } else {
        Write-Host "✅ All commits are pushed to GitHub" -ForegroundColor Green
    }
}

# Function to create a new branch for changes
function New-GitBookBranch {
    param(
        [Parameter(Mandatory=$true)]
        [string]$BranchName
    )
    
    Write-Host "🌿 Creating new branch: $BranchName" -ForegroundColor Yellow
    
    try {
        git checkout -b $BranchName
        Write-Host "✅ Created and switched to branch: $BranchName" -ForegroundColor Green
        Write-Host "💡 Make your changes, then use Sync-ToGitBook to push them." -ForegroundColor Cyan
    }
    catch {
        Write-Host "❌ Error creating branch: $_" -ForegroundColor Red
    }
}

# Function to switch branches
function Switch-GitBookBranch {
    param(
        [Parameter(Mandatory=$true)]
        [string]$BranchName
    )
    
    Write-Host "🔄 Switching to branch: $BranchName" -ForegroundColor Yellow
    
    try {
        git checkout $BranchName
        Write-Host "✅ Switched to branch: $BranchName" -ForegroundColor Green
    }
    catch {
        Write-Host "❌ Error switching branch: $_" -ForegroundColor Red
    }
}

# Function to validate GitBook structure
function Test-GitBookStructure {
    Write-Host "🔍 Validating GitBook structure..." -ForegroundColor Cyan
    
    $issues = @()
    
    # Check for required files
    if (-not (Test-Path "README.md")) {
        $issues += "❌ README.md is missing"
    } else {
        Write-Host "✅ README.md found" -ForegroundColor Green
    }
    
    if (-not (Test-Path "SUMMARY.md")) {
        $issues += "❌ SUMMARY.md is missing"
    } else {
        Write-Host "✅ SUMMARY.md found" -ForegroundColor Green
        
        # Validate SUMMARY.md links
        $summary = Get-Content "SUMMARY.md"
        foreach ($line in $summary) {
            if ($line -match '\[.*\]\((.*\.md)\)') {
                $linkedFile = $matches[1]
                if (-not (Test-Path $linkedFile)) {
                    $issues += "❌ SUMMARY.md references missing file: $linkedFile"
                }
            }
        }
    }
    
    if (Test-Path ".gitbook.yaml") {
        Write-Host "✅ .gitbook.yaml found" -ForegroundColor Green
    } elseif (Test-Path "book.json") {
        Write-Host "✅ book.json found (legacy)" -ForegroundColor Green
    } else {
        $issues += "⚠️  No GitBook configuration file found (.gitbook.yaml or book.json)"
    }
    
    # Report issues
    if ($issues.Count -eq 0) {
        Write-Host "🎉 GitBook structure is valid!" -ForegroundColor Green
    } else {
        Write-Host "📋 Issues found:" -ForegroundColor Yellow
        foreach ($issue in $issues) {
            Write-Host "  $issue" -ForegroundColor Red
        }
    }
}

# Function to show available commands
function Show-GitBookCommands {
    Write-Host "🛠️  Available GitBook Workflow Commands:" -ForegroundColor Cyan
    Write-Host ""
    Write-Host "📝 Content Management:" -ForegroundColor Yellow
    Write-Host "  New-GitBookPage -Path 'folder/page.md' -Title 'Page Title' [-Content 'Initial content']" -ForegroundColor Gray
    Write-Host "  Add-ToSummary -Title 'Page Title' -Path 'folder/page.md' [-IndentLevel 1]" -ForegroundColor Gray
    Write-Host ""
    Write-Host "🔄 Sync Operations:" -ForegroundColor Yellow
    Write-Host "  Sync-ToGitBook -CommitMessage 'Your commit message' [-Branch 'main']" -ForegroundColor Gray
    Write-Host "  Get-SyncStatus" -ForegroundColor Gray
    Write-Host ""
    Write-Host "🌿 Branch Management:" -ForegroundColor Yellow
    Write-Host "  New-GitBookBranch -BranchName 'feature-name'" -ForegroundColor Gray
    Write-Host "  Switch-GitBookBranch -BranchName 'branch-name'" -ForegroundColor Gray
    Write-Host ""
    Write-Host "🔍 Validation:" -ForegroundColor Yellow
    Write-Host "  Test-GitBookStructure" -ForegroundColor Gray
    Write-Host ""
    Write-Host "📚 Help:" -ForegroundColor Yellow
    Write-Host "  Show-GitBookCommands" -ForegroundColor Gray
}

# Display commands when script is loaded
Write-Host "🚀 GitBook Helper Functions Loaded!" -ForegroundColor Green
Write-Host "Type 'Show-GitBookCommands' to see available commands." -ForegroundColor Cyan 