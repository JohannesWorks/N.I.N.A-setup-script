# NINA Installation Assistant (Batch Script)

This repository provides a Windows batch script to simplify the installation of the astrophotography software **N.I.N.A. (Nighttime Imaging 'N' Astronomy)** and selected additional tools commonly used in astrophotography setups.

## Features

### Interactive Installation Selection
- **User-friendly prompts** for each software component
- **Selective installation** - choose only what you need
- **Intelligent checking** - skips already installed software
- **Progress indicators** with download progress bars

### Supported Software Components

#### 🔭 **N.I.N.A. (Nighttime Imaging 'N' Astronomy)**
- Installed via winget package manager
- Comprehensive astrophotography suite
- Automated telescope control and imaging

#### 🌌 **Offline Sky Map Cache (3.3GB)**
- Complete offline framing assistant cache
- Extracted to `C:\OfflineSkyMap`
- Enables offline sky map functionality in N.I.N.A.

#### 📡 **ASCOM Platform**
- Version 7.0.2 from official GitHub releases
- Essential for telescope and camera communication
- Industry standard for astronomy device drivers

#### 🎯 **PHD2 Guiding**
- Professional autoguiding software
- Installed via winget package manager
- Precise telescope tracking corrections

#### 🌟 **ASTAP Astrometric Solver**
- Plate solving and astrometric analysis
- Downloaded from official SourceForge
- Essential for accurate telescope pointing

#### 📊 **D50 Star Database**
- High-density star catalog (5000 stars per square degree)
- Optimized for fields of view ≥ 0.6 degrees
- Required for ASTAP plate solving functionality

## Requirements

- **Windows 10 or newer**
- **Internet connection** (for downloading installers)
- **Administrator privileges** (for software installation)
- **Sufficient disk space** (especially for 3.3GB Sky Map)
- **winget** (Windows Package Manager - included in Windows 10/11)

## Installation Process

### 1. Download & Execute
```batch
git clone https://github.com/yourusername/N.I.N.A-setup-script.git
cd N.I.N.A-setup-script
NINA-Setup.bat
```

### 2. Interactive Selection
The script will prompt you to select which components to install:

```
Choose which programs to install:

Install NINA? (Y/N): Y
Install Offline Sky Map approx. 3.3 GB? (Y/N): Y
Install PHD2? (Y/N): Y
Install ASCOM? (Y/N): Y
Install ASTAP? (Y/N): Y
Install D50 Star Database? (Y/N): Y
```

### 3. Automated Installation
- **Checks** for existing installations
- **Downloads** selected components with progress bars
- **Installs** software silently where possible
- **Verifies** successful installation

## Technical Details

### Download Sources
- **N.I.N.A.**: Windows Package Manager (winget)
- **Sky Map**: nighttime-imaging.eu official downloads
- **PHD2**: Windows Package Manager (winget)
- **ASCOM**: GitHub Releases (ASCOMInitiative/ASCOMPlatform)
- **ASTAP**: SourceForge (astap-program)
- **D50 Database**: SourceForge (astap-program)


### Silent Installation
- All installers support silent/unattended installation
- No user interaction required during installation process
- Automatic cleanup of temporary download files


## Troubleshooting

### Common Issues
- **Download failures**: Check internet connection and firewall settings
- **Installation errors**: Ensure administrator privileges
- **Missing components**: Verify Windows Package Manager is available
- **Antivirus blocks**: Add exclusions for astronomy software directories

### Manual Installation
If automatic installation fails, components can be installed manually:
- Download links are displayed during script execution
- Installation files are preserved in `%TEMP%` directory temporarily

## Disclaimer

This script is provided **as is** without warranty. Use at your own risk. The script downloads third-party software from their official sources — always verify URLs and installers before running.

## Credits & Links

- [N.I.N.A. - Nighttime Imaging 'N' Astronomy](https://nighttime-imaging.eu/)
- [ASCOM Platform](https://ascom-standards.org/)
- [PHD2 Guiding](https://openphdguiding.org/)
- [ASTAP Astrometric Solver](https://www.hnsky.org/astap.htm)
- [Sky Map Cache](https://nighttime-imaging.eu/download/)

---

### 💡 Contributions

Feel free to open issues or submit pull requests to improve this script and expand support for other tools in the astrophotography ecosystem.

### 📝 License

This project is open source. Please check individual software licenses for their respective terms.