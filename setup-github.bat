@echo off
echo ========================================
echo GitHub Profile Setup - Automated Push
echo ========================================
echo.

echo Step 1: Opening GitHub to create repository...
echo Please create a repository named: aimlstudy1010-engineer
echo Make sure it's PUBLIC and DON'T initialize with README
echo.
start https://github.com/new

echo.
echo Waiting for you to create the repository...
echo Press any key AFTER you've created the repository on GitHub...
pause

echo.
echo Step 2: Adding remote and pushing to GitHub...
cd /d "c:\Users\Baisla\Desktop\profile"

git remote add origin https://github.com/aimlstudy1010-engineer/aimlstudy1010-engineer.git
if %errorlevel% neq 0 (
    echo Remote already exists, updating URL...
    git remote set-url origin https://github.com/aimlstudy1010-engineer/aimlstudy1010-engineer.git
)

echo.
echo Pushing to GitHub...
git push -u origin main

if %errorlevel% equ 0 (
    echo.
    echo ========================================
    echo SUCCESS! Your profile is now live!
    echo ========================================
    echo.
    echo View your profile at:
    echo https://github.com/aimlstudy1010-engineer
    echo.
    echo Opening your profile...
    start https://github.com/aimlstudy1010-engineer
) else (
    echo.
    echo ========================================
    echo ERROR: Push failed!
    echo ========================================
    echo.
    echo This might be because:
    echo 1. Repository doesn't exist yet
    echo 2. You need to authenticate with GitHub
    echo 3. Repository name is incorrect
    echo.
    echo Please check and try again.
)

echo.
echo Press any key to exit...
pause
