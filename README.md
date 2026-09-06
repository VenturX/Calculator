# Windows Calculator - Material Design

A modern, feature-rich Windows calculator built with WPF and Material Design UI.

## Features

✅ **Modern Material Design UI** - Clean, intuitive interface  
✅ **Full Calculator Functions** - +, −, ×, ÷, %, √, 1/x, +/−  
✅ **Decimal Support** - Handle floating-point calculations  
✅ **Error Handling** - Prevents division by zero  
✅ **Responsive Design** - Beautiful gradient buttons with hover effects  
✅ **Built with .NET 8** - Latest C# and WPF technology  

## Requirements

- Windows 10 or later
- .NET 8 Runtime (included in installer) or .NET 8 SDK for development

## Installation

### Option 1: Download Installer (Recommended)
1. Go to the [Releases](../../releases) page
2. Download the latest `Calculator.exe` or installer
3. Run and install
4. Launch "Calculator" from Start Menu

### Option 2: Download Portable
1. Go to [Releases](../../releases)
2. Download the portable build
3. Extract to any folder
4. Run `Calculator.exe`

## Building Locally

### Prerequisites
- [.NET 8 SDK](https://dotnet.microsoft.com/download/dotnet/8.0)
- Visual Studio 2022 (optional, or use any text editor)

### Build Steps

1. **Clone the repository**
```bash
git clone https://github.com/yourusername/calculator.git
cd calculator
```

2. **Restore dependencies**
```bash
dotnet restore
```

3. **Build the project**
```bash
dotnet build --configuration Release
```

4. **Run directly**
```bash
dotnet run
```

5. **Publish as executable**
```bash
dotnet publish -c Release -o ./publish
```
The executable will be in `./publish/Calculator.exe`

## Setting Up GitHub and CI/CD

### Step 1: Create a GitHub Repository

1. Go to [GitHub](https://github.com/new)
2. Create a new repository named `calculator`
3. Choose "Public" or "Private"
4. **Do NOT** initialize with README (we have one)
5. Click "Create repository"

### Step 2: Push to GitHub

```bash
# Navigate to your project folder
cd c:\Users\Sajad\Desktop\calc

# Initialize git (if not already done)
git init

# Add all files
git add .

# Commit
git commit -m "Initial commit: Add Material Design calculator"

# Add remote
git remote add origin https://github.com/yourusername/calculator.git

# Rename branch to main (if needed)
git branch -M main

# Push to GitHub
git push -u origin main
```

### Step 3: GitHub Actions Automatic Builds

The `.github/workflows/build.yml` file is already configured to:
- ✅ Build automatically on every push to `main`
- ✅ Build on pull requests
- ✅ Allow manual trigger via "Run workflow" button

#### Access Build Artifacts

1. Go to your repository
2. Click **"Actions"** tab
3. Click the latest workflow run
4. Scroll down to **"Artifacts"**
5. Download `calculator-release` (contains the executable)

#### Creating a Release with Installer

1. **Create a Git tag** (triggers release build)
```bash
git tag v1.0.0
git push origin v1.0.0
```

2. **GitHub Actions automatically creates a Release**
   - Go to **"Releases"** tab in your repo
   - You'll see `v1.0.0` with build artifacts attached

3. **Users can download** the executable from the Release page

## Automatic Build Process

Every time you:
- Push to `main` branch
- Create a pull request
- Manually trigger the workflow

GitHub automatically:
1. Sets up Windows environment
2. Installs .NET 8 SDK
3. Restores NuGet packages
4. Builds in Release mode
5. Publishes as standalone executable
6. Uploads artifacts for download

## File Structure

```
calculator/
├── Calculator.csproj          # Project file with dependencies
├── App.xaml                   # Application styling
├── App.xaml.cs                # Application code-behind
├── MainWindow.xaml            # UI layout with Material Design
├── MainWindow.xaml.cs         # Calculator logic
├── .github/
│   └── workflows/
│       └── build.yml          # GitHub Actions CI/CD
└── README.md                  # This file
```

## Usage

### Basic Operations
- **Number buttons**: Click to enter numbers
- **Operators**: +, −, ×, ÷ for basic math
- **Equals (=)**: Get result
- **Clear (C)**: Reset calculator
- **Backspace**: Remove last digit

### Advanced Functions
- **%**: Modulo (remainder)
- **√**: Square root
- **+/−**: Toggle positive/negative
- **1/x**: Reciprocal (1 divided by number)
- **.**: Decimal point

## Technologies Used

- **Language**: C# 12
- **Framework**: WPF (.NET 8)
- **UI Library**: MaterialDesignInXaml v4.9.0
- **Build System**: .NET SDK 8.0
- **CI/CD**: GitHub Actions

## Building an Installer (Advanced)

To create an `.msi` installer, add this to your workflow:

1. Install **WiX Toolset** locally
2. Create `.wixproj` file
3. GitHub Actions will automatically build the MSI

For now, users can install from the portable executable.

## Troubleshooting

### "dotnet: command not found"
- Install [.NET 8 SDK](https://dotnet.microsoft.com/download/dotnet/8.0)
- Restart your terminal

### Build fails on GitHub Actions
- Check the **"Actions"** tab for error logs
- Ensure `.github/workflows/build.yml` is in repository
- Verify all files are committed and pushed

### Calculator won't run
- Ensure .NET 8 Runtime is installed
- Try running from command line: `Calculator.exe` or `dotnet Calculator.dll`

## License

MIT License - Feel free to use and modify!

## Contributing

Contributions are welcome! Fork, make changes, and submit a pull request.

---

**Author**: Your Name  
**Repository**: https://github.com/yourusername/calculator  
**Latest Release**: Check the [Releases](../../releases) page
