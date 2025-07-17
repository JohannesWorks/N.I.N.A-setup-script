@echo off

echo ========================================
echo NINA, PHD2, ASCOM, ASTAP, D50 & Sky Map Installation
echo ========================================
echo.

:: User selection for desired software
echo Choose which programs to install:
echo.

set /p "installNina=Install NINA? (Y/N): "
if /i "%installNina%"=="Y" (set "installNina=1") else (set "installNina=0")

set /p "installSkyMap=Install Offline Sky Map Cache 3.3 GB? (Y/N): "
if /i "%installSkyMap%"=="Y" (set "installSkyMap=1") else (set "installSkyMap=0")

set /p "installPhd2=Install PHD2? (Y/N): "
if /i "%installPhd2%"=="Y" (set "installPhd2=1") else (set "installPhd2=0")

set /p "installAscom=Install ASCOM? (Y/N): "
if /i "%installAscom%"=="Y" (set "installAscom=1") else (set "installAscom=0")

set /p "installAstap=Install ASTAP? (Y/N): "
if /i "%installAstap%"=="Y" (set "installAstap=1") else (set "installAstap=0")

if %installAstap% equ 1 (
    set /p "installD50=Install D50 Star Database? (Y/N): "
    if /i "%installD50%"=="Y" (set "installD50=1") else (set "installD50=0")
) else (
    set "installD50=0"
)

set /p "installStellarium=Install Stellarium? (Y/N): "
if /i "%installStellarium%"=="Y" (set "installStellarium=1") else (set "installStellarium=0")

set /p "installNTP=Install Meinberg NTP Time Sync? (Y/N): "
if /i "%installNTP%"=="Y" (set "installNTP=1") else (set "installNTP=0")

echo.

:: Check existing installations
echo Checking existing installations

:: Check NINA
set "ninaInstalled=0"
if exist "C:\Program Files\N.I.N.A. - Nighttime Imaging 'N' Astronomy" set "ninaInstalled=1"
if exist "C:\Program Files (x86)\N.I.N.A. - Nighttime Imaging 'N' Astronomy" set "ninaInstalled=1"
y
if %ninaInstalled% equ 1 (
    echo [ALREADY INSTALLED] NINA found
) else (
    echo [NOT INSTALLED] NINA
)

:: Check PHD2
set "phd2Installed=0"
if exist "C:\Program Files\PHDGuiding2" set "phd2Installed=1"
if exist "C:\Program Files (x86)\PHDGuiding2" set "phd2Installed=1"

if %phd2Installed% equ 1 (
    echo [ALREADY INSTALLED] PHD2 found
) else (
    echo [NOT INSTALLED] PHD2
)

:: Check ASCOM (better path checking)
set "ascomInstalled=0"
if exist "C:\Program Files\ASCOM\Platform" set "ascomInstalled=1"
if exist "C:\Program Files (x86)\ASCOM\Platform" set "ascomInstalled=1"

if %ascomInstalled% equ 1 (
    echo [ALREADY INSTALLED] ASCOM found
) else (
    echo [NOT INSTALLED] ASCOM
)

:: Check ASTAP
set "astapInstalled=0"
if exist "C:\Program Files\astap\astap.exe" set "astapInstalled=1"
if exist "C:\Program Files (x86)\astap\astap.exe" set "astapInstalled=1"

if %astapInstalled% equ 1 (
    echo [ALREADY INSTALLED] ASTAP found
) else (
    echo [NOT INSTALLED] ASTAP
)

:: Check D50 Database
set "d50Installed=0"

:: Check Offline Sky Map
set "skyMapInstalled=0"
if exist "C:\OfflineSkyMap\FramingAssistantCache" set "skyMapInstalled=1"

if %skyMapInstalled% equ 1 (
    echo [ALREADY INSTALLED] Offline Sky Map found
) else (
    echo [NOT INSTALLED] Offline Sky Map
)

:: Check Stellarium
set "stellariumInstalled=0"
if exist "C:\Program Files\Stellarium" set "stellariumInstalled=1"
if exist "C:\Program Files (x86)\Stellarium" set "stellariumInstalled=1"

if %stellariumInstalled% equ 1 (
    echo [ALREADY INSTALLED] Stellarium found
) else (
    echo [NOT INSTALLED] Stellarium
)

:: Check Meinberg NTP
set "ntpInstalled=0"
if exist "C:\Program Files\NTP" set "ntpInstalled=1"
if exist "C:\Program Files (x86)\NTP" set "ntpInstalled=1"

if %ntpInstalled% equ 1 (
    echo [ALREADY INSTALLED] Meinberg NTP found
) else (
    echo [NOT INSTALLED] Meinberg NTP
)

echo.

:: NINA Installation
if %installNina% equ 1 (
    if %ninaInstalled% equ 0 (
        echo Installing NINA
        winget install --id=StefanBerg.NINA --silent
    ) else (
        echo Skipping NINA - already installed
    )
) else (
    echo Skipping NINA - not selected
)
echo.

:: PHD2 Installation
if %installPhd2% equ 1 (
    if %phd2Installed% equ 0 (
        echo Installing PHD2
        winget install --id=OpenPHDGuiding.PHD2 --silent
    ) else (
        echo Skipping PHD2 - already installed
    )
) else (
    echo Skipping PHD2 - not selected
)
echo.

