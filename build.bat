@echo off
REM Windows Calculator Build Script

echo ======================================
echo Windows Calculator - Build Script
echo ======================================
echo.

REM Check if dotnet is installed
dotnet --version >nul 2>&1
if errorlevel 1 (
    echo ERROR: .NET SDK not found!
    echo.
    echo Please install .NET 8 SDK from:
    echo https://dotnet.microsoft.com/download/dotnet/8.0
    echo.
    pause
    exit /b 1
)

echo [1/3] Restoring NuGet packages...
dotnet restore
if errorlevel 1 (
    echo ERROR: Failed to restore packages
    pause
    exit /b 1
)

echo.
echo [2/3] Building in Release mode...
dotnet build --configuration Release
if errorlevel 1 (
    echo ERROR: Build failed
    pause
    exit /b 1
)

echo.
echo [3/3] Publishing...
dotnet publish -c Release -o publish
if errorlevel 1 (
    echo ERROR: Publish failed
    pause
    exit /b 1
)

echo.
echo ======================================
echo Build Complete!
echo ======================================
echo.
echo Executable location:
echo %CD%\publish\Calculator.exe
echo.
echo You can now:
echo   1. Run: .\publish\Calculator.exe
echo   2. Copy to another location
echo   3. Share the entire publish folder
echo.
pause
