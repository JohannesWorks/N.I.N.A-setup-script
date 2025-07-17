# NINA Installation Assistant (Batch Script)

This repository provides a comprehensive Windows batch script to simplify the installation of the astrophotography software **N.I.N.A. (Nighttime Imaging 'N' Astronomy)** and a complete suite of essential tools, drivers, and utilities commonly used in professional astrophotography setups.

## Features

### Interactive Installation Selection
- **User-friendly prompts** for each software component
- **Selective installation** - choose only what you need
- **Intelligent checking** - skips already installed software
- **Progress indicators** with download progress bars

### Supported Software Components

This script installs **12 essential components** for a complete astrophotography setup:

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

#### 🌟 **Stellarium**
- Comprehensive planetarium software
- Installed via winget package manager
- Sky simulation and astronomical object tracking

#### ⏰ **Meinberg NTP Time Sync**
- Precise time synchronization for astrophotography
- Ensures accurate timestamps for imaging sessions

#### 🔧 **Green Swamp Server (GSS)**
- ASCOM telescope driver for SkyWatcher and Orion mounts
- Version 1.0.8.6 from GitHub releases
- Supports EQ8, EQ8-R, HDX110, AZ-EQ5GT, Sirius Pro AZ/EQ-G and other mounts

#### 🔭 **OnStep Telescope Control**
- Advanced telescope control system
- Version 1.0.43 from stellarjourney.com
- Arduino-based GoTo telescope controller

#### 📷 **ZWO ASCOM Driver**
- ASCOM driver for ZWO ASI cameras
- Version 6.5.30 from ZWO official downloads
- Essential for ZWO camera control and imaging

#### 📸 **QHY CCD All-in-One Driver**
- Complete driver package for QHY CCD cameras
- Version 24.12.27.10 from QHY official downloads
- Includes ASCOM driver and native camera control

#### 📹 **ToupTek ASCOM Driver**
- ASCOM driver for ToupTek cameras
- Latest version from ToupTek official downloads
- Essential for ToupTek camera control and imaging

---

### 🎯 **Complete Camera Support**
The script includes drivers for all major astrophotography camera brands:
- **ZWO ASI** - Popular choice for planetary and deep-sky imaging
- **QHY CCD** - Professional-grade cameras with advanced features
- **ToupTek** - Budget-friendly cameras with excellent performance

### 🔧 **Mount Control Solutions**
Multiple telescope mount control options:
- **Green Swamp Server** - SkyWatcher & Orion mounts (EQ8, EQ8-R, HDX110, etc.)
- **OnStep** - Arduino-based DIY GoTo controller
- **ASCOM Platform** - Universal device communication standard

### ⚙️ **Essential Utilities**
- **Stellarium** - Planetarium software for object location
- **Meinberg NTP** - Precise time synchronization
- **ASTAP + D50 Database** - Plate solving for accurate positioning
- **PHD2** - Professional autoguiding solution

## Requirements

- **Windows 10 or newer** (Windows 11 recommended)
- **Internet connection** (for downloading installers)
- **Administrator privileges** (for software installation)
- **Sufficient disk space**:
  - Minimum: 2GB for basic installation
  - Recommended: 8GB+ (includes 3.3GB Sky Map cache)
  - Camera drivers: ~500MB each
- **winget** (Windows Package Manager - included in Windows 10/11)

## Installation Process

### 1. Download & Execute
1. Download `NINA-Setup.bat` from this repository
2. Right-click and select "Run as administrator"
3. Follow the interactive prompts

### 2. Interactive Selection
The script will prompt you to select which components to install:

```
Choose which programs to install:

Install NINA? (Y/N): Y
Install Offline Sky Map Cache. 3.3 GB? (Y/N): Y
Install PHD2? (Y/N): Y
Install ASCOM? (Y/N): Y
Install ASTAP? (Y/N): Y
Install D50 Star Database? (Y/N): Y
Install Stellarium? (Y/N): Y
Install Meinberg NTP Time Sync? (Y/N): Y
Install Green Swamp Server (ASCOM Driver)? (Y/N): Y
Install OnStep Telescope Control? (Y/N): Y
Install ZWO ASCOM Driver? (Y/N): Y
Install QHY CCD All-in-One Driver? (Y/N): Y
Install ToupTek ASCOM Driver? (Y/N): Y
```

### 3. Automated Installation
- **Checks** for existing installations (skips if already present)
- **Downloads** selected components with progress bars
- **Installs** software silently where possible
- **Verifies** successful installation
- **Cleanup** removes temporary installation files