:: ASCOM Installation
if %installAscom% equ 1 (
    if %ascomInstalled% equ 0 (
        echo Installing ASCOM Platform 
        
        echo Downloading ASCOM
        curl -L --progress-bar -o "%TEMP%\AscomPlatform702.4675.exe" "https://github.com/ASCOMInitiative/ASCOMPlatform/releases/download/v7.0.2/AscomPlatform702.4675.exe"

        if exist "%TEMP%\AscomPlatform702.4675.exe" (
            echo Running ASCOM Installation
            "%TEMP%\AscomPlatform702.4675.exe" /SILENT
            timeout /t 5 /nobreak > nul
            del "%TEMP%\AscomPlatform702.4675.exe" 2>nul
        ) else (
            echo [ERROR] ASCOM Download failed
        )
    ) else (
        echo Skipping ASCOM - already installed
    )
) else (
    echo Skipping ASCOM - not selected
)
echo.

:: ASTAP Installation
if %installAstap% equ 1 (
    if %astapInstalled% equ 0 (
        echo Installing ASTAP
        
        echo Downloading ASTAP
        curl -L --progress-bar -o "%TEMP%\astap_setup.exe" "https://sourceforge.net/projects/astap-program/files/windows_installer/astap_setup.exe/download"

        if exist "%TEMP%\astap_setup.exe" (
            echo Running ASTAP Installation
            "%TEMP%\astap_setup.exe" /SILENT
            timeout /t 5 /nobreak > nul
            del "%TEMP%\astap_setup.exe" 2>nul
        ) else (
            echo [ERROR] ASTAP Download failed
        )
    ) else (
        echo Skipping ASTAP - already installed
    )
) else (
    echo Skipping ASTAP - not selected
)
echo.

:: D50 Database Installation
if %installD50% equ 1 (
    if %d50Installed% equ 0 (
        echo Installing D50 Star Database
        
        echo Downloading D50 Database
        curl -L --progress-bar -o "%TEMP%\d50_star_database.exe" "https://sourceforge.net/projects/astap-program/files/star_databases/d50_star_database.exe/download"

        if exist "%TEMP%\d50_star_database.exe" (
            echo Running D50 Database Installation
            "%TEMP%\d50_star_database.exe" /SILENT
            timeout /t 5 /nobreak > nul
            del "%TEMP%\d50_star_database.exe" 2>nul
        ) else (
            echo [ERROR] D50 Database Download failed
        )
    ) else (
        echo Skipping D50 Database - already installed
    )
) else (
    echo Skipping D50 Database - not selected
)
echo.

:: Offline Sky Map Installation
if %installSkyMap% equ 1 (
    if %skyMapInstalled% equ 0 (
        echo Installing Offline Sky Map 3.3GB
        
        echo Creating directory C:\OfflineSkyMap
        if not exist "C:\OfflineSkyMap" mkdir "C:\OfflineSkyMap"
        
        echo Downloading Sky Map 3.3GB
        curl -L --progress-bar -o "%TEMP%\FramingAssistantCache_Full.zip" "https://nighttime-imaging.eu/downloads/Setup/Releases/FramingAssistantCache_Full.zip"

        if exist "%TEMP%\FramingAssistantCache_Full.zip" (
            echo Extracting Sky Map to C:\OfflineSkyMap
            powershell -Command "Expand-Archive -Path '%TEMP%\FramingAssistantCache_Full.zip' -DestinationPath 'C:\OfflineSkyMap' -Force"
            del "%TEMP%\FramingAssistantCache_Full.zip" 2>nul
            echo Sky Map successfully extracted
        ) else (
            echo [ERROR] Sky Map Download failed
        )
    ) else (
        echo Skipping Sky Map - already installed
    )
) else (
    echo Skipping Sky Map - not selected
)
echo.

:: Stellarium Installation
if %installStellarium% equ 1 (
    if %stellariumInstalled% equ 0 (
        echo Installing Stellarium
        winget install --id=Stellarium.Stellarium 
        echo Skipping Stellarium - already installed
    )
) else (
    echo Skipping Stellarium - not selected
)
echo.

:: Meinberg NTP Installation
if %installNTP% equ 1 (
    if %ntpInstalled% equ 0 (
        echo Installing Meinberg NTP Time Sync
        
        echo Downloading Meinberg NTP
        curl -L --progress-bar -o "%TEMP%\ntp-4.2.8p15a-win32-setup.exe" "https://www.meinberg.de/download/ntp/windows/ntp-4.2.8p15a-win32-setup.exe"

        if exist "%TEMP%\ntp-4.2.8p15a-win32-setup.exe" (
            echo Running Meinberg NTP Installation
            "%TEMP%\ntp-4.2.8p15a-win32-setup.exe" 
            timeout /t 5 /nobreak > nul
            del "%TEMP%\ntp-4.2.8p15a-win32-setup.exe" 2>nul
            echo Meinberg NTP installation completed
        ) else (
            echo [ERROR] Meinberg NTP Download failed
        )
    ) else (
        echo Skipping Meinberg NTP - already installed
    )
) else (
    echo Skipping Meinberg NTP - not selected
)
echo.

echo.
echo Script completed!
pause
