# Quick Start Guide

## 🚀 Get Up and Running in 5 Minutes

### 1. Install .NET 8 (if needed)
```powershell
# Download and install from:
# https://dotnet.microsoft.com/download/dotnet/8.0
```

### 2. Build Locally
```powershell
cd c:\Users\Sajad\Desktop\calc
dotnet build --configuration Release
dotnet run
```

### 3. Upload to GitHub

```powershell
# Create GitHub repo first at https://github.com/new

# In your project folder:
git init
git add .
git commit -m "Initial commit"
git branch -M main
git remote add origin https://github.com/YOUR_USERNAME/calculator.git
git push -u origin main
```

### 4. Download Built EXE from GitHub Actions

1. Push to GitHub
2. Go to **Actions** tab
3. Click latest workflow
4. Download **calculator-release** artifact
5. Extract and run `Calculator.exe`

### 5. Create Release (Optional)

```powershell
git tag v1.0.0
git push origin v1.0.0
```

Then get the EXE from the **Releases** tab.

---

## 📁 Files Included

| File | Purpose |
|------|---------|
| `Calculator.csproj` | Project configuration & NuGet dependencies |
| `App.xaml` | Application styling & Material Design themes |
| `App.xaml.cs` | Application startup logic |
| `MainWindow.xaml` | Calculator UI layout |
| `MainWindow.xaml.cs` | Calculator logic & event handlers |
| `.github/workflows/build.yml` | Automatic GitHub Actions build |
| `README.md` | Full documentation |
| `.gitignore` | Git ignore patterns |

---

## 🎯 What Happens on GitHub Actions

Each push to `main` automatically:

✅ Checks out your code  
✅ Installs .NET 8 SDK  
✅ Restores NuGet packages (MaterialDesignThemes)  
✅ Builds in Release mode  
✅ Publishes standalone executable  
✅ Uploads as downloadable artifact  

Takes ~2-3 minutes per build.

---

## 💡 Tips

- **Modify colors**: Edit `MainWindow.xaml` button styles
- **Change window size**: Edit `Height="600" Width="400"` in MainWindow.xaml
- **Add functions**: Add new Button_Click handlers in MainWindow.xaml.cs
- **Update version**: Edit `<Version>1.0.0</Version>` in Calculator.csproj

---

## ❓ FAQ

**Q: Where's the EXE?**  
A: After GitHub push, go to **Actions** → **Latest run** → **Artifacts** → Download `calculator-release`

**Q: Can I run it without .NET installed?**  
A: Yes! The published version includes runtime. Just run `Calculator.exe`

**Q: How do I make it an installer?**  
A: Use [WiX Toolset](https://wixtoolset.org/) or [Advanced Installer](https://www.advancedinstaller.com/)

**Q: Can I edit the source and rebuild?**  
A: Yes! Any changes you push to GitHub will auto-build.

---

**Ready? Let's go!** 🎉
