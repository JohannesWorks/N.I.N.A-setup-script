@echo off

echo ========================================
echo NINA, PHD2, ASCOM, ASTAP, D50 Database, Sky Map Installation
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

set /p "installD50=Install Astap D50 Star Database? (Y/N): "
if /i "%installD50%"=="Y" (set "installD50=1") else (set "installD50=0")

set /p "installStellarium=Install Stellarium? (Y/N): "
if /i "%installStellarium%"=="Y" (set "installStellarium=1") else (set "installStellarium=0")

set /p "installNTP=Install Meinberg NTP Time Sync? (Y/N): "
if /i "%installNTP%"=="Y" (set "installNTP=1") else (set "installNTP=0")

set /p "installGSS=Install Green Swamp Server SkyWatcher and Orion mounts (ASCOM Driver)? (Y/N): "
if /i "%installGSS%"=="Y" (set "installGSS=1") else (set "installGSS=0")

set /p "installOnStep=Install OnStep Telescope Control? (Y/N): "
if /i "%installOnStep%"=="Y" (set "installOnStep=1") else (set "installOnStep=0")

set /p "installOAT=Install OpenAstroTracker Control? (Y/N): "
if /i "%installOAT%"=="Y" (set "installOAT=1") else (set "installOAT=0")

set /p "installOATASCOM=Install OpenAstroTracker ASCOM Driver? (Y/N): "
if /i "%installOATASCOM%"=="Y" (set "installOATASCOM=1") else (set "installOATASCOM=0")


set /p "installZWO=Install ZWO ASCOM Driver? (Y/N): "
if /i "%installZWO%"=="Y" (set "installZWO=1") else (set "installZWO=0")

set /p "installQHY=Install QHY CCD All-in-One Driver? (Y/N): "
if /i "%installQHY%"=="Y" (set "installQHY=1") else (set "installQHY=0")

set /p "installToupTek=Install ToupTek ASCOM Driver? (Y/N): "
if /i "%installToupTek%"=="Y" (set "installToupTek=1") else (set "installToupTek=0")


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

:: Check Green Swamp Server
set "gssInstalled=0"
if exist "C:\Program Files\Green Swamp Server" set "gssInstalled=1"
if exist "C:\Program Files (x86)\Green Swamp Server" set "gssInstalled=1"

if %gssInstalled% equ 1 (
    echo [ALREADY INSTALLED] Green Swamp Server found
) else (
    echo [NOT INSTALLED] Green Swamp Server
)

:: Check OnStep
set "onStepInstalled=0"
if exist "C:\Program Files\OnStep" set "onStepInstalled=1"
if exist "C:\Program Files (x86)\OnStep" set "onStepInstalled=1"

if %onStepInstalled% equ 1 (
    echo [ALREADY INSTALLED] OnStep found
) else (
    echo [NOT INSTALLED] OnStep
)

:: Check OpenAstroTracker Control
set "oatInstalled=0"
if exist "C:\Program Files\OpenAstroTracker" set "oatInstalled=1"
if exist "C:\Program Files (x86)\OpenAstroTracker" set "oatInstalled=1"

if %oatInstalled% equ 1 (
    echo [ALREADY INSTALLED] OpenAstroTracker Control found
) else (
    echo [NOT INSTALLED] OpenAstroTracker Control
)

:: Check OpenAstroTracker ASCOM Driver
set "oatAscomInstalled=0"
if exist "C:\Program Files\ASCOM\Telescope" (
    if exist "C:\Program Files\ASCOM\Telescope\*OpenAstroTracker*" set "oatAscomInstalled=1"
)
if exist "C:\Program Files (x86)\ASCOM\Telescope" (
    if exist "C:\Program Files (x86)\ASCOM\Telescope\*OpenAstroTracker*" set "oatAscomInstalled=1"
)

if %oatAscomInstalled% equ 1 (
    echo [ALREADY INSTALLED] OpenAstroTracker ASCOM Driver found
) else (
    echo [NOT INSTALLED] OpenAstroTracker ASCOM Driver
)

:: Check ZWO ASCOM
set "zwoInstalled=0"
if exist "C:\Program Files\ZWO\ASI Camera" set "zwoInstalled=1"
if exist "C:\Program Files (x86)\ZWO\ASI Camera" set "zwoInstalled=1"

if %zwoInstalled% equ 1 (
    echo [ALREADY INSTALLED] ZWO ASCOM found
) else (
    echo [NOT INSTALLED] ZWO ASCOM
)

:: Check QHY CCD
set "qhyInstalled=0"
if exist "C:\Program Files\QHYCCD" set "qhyInstalled=1"
if exist "C:\Program Files (x86)\QHYCCD" set "qhyInstalled=1"

