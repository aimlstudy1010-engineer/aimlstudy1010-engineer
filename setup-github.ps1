# Quick Setup Script for PowerShell

Write-Host "========================================" -ForegroundColor Cyan
Write-Host "GitHub Profile Setup - Automated Push" -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""

Write-Host "Step 1: Opening GitHub to create repository..." -ForegroundColor Yellow
Write-Host "Repository name: aimlstudy1010-engineer" -ForegroundColor Green
Write-Host "Make it PUBLIC and DON'T initialize with README" -ForegroundColor Yellow
Write-Host ""

Start-Process "https://github.com/new"

Write-Host ""
Read-Host "Press ENTER after you've created the repository on GitHub"

Write-Host ""
Write-Host "Step 2: Adding remote and pushing to GitHub..." -ForegroundColor Yellow

Set-Location "c:\Users\Baisla\Desktop\profile"

# Add remote
$remoteUrl = "https://github.com/aimlstudy1010-engineer/aimlstudy1010-engineer.git"
git remote add origin $remoteUrl 2>$null
if ($LASTEXITCODE -ne 0) {
    Write-Host "Remote already exists, updating URL..." -ForegroundColor Yellow
    git remote set-url origin $remoteUrl
}

Write-Host ""
Write-Host "Pushing to GitHub..." -ForegroundColor Yellow
git push -u origin main

if ($LASTEXITCODE -eq 0) {
    Write-Host ""
    Write-Host "========================================" -ForegroundColor Green
    Write-Host "SUCCESS! Your profile is now live!" -ForegroundColor Green
    Write-Host "========================================" -ForegroundColor Green
    Write-Host ""
    Write-Host "View your profile at:" -ForegroundColor Cyan
    Write-Host "https://github.com/aimlstudy1010-engineer" -ForegroundColor White
    Write-Host ""
    Write-Host "Opening your profile..." -ForegroundColor Yellow
    Start-Process "https://github.com/aimlstudy1010-engineer"
} else {
    Write-Host ""
    Write-Host "========================================" -ForegroundColor Red
    Write-Host "ERROR: Push failed!" -ForegroundColor Red
    Write-Host "========================================" -ForegroundColor Red
    Write-Host ""
    Write-Host "This might be because:" -ForegroundColor Yellow
    Write-Host "1. Repository doesn't exist yet" -ForegroundColor White
    Write-Host "2. You need to authenticate with GitHub" -ForegroundColor White
    Write-Host "3. Repository name is incorrect" -ForegroundColor White
    Write-Host ""
    Write-Host "Please check and try again." -ForegroundColor Yellow
}

Write-Host ""
Read-Host "Press ENTER to exit"