### 4. Installation Time
Typical installation times (depends on internet speed):
- **Basic setup** (NINA + ASCOM + PHD2): ~5-10 minutes
- **Complete setup** (all components): ~15-30 minutes
- **Sky Map cache** alone: ~10-15 minutes (3.3GB download)

## Technical Details

### Download Sources
- **N.I.N.A.**: Windows Package Manager (winget)
- **Sky Map**: nighttime-imaging.eu official downloads
- **PHD2**: Windows Package Manager (winget)
- **ASCOM**: GitHub Releases (ASCOMInitiative/ASCOMPlatform)
- **ASTAP**: SourceForge (astap-program)
- **D50 Database**: SourceForge (astap-program)
- **Stellarium**: Windows Package Manager (winget)
- **Meinberg NTP**: Official Meinberg download (meinberg.de)
- **Green Swamp Server**: GitHub Releases (rmorgan001/GSServer)
- **OnStep**: stellarjourney.com downloads
- **ZWO ASCOM**: Official ZWO downloads (dl.zwoastro.com)
- **QHY CCD**: Official QHY downloads (qhyccd.com)
- **ToupTek ASCOM**: Official ToupTek downloads (touptek-astro.com)


## Troubleshooting

### Common Issues

#### Download Problems
- **Download failures**: Check internet connection and firewall settings
- **Slow downloads**: Large files like Sky Map cache take time
- **Antivirus blocks**: Add exclusions for astronomy software directories

#### Installation Problems
- **Installation errors**: Ensure administrator privileges
- **Missing components**: Verify Windows Package Manager is available
- **Driver conflicts**: Uninstall old camera drivers before installing new ones
- **ASCOM issues**: Install ASCOM Platform before other drivers

#### Camera Driver Issues
- **Multiple camera brands**: Install only the drivers you need
- **Driver conflicts**: Don't install ZWO, QHY, and ToupTek unless you own cameras from each brand
- **USB connection**: Test camera connection after driver installation

### Manual Installation
If automatic installation fails, components can be installed manually:
- Download links are displayed during script execution
- Installation files are preserved in `%TEMP%` directory temporarily
- Check the script output for specific error messages

### Recommended Installation Order
For manual installation or troubleshooting:
1. **ASCOM Platform** (required for most drivers)
2. **Meinberg NTP** (for time synchronization)
3. **Camera drivers** (ZWO, QHY, or ToupTek as needed)
4. **NINA** (main application)
5. **PHD2** (autoguiding)
6. **Stellarium** (planetarium)
7. **Mount drivers** (Green Swamp Server or OnStep)
8. **ASTAP + D50 Database** (plate solving)
9. **Sky Map cache** (offline functionality)

## Performance Notes

### System Requirements by Component
- **NINA**: 4GB RAM, modern CPU recommended
- **Sky Map cache**: 3.3GB disk space, improves offline performance
- **Camera drivers**: USB 3.0 ports recommended for best performance
- **Plate solving**: Fast CPU improves solving speed
- **PHD2**: Dedicated guide camera and mount with separate guide scope

### Network Requirements
- **Total download size**: ~6-8GB for complete installation
- **Internet speed**: Broadband recommended (10+ Mbps)
- **Firewall**: Allow curl.exe and PowerShell for downloads

## Disclaimer

This script is provided **as is** without warranty. Use at your own risk. The script downloads third-party software from their official sources — always verify URLs and installers before running.

### Security Notes
- All downloads are from official vendor websites
- No modification of downloaded installers
- Script requires administrator privileges for installation only
- Temporary files are cleaned up after installation

## Credits & Links

- [N.I.N.A. - Nighttime Imaging 'N' Astronomy](https://nighttime-imaging.eu/)
- [ASCOM Platform](https://ascom-standards.org/)
- [PHD2 Guiding](https://openphdguiding.org/)
- [ASTAP Astrometric Solver](https://www.hnsky.org/astap.htm)
- [Sky Map Cache](https://nighttime-imaging.eu/download/)
- [Stellarium](https://stellarium.org/)
- [Meinberg NTP](https://www.meinberg.de/)
- [Green Swamp Server](https://greenswamp.org/?page_id=834)
- [OnStep](http://www.stellarjourney.com/index.php?r=site/software_telescope)
- [ZWO ASCOM](https://www.zwoastro.com/)
- [QHY CCD](https://www.qhyccd.com/)
- [ToupTek ASCOM](https://www.touptek-astro.com/)

---

### 💡 Contributions

Feel free to open issues or submit pull requests to improve this script and expand support for other tools in the astrophotography ecosystem.

### 📝 License

This project is open source. Please check individual software licenses for their respective terms.
