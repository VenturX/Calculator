# Complete Setup & Deployment Guide

## 📋 What You Now Have

A **fully functional Windows Calculator** with:
- ✅ Material Design UI (modern colors & animations)
- ✅ Complete calculator functionality (+, −, ×, ÷, %, √, 1/x)
- ✅ Automatic GitHub Actions CI/CD pipeline
- ✅ One-click executable generation
- ✅ Professional-grade project structure

---

## 🖥️ Local Development Setup (Optional)

### Step 1: Install .NET 8 SDK

1. Download from: https://dotnet.microsoft.com/download/dotnet/8.0
2. Run installer and follow prompts
3. Restart your terminal/PowerShell
4. Verify installation:
   ```powershell
   dotnet --version
   ```

### Step 2: Build Locally

**Option A: Using Build Script (Easy)**
```powershell
cd c:\Users\Sajad\Desktop\calc
.\build.bat
```

**Option B: Manual Build**
```powershell
cd c:\Users\Sajad\Desktop\calc
dotnet restore
dotnet build --configuration Release
dotnet publish -c Release -o publish
```

### Step 3: Run the Calculator
```powershell
.\publish\Calculator.exe
```

---

## 🚀 Upload to GitHub (The Important Part!)

### Step 1: Create GitHub Account & Repository

1. Go to https://github.com/signup (if you don't have an account)
2. Create new repository: https://github.com/new
3. **Repository name:** `calculator`
4. **Description:** `Windows Calculator with Material Design UI`
5. **Visibility:** Public (so others can see it)
6. **Do NOT** check "Add a README file" (we already have one)
7. Click **"Create repository"**

You'll see a screen like:
```
Quick setup — if you've done this kind of thing before
or
…or create a new repository on the command line
```

### Step 2: Initialize Git & Push Code to GitHub

Open **PowerShell** in `c:\Users\Sajad\Desktop\calc` and run:

```powershell
# Step 1: Initialize git repository
git init

# Step 2: Add all files
git add .

# Step 3: Commit
git commit -m "Initial commit: Add Material Design calculator"

# Step 4: Rename main branch (GitHub defaults to 'main')
git branch -M main

# Step 5: Add GitHub remote (REPLACE 'yourusername' with YOUR GitHub username)
git remote add origin https://github.com/yourusername/calculator.git

# Step 6: Push to GitHub
git push -u origin main
```

**After running these commands:**
- Go to https://github.com/yourusername/calculator
- You should see all your files there!

---

## ⚙️ Automatic Building on GitHub (Magic Happens Here!)

### GitHub Actions Workflow Explained

The file `.github\workflows\build.yml` automatically:

1. **Triggers on:** Every push to `main` branch
2. **Environment:** Windows Server (latest)
3. **Steps:**
   - Installs .NET 8 SDK
   - Restores NuGet packages
   - Builds in Release mode
   - Publishes as standalone executable
   - Uploads artifact for download

**Time required:** ~2-3 minutes per build

### How to Get Your EXE File

#### Method 1: From GitHub Actions (Free & Automatic)

1. Go to your repository: `https://github.com/yourusername/calculator`
2. Click **"Actions"** tab at top
3. Click the latest workflow run (usually shows commit message)
4. Scroll down to **"Artifacts"** section
5. Download **`calculator-release`** (the EXE file)
6. Extract the `.zip` file
7. Run `Calculator.exe`

#### Method 2: Create a GitHub Release (Better for Distribution)

When you want to release a version:

```powershell
# Create a tag (this triggers release workflow)
git tag v1.0.0
git push origin v1.0.0
```

Then:
1. Go to **"Releases"** tab on GitHub
2. You'll see `v1.0.0` with the executable attached
3. Share this link with others to download

---

## 📦 Distributing Your Calculator

