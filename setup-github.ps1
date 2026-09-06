# Setup GitHub Repository
# Run this script to automatically push your calculator to GitHub

Write-Host "======================================" -ForegroundColor Cyan
Write-Host "Calculator - GitHub Setup Script" -ForegroundColor Cyan
Write-Host "======================================" -ForegroundColor Cyan
Write-Host ""

# Check if git is installed
try {
    git --version | Out-Null
} catch {
    Write-Host "ERROR: Git is not installed!" -ForegroundColor Red
    Write-Host "Download from: https://git-scm.com/download/win" -ForegroundColor Yellow
    Write-Host ""
    Read-Host "Press Enter to exit"
    exit 1
}

Write-Host "✓ Git found" -ForegroundColor Green
Write-Host ""

# Get GitHub username
$gitHubUsername = Read-Host "Enter your GitHub username"
if ([string]::IsNullOrWhiteSpace($gitHubUsername)) {
    Write-Host "ERROR: GitHub username cannot be empty" -ForegroundColor Red
    exit 1
}

# Get repository name
$repoName = Read-Host "Enter repository name (default: calculator)"
if ([string]::IsNullOrWhiteSpace($repoName)) {
    $repoName = "calculator"
}

Write-Host ""
Write-Host "Setting up repository..." -ForegroundColor Yellow
Write-Host ""

# Initialize git if needed
if (!(Test-Path .git)) {
    Write-Host "[1/5] Initializing git repository..."
    git init
}

# Configure git (local)
Write-Host "[2/5] Configuring git..."
$gitName = git config user.name
$gitEmail = git config user.email

if ([string]::IsNullOrWhiteSpace($gitName)) {
    Write-Host "    Git username not set. Enter your name:"
    $gitName = Read-Host "    Name"
    git config user.name $gitName
}

if ([string]::IsNullOrWhiteSpace($gitEmail)) {
    Write-Host "    Git email not set. Enter your email:"
    $gitEmail = Read-Host "    Email"
    git config user.email $gitEmail
}

Write-Host "    Name: $gitName" -ForegroundColor Green
Write-Host "    Email: $gitEmail" -ForegroundColor Green

# Add all files
Write-Host "[3/5] Adding files to git..."
git add .
if ($LASTEXITCODE -eq 0) {
    Write-Host "    ✓ Files added" -ForegroundColor Green
} else {
    Write-Host "    ERROR: Failed to add files" -ForegroundColor Red
    exit 1
}

# Create commit
Write-Host "[4/5] Creating commit..."
$commitMessage = "Initial commit: Add Material Design calculator"
git commit -m $commitMessage
if ($LASTEXITCODE -eq 0) {
    Write-Host "    ✓ Commit created" -ForegroundColor Green
} else {
    Write-Host "    ERROR: Failed to create commit" -ForegroundColor Red
    exit 1
}

# Rename to main branch
Write-Host "[5/5] Setting up GitHub remote..."
git branch -M main
git remote remove origin 2>$null  # Remove if exists
git remote add origin "https://github.com/$gitHubUsername/$repoName.git"

if ($LASTEXITCODE -eq 0) {
    Write-Host "    ✓ Remote added: github.com/$gitHubUsername/$repoName" -ForegroundColor Green
} else {
    Write-Host "    ERROR: Failed to add remote" -ForegroundColor Red
    exit 1
}

Write-Host ""
Write-Host "======================================" -ForegroundColor Green
Write-Host "Ready to Push!" -ForegroundColor Green
Write-Host "======================================" -ForegroundColor Green
Write-Host ""

Write-Host "Next steps:" -ForegroundColor Yellow
Write-Host "1. Create repository on GitHub:" -ForegroundColor White
Write-Host "   https://github.com/new" -ForegroundColor Cyan
Write-Host ""
Write-Host "2. Repository name: $repoName" -ForegroundColor White
Write-Host "3. Visibility: Public" -ForegroundColor White
Write-Host "4. Click 'Create repository'" -ForegroundColor White
Write-Host ""
Write-Host "5. Run this command to push:" -ForegroundColor Yellow
Write-Host "   git push -u origin main" -ForegroundColor Cyan
Write-Host ""
Write-Host "6. View your repository:" -ForegroundColor Yellow
Write-Host "   https://github.com/$gitHubUsername/$repoName" -ForegroundColor Cyan
Write-Host ""
Write-Host "GitHub Actions will automatically build on every push!" -ForegroundColor Green
Write-Host ""

Read-Host "Press Enter to continue"

Write-Host ""
Write-Host "Pushing to GitHub..." -ForegroundColor Yellow
git push -u origin main

if ($LASTEXITCODE -eq 0) {
    Write-Host ""
    Write-Host "✓ Success! Your code is now on GitHub!" -ForegroundColor Green
    Write-Host ""
    Write-Host "Repository: https://github.com/$gitHubUsername/$repoName" -ForegroundColor Cyan
    Write-Host "Actions: https://github.com/$gitHubUsername/$repoName/actions" -ForegroundColor Cyan
    Write-Host ""
} else {
    Write-Host ""
    Write-Host "ERROR: Failed to push to GitHub" -ForegroundColor Red
    Write-Host "Make sure you've created the repository on GitHub first!" -ForegroundColor Yellow
    Write-Host ""
}

Read-Host "Press Enter to exit"
