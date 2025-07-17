@echo off

echo ========================================
echo NINA, PHD2, ASCOM, ASTAP, D50 & Sky Map Installation
echo ========================================
echo.

:: Benutzerabfrage für gewünschte Software
echo Waehlen Sie die zu installierenden Programme aus:
echo.

set /p "installNina=NINA installieren? (J/N): "
if /i "%installNina%"=="J" (set "installNina=1") else (set "installNina=0")

set /p "installSkyMap=Offline Sky Map installieren ca. 3,3 GB? (J/N): "
if /i "%installSkyMap%"=="J" (set "installSkyMap=1") else (set "installSkyMap=0")

set /p "installPhd2=PHD2 installieren? (J/N): "
if /i "%installPhd2%"=="J" (set "installPhd2=1") else (set "installPhd2=0")

set /p "installAscom=ASCOM installieren? (J/N): "
if /i "%installAscom%"=="J" (set "installAscom=1") else (set "installAscom=0")

set /p "installAstap=ASTAP installieren? (J/N): "
if /i "%installAstap%"=="J" (set "installAstap=1") else (set "installAstap=0")

if %installAstap% equ 1 (
    set /p "installD50=D50 Sterne-Datenbank installieren? (J/N): "
    if /i "%installD50%"=="J" (set "installD50=1") else (set "installD50=0")
) else (
    set "installD50=0"
)

echo.

:: Prüfe vorhandene Installationen
echo Pruefe vorhandene Installationen

:: NINA prüfen
set "ninaInstalled=0"
if exist "C:\Program Files\N.I.N.A. - Nighttime Imaging 'N' Astronomy" set "ninaInstalled=1"
if exist "C:\Program Files (x86)\N.I.N.A. - Nighttime Imaging 'N' Astronomy" set "ninaInstalled=1"

if %ninaInstalled% equ 1 (
    echo [BEREITS INSTALLIERT] NINA gefunden
) else (
    echo [NICHT INSTALLIERT] NINA
)

:: PHD2 prüfen
set "phd2Installed=0"
if exist "C:\Program Files\PHDGuiding2" set "phd2Installed=1"
if exist "C:\Program Files (x86)\PHDGuiding2" set "phd2Installed=1"

if %phd2Installed% equ 1 (
    echo [BEREITS INSTALLIERT] PHD2 gefunden
) else (
    echo [NICHT INSTALLIERT] PHD2
)

:: ASCOM prüfen (bessere Pfadprüfung)
set "ascomInstalled=0"
if exist "C:\Program Files\ASCOM\Platform" set "ascomInstalled=1"
if exist "C:\Program Files (x86)\ASCOM\Platform" set "ascomInstalled=1"

if %ascomInstalled% equ 1 (
    echo [BEREITS INSTALLIERT] ASCOM gefunden
) else (
    echo [NICHT INSTALLIERT] ASCOM
)

:: ASTAP prüfen
set "astapInstalled=0"
if exist "C:\Program Files\astap\astap.exe" set "astapInstalled=1"
if exist "C:\Program Files (x86)\astap\astap.exe" set "astapInstalled=1"

if %astapInstalled% equ 1 (
    echo [BEREITS INSTALLIERT] ASTAP gefunden
) else (
    echo [NICHT INSTALLIERT] ASTAP
)

:: D50 Datenbank prüfen
set "d50Installed=0"

:: Offline Sky Map prüfen
set "skyMapInstalled=0"
if exist "C:\OfflineSkyMap\FramingAssistantCache" set "skyMapInstalled=1"

if %skyMapInstalled% equ 1 (
    echo [BEREITS INSTALLIERT] Offline Sky Map gefunden
) else (
    echo [NICHT INSTALLIERT] Offline Sky Map
)

echo.

:: NINA Installation
if %installNina% equ 1 (
    if %ninaInstalled% equ 0 (
        echo Installiere NINA
        winget install --id=StefanBerg.NINA --silent
    ) else (
        echo Ueberspringe NINA - bereits installiert
    )
) else (
    echo Ueberspringe NINA - nicht ausgewaehlt
)
echo.

:: PHD2 Installation
if %installPhd2% equ 1 (
    if %phd2Installed% equ 0 (
        echo Installiere PHD2
        winget install --id=OpenPHDGuiding.PHD2 --silent
    ) else (
        echo Ueberspringe PHD2 - bereits installiert
    )
) else (
    echo Ueberspringe PHD2 - nicht ausgewaehlt
)
echo.