if %qhyInstalled% equ 1 (
    echo [ALREADY INSTALLED] QHY CCD found
) else (
    echo [NOT INSTALLED] QHY CCD
)

:: Check ToupTek ASCOM
set "toupTekInstalled=0"
if exist "C:\Program Files\ToupTek" set "toupTekInstalled=1"
if exist "C:\Program Files (x86)\ToupTek" set "toupTekInstalled=1"

if %toupTekInstalled% equ 1 (
    echo [ALREADY INSTALLED] ToupTek ASCOM found
) else (
    echo [NOT INSTALLED] ToupTek ASCOM
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
echo %d50Installed%
echo d50Installed ----------------------------------
echo %installD50%
echo  installD50----------------------------------
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

:: Green Swamp Server Installation
if %installGSS% equ 1 (
    if %gssInstalled% equ 0 (
        echo Installing Green Swamp Server
        
        echo Downloading Green Swamp Server
        curl -L --progress-bar -o "%TEMP%\ASCOMGSServer1086Setup.zip" "https://github.com/rmorgan001/GSServer/releases/download/v1.0.8.6/ASCOMGSServer1086Setup.zip"

        if exist "%TEMP%\ASCOMGSServer1086Setup.zip" (
            echo Extracting Green Swamp Server
            powershell -Command "Expand-Archive -Path '%TEMP%\ASCOMGSServer1086Setup.zip' -DestinationPath '%TEMP%\GSS_Extract' -Force"
            
            if exist "%TEMP%\GSS_Extract\ASCOMGSServer1086Setup.exe" (
                echo Running Green Swamp Server Installation
                "%TEMP%\GSS_Extract\ASCOMGSServer1086Setup.exe" 
                timeout /t 10 /nobreak > nul
                echo Green Swamp Server installation completed
            ) else (
                echo [ERROR] ASCOMGSServer1086Setup.exe not found in ZIP
            )
            
            rd /s /q "%TEMP%\GSS_Extract" 2>nul
            del "%TEMP%\ASCOMGSServer1086Setup.zip" 2>nul
        ) else (
            echo [ERROR] Green Swamp Server Download failed
        )
    ) else (
        echo Skipping Green Swamp Server - already installed
    )
) else (
    echo Skipping Green Swamp Server - not selected
)
echo.

:: OnStep Installation
if %installOnStep% equ 1 (
    if %onStepInstalled% equ 0 (
        echo Installing OnStep Telescope Control
        
        echo Downloading OnStep
        curl -L --progress-bar -o "%TEMP%\OnStep-Setup-1.0.43.zip" "http://www.stellarjourney.com/assets/downloads/OnStep-Setup-1.0.43.zip"

        if exist "%TEMP%\OnStep-Setup-1.0.43.zip" (
            echo Extracting OnStep
            powershell -Command "Expand-Archive -Path '%TEMP%\OnStep-Setup-1.0.43.zip' -DestinationPath '%TEMP%\OnStep_Extract' -Force"
            
            if exist "%TEMP%\OnStep_Extract\OnStep Setup.exe" (
                echo Running OnStep Installation
                "%TEMP%\OnStep_Extract\OnStep Setup.exe" 
                timeout /t 10 /nobreak > nul
                echo OnStep installation completed
            ) else (
                echo [ERROR] OnStep Setup.exe.exe not found in ZIP
            )
            
            rd /s /q "%TEMP%\OnStep_Extract" 2>nul
            del "%TEMP%\OnStep-Setup-1.0.43.zip" 2>nul
        ) else (
            echo [ERROR] OnStep Download failed
        )
    ) else (
        echo Skipping OnStep - already installed
    )
) else (
    echo Skipping OnStep - not selected
)
echo.

:: OpenAstroTracker Control Installation
if %installOAT% equ 1 (
    if %oatInstalled% equ 0 (
        echo Installing OpenAstroTracker Control
        
        echo Downloading OpenAstroTracker Control
        curl -L --progress-bar -o "%TEMP%\OATControlSetup.exe" "https://github.com/OpenAstroTech/OpenAstroTracker-Desktop/releases/download/V1.1.8.0/OATControlSetup.exe"

        if exist "%TEMP%\OATControlSetup.exe" (
            echo Running OpenAstroTracker Control Installation
            "%TEMP%\OATControlSetup.exe" 
            timeout /t 10 /nobreak > nul
            del "%TEMP%\OATControlSetup.exe" 2>nul
            echo OpenAstroTracker Control installation completed
        ) else (
            echo [ERROR] OpenAstroTracker Control Download failed
        )
    ) else (
        echo Skipping OpenAstroTracker Control - already installed
    )
) else (
    echo Skipping OpenAstroTracker Control - not selected
)
echo.

:: OpenAstroTracker ASCOM Driver Installation
if %installOATASCOM% equ 1 (
    if %oatAscomInstalled% equ 0 (
        echo Installing OpenAstroTracker ASCOM Driver
        
        echo Downloading OpenAstroTracker ASCOM Driver
        curl -L --progress-bar -o "%TEMP%\OpenAstroTracker.Setup.exe" "https://github.com/OpenAstroTech/OpenAstroTracker-Desktop/releases/download/V6.6.7.2/OpenAstroTracker.Setup.exe"

        if exist "%TEMP%\OpenAstroTracker.Setup.exe" (
            echo Running OpenAstroTracker ASCOM Driver Installation
            "%TEMP%\OpenAstroTracker.Setup.exe" 
            timeout /t 10 /nobreak > nul
            del "%TEMP%\OpenAstroTracker.Setup.exe" 2>nul
            echo OpenAstroTracker ASCOM Driver installation completed
        ) else (
            echo [ERROR] OpenAstroTracker ASCOM Driver Download failed
        )
    ) else (
        echo Skipping OpenAstroTracker ASCOM Driver - already installed
    )
) else (
    echo Skipping OpenAstroTracker ASCOM Driver - not selected
)
echo.

:: ZWO ASCOM Installation
if %installZWO% equ 1 (
    if %zwoInstalled% equ 0 (
        echo Installing ZWO ASCOM Driver
        
        echo Downloading ZWO ASCOM Driver
        curl -L --progress-bar -o "%TEMP%\ZWO_ASCOM_Setup_V6.5.30.exe" "https://dl.zwoastro.com/software?app=ASCOMDrive&platform=windows64&region=Overseas"

        if exist "%TEMP%\ZWO_ASCOM_Setup_V6.5.30.exe" (
            echo Running ZWO ASCOM Installation
            "%TEMP%\ZWO_ASCOM_Setup_V6.5.30.exe" 
            timeout /t 10 /nobreak > nul
            del "%TEMP%\ZWO_ASCOM_Setup_V6.5.30.exe" 2>nul
            echo ZWO ASCOM installation completed
        ) else (
            echo [ERROR] ZWO ASCOM Download failed
        )
    ) else (
        echo Skipping ZWO ASCOM - already installed
    )
) else (
    echo Skipping ZWO ASCOM - not selected
)
echo.

:: QHY CCD Installation
if %installQHY% equ 1 (
    if %qhyInstalled% equ 0 (
        echo Installing QHY CCD All-in-One Driver
        
        echo Downloading QHY CCD Driver
        curl -L --progress-bar -o "%TEMP%\QHYCCD_Win_AllInOne.24.12.27.10.exe" "https://www.qhyccd.com/file/repository/publish/AllInOne/24.12.27/QHYCCD_Win_AllInOne.24.12.27.10.exe"

        if exist "%TEMP%\QHYCCD_Win_AllInOne.24.12.27.10.exe" (
            echo Running QHY CCD Installation
            "%TEMP%\QHYCCD_Win_AllInOne.24.12.27.10.exe" 
            timeout /t 15 /nobreak > nul
            del "%TEMP%\QHYCCD_Win_AllInOne.24.12.27.10.exe" 2>nul
            echo QHY CCD installation completed
        ) else (
            echo [ERROR] QHY CCD Download failed
        )
    ) else (
        echo Skipping QHY CCD - already installed
    )
) else (
    echo Skipping QHY CCD - not selected
)
echo.

:: ToupTek ASCOM Installation
if %installToupTek% equ 1 (
    if %toupTekInstalled% equ 0 (
        echo Installing ToupTek ASCOM Driver
        
        echo Downloading ToupTek ASCOM Driver
        curl -L --progress-bar -o "%TEMP%\ToupTekASCOMSetup.exe" "https://www.touptek-astro.com/dl_software/ToupTekASCOMSetup.exe"

        if exist "%TEMP%\ToupTekASCOMSetup.exe" (
            echo Running ToupTek ASCOM Installation
            "%TEMP%\ToupTekASCOMSetup.exe" 
            timeout /t 10 /nobreak > nul
            del "%TEMP%\ToupTekASCOMSetup.exe" 2>nul
            echo ToupTek ASCOM installation completed
        ) else (
            echo [ERROR] ToupTek ASCOM Download failed
        )
    ) else (
        echo Skipping ToupTek ASCOM - already installed
    )
) else (
    echo Skipping ToupTek ASCOM - not selected
)
echo.


echo.
echo Script completed!
pause