### To Users (Direct Download)
1. Go to Releases tab
2. Share the download link
3. Users download and run `Calculator.exe`
4. No installation needed! (it's portable)

### Optional: Create an Installer

To make an actual `.msi` installer:
1. Install **WiX Toolset**: https://wixtoolset.org/
2. Create a `.wixproj` file in your project
3. Add to GitHub Actions workflow
4. GitHub will automatically build the MSI

For now, the portable EXE works great!

---

## 🔧 Making Changes & Rebuilding

### Workflow:

1. **Edit code** (e.g., change colors in `MainWindow.xaml`)
2. **Commit changes**
   ```powershell
   git add .
   git commit -m "Change button colors to dark theme"
   git push origin main
   ```
3. **GitHub Actions auto-builds** (watch the Actions tab)
4. **Download new EXE** from Actions or Releases

---

## 🎨 Customization Examples

### Change Button Colors

Edit `MainWindow.xaml` and modify background colors in Button Styles:

```xml
<Setter Property="Background" Value="#2196F3"/>  <!-- Change this hex color -->
```

Common colors:
- `#2196F3` - Blue
- `#4CAF50` - Green
- `#FF5722` - Red Orange
- `#9C27B0` - Purple

### Change Window Size

Edit line in `MainWindow.xaml`:
```xml
<Window ... Height="600" Width="400" ...>
```

Change `Height` and `Width` values

### Add New Functions

In `MainWindow.xaml.cs`, add new methods like:
```csharp
private void Power_Click(object sender, RoutedEventArgs e)
{
    if (double.TryParse(display, out double num))
    {
        display = FormatResult(Math.Pow(num, 2));
        UpdateDisplay();
    }
}
```

Then add button in XAML:
```xml
<Button Content="x²" Click="Power_Click" />
```

---

## ❓ Common Questions

### Q: Do I need .NET installed to run the EXE?
**A:** The published version includes the .NET runtime, so NO additional installation needed!

### Q: How do I test before uploading to GitHub?
**A:** If you have .NET SDK installed, run `.\build.bat` then `.\publish\Calculator.exe`

### Q: The build failed on GitHub Actions, what do I do?
**A:** 
1. Go to **Actions** tab
2. Click the failed workflow
3. Expand the failed step to see error message
4. Fix the issue locally and push again

### Q: Can I use a different repository name?
**A:** Yes! Just replace `calculator` with any name you want (e.g., `my-calculator`, `advanced-calc`)

### Q: How do I update the version number?
**A:** Edit `Calculator.csproj`:
```xml
<Version>1.0.1</Version>  <!-- Change this -->
```

### Q: Can I make it closed-source/private?
**A:** Yes! When creating the repo, choose "Private" instead of "Public"

---

## 📊 Project Structure Reference

```
calculator/
├── .github/
│   └── workflows/
│       └── build.yml                 # GitHub Actions config (auto-build)
├── bin/                              # (Generated) Build output
├── obj/                              # (Generated) Build temp files
├── publish/                          # (Generated) Final executable
├── App.xaml                          # App-level styling
├── App.xaml.cs                       # App startup code
├── Calculator.csproj                 # Project configuration
├── MainWindow.xaml                   # UI Layout & Design
├── MainWindow.xaml.cs                # Calculator Logic
├── build.bat                         # Local build script
├── .gitignore                        # Git ignore patterns
├── README.md                         # Main documentation
├── QUICKSTART.md                     # Quick reference
├── DEPLOYMENT.md                     # This file
└── Untitled-1.py                     # (Can delete - not used)
```

---

## 🎉 You're All Set!

### Next Steps:

1. ✅ **Code is ready** - All files are created
2. ⏳ **Install .NET SDK** (if you want to build locally)
3. 🚀 **Create GitHub account & repo**
4. 📤 **Push code to GitHub**
5. 🏗️ **GitHub Actions automatically builds**
6. 📥 **Download EXE from Actions or Releases**
7. 🎊 **Share with friends!**

---

## 🆘 Troubleshooting

| Problem | Solution |
|---------|----------|
| `dotnet` command not found | Install .NET 8 SDK from dotnet.microsoft.com |
| Git not installed | Download from git-scm.com |
| GitHub authentication fails | Use GitHub CLI: `gh auth login` |
| Build fails on GitHub | Check Actions tab for error logs, fix code, push again |
| EXE won't run | Ensure .NET Runtime is installed or use portable build |
| Can't clone repo later | Make sure visibility is "Public" or use Personal Access Token |

---

## 📞 Support Resources

- **GitHub Help**: https://docs.github.com
- **.NET Documentation**: https://docs.microsoft.com/dotnet
- **WPF Guide**: https://docs.microsoft.com/dotnet/desktop/wpf
- **Material Design**: https://github.com/MaterialDesignInXAML/MaterialDesignInXamlToolkit

---

**Ready to go live? Push to GitHub and let the automation handle the rest!** 🚀