:: ASCOM Installation
if %installAscom% equ 1 (
    if %ascomInstalled% equ 0 (
        echo Installiere ASCOM Platform 
        
        echo Lade ASCOM herunter
        curl -L --progress-bar -o "%TEMP%\AscomPlatform702.4675.exe" "https://github.com/ASCOMInitiative/ASCOMPlatform/releases/download/v7.0.2/AscomPlatform702.4675.exe"

        if exist "%TEMP%\AscomPlatform702.4675.exe" (
            echo Fuehre ASCOM Installation aus
            "%TEMP%\AscomPlatform702.4675.exe" /SILENT
            timeout /t 5 /nobreak > nul
            del "%TEMP%\AscomPlatform702.4675.exe" 2>nul
        ) else (
            echo [FEHLER] ASCOM Download fehlgeschlagen
        )
    ) else (
        echo Ueberspringe ASCOM - bereits installiert
    )
) else (
    echo Ueberspringe ASCOM - nicht ausgewaehlt
)
echo.

:: ASTAP Installation
if %installAstap% equ 1 (
    if %astapInstalled% equ 0 (
        echo Installiere ASTAP
        
        echo Lade ASTAP herunter
        curl -L --progress-bar -o "%TEMP%\astap_setup.exe" "https://sourceforge.net/projects/astap-program/files/windows_installer/astap_setup.exe/download"

        if exist "%TEMP%\astap_setup.exe" (
            echo Fuehre ASTAP Installation aus
            "%TEMP%\astap_setup.exe" /SILENT
            timeout /t 5 /nobreak > nul
            del "%TEMP%\astap_setup.exe" 2>nul
        ) else (
            echo [FEHLER] ASTAP Download fehlgeschlagen
        )
    ) else (
        echo Ueberspringe ASTAP - bereits installiert
    )
) else (
    echo Ueberspringe ASTAP - nicht ausgewaehlt
)
echo.

:: D50 Datenbank Installation
if %installD50% equ 1 (
    if %d50Installed% equ 0 (
        echo Installiere D50 Sterne-Datenbank
        
        echo Lade D50 Datenbank herunter
        curl -L --progress-bar -o "%TEMP%\d50_star_database.exe" "https://sourceforge.net/projects/astap-program/files/star_databases/d50_star_database.exe/download"

        if exist "%TEMP%\d50_star_database.exe" (
            echo Fuehre D50 Datenbank Installation aus
            "%TEMP%\d50_star_database.exe" /SILENT
            timeout /t 5 /nobreak > nul
            del "%TEMP%\d50_star_database.exe" 2>nul
        ) else (
            echo [FEHLER] D50 Datenbank Download fehlgeschlagen
        )
    ) else (
        echo Ueberspringe D50 Datenbank - bereits installiert
    )
) else (
    echo Ueberspringe D50 Datenbank - nicht ausgewaehlt
)
echo.

:: Offline Sky Map Installation
if %installSkyMap% equ 1 (
    if %skyMapInstalled% equ 0 (
        echo Installiere Offline Sky Map 3.3GB
        
        echo Erstelle Verzeichnis C:\OfflineSkyMap
        if not exist "C:\OfflineSkyMap" mkdir "C:\OfflineSkyMap"
        
        echo Lade Sky Map herunter 3.3GB
        curl -L --progress-bar -o "%TEMP%\FramingAssistantCache_Full.zip" "https://nighttime-imaging.eu/downloads/Setup/Releases/FramingAssistantCache_Full.zip"

        if exist "%TEMP%\FramingAssistantCache_Full.zip" (
            echo Entpacke Sky Map nach C:\OfflineSkyMap
            powershell -Command "Expand-Archive -Path '%TEMP%\FramingAssistantCache_Full.zip' -DestinationPath 'C:\OfflineSkyMap' -Force"
            del "%TEMP%\FramingAssistantCache_Full.zip" 2>nul
            echo Sky Map erfolgreich entpackt
        ) else (
            echo [FEHLER] Sky Map Download fehlgeschlagen
        )
    ) else (
        echo Ueberspringe Sky Map - bereits installiert
    )
) else (
    echo Ueberspringe Sky Map - nicht ausgewaehlt
)
echo.


echo.
echo Script beendet!
pause
