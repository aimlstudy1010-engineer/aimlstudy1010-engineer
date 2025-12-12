@echo off
echo ========================================
echo AUTOMATED GitHub Profile Setup
echo ========================================
echo.
echo This will automatically:
echo 1. Open GitHub login (if needed)
echo 2. Create the repository
echo 3. Push all files
echo 4. Open your live profile
echo.
echo Starting in 3 seconds...
timeout /t 3 /nobreak >nul

cd /d "c:\Users\Baisla\Desktop\profile"

echo.
echo [1/4] Checking Git configuration...
git config --global user.name "Rafiqul Islam"
git config --global user.email "aimlstudy1010@gmail.com"
echo Done!

echo.
echo [2/4] Setting up remote repository...
git remote remove origin 2>nul
git remote add origin https://github.com/aimlstudy1010-engineer/aimlstudy1010-engineer.git
echo Done!

echo.
echo [3/4] Pushing to GitHub...
echo NOTE: A browser window will open for authentication if needed.
echo Please sign in to GitHub when prompted.
echo.

git push -u origin main

if %errorlevel% equ 0 (
    echo.
    echo ========================================
    echo SUCCESS! Profile is LIVE!
    echo ========================================
    echo.
    echo Your profile: https://github.com/aimlstudy1010-engineer
    echo.
    echo [4/4] Opening your profile...
    timeout /t 2 /nobreak >nul
    start https://github.com/aimlstudy1010-engineer
    echo.
    echo All done! Your GitHub profile is now live with:
    echo - Custom banner
    echo - Animated header
    echo - Auto-updating stats
    echo - GitHub trophies
    echo - And much more!
) else (
    echo.
    echo ========================================
    echo Repository needs to be created first
    echo ========================================
    echo.
    echo Opening GitHub to create repository...
    start https://github.com/new
    echo.
    echo Please create a repository named: aimlstudy1010-engineer
    echo Make it PUBLIC and don't initialize with README
    echo.
    echo After creating, press any key to retry push...
    pause
    git push -u origin main
    if %errorlevel% equ 0 (
        echo.
        echo SUCCESS! Opening your profile...
        start https://github.com/aimlstudy1010-engineer
    )
)

echo.
echo Press any key to exit...
pause
