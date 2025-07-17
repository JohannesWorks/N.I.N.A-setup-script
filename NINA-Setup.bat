@echo off

echo ========================================
echo NINA, PHD2, ASCOM, ASTAP & D50 Installation
echo ========================================
echo.

:: Prüfe vorhandene Installationen
echo Pruefe vorhandene Installationen...

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
if exist "C:\Program Files\astap\gaia_dr3_d50_0.dat" set "d50Installed=1"
if exist "C:\Program Files (x86)\astap\gaia_dr3_d50_0.dat" set "d50Installed=1"

if %d50Installed% equ 1 (
    echo [BEREITS INSTALLIERT] D50 Datenbank gefunden
) else (
    echo [NICHT INSTALLIERT] D50 Datenbank
)

echo.

:: NINA Installation
if %ninaInstalled% equ 0 (
    echo Installiere NINA...
    winget install --id=StefanBerg.NINA --silent
) else (
    echo Ueberspringe NINA - bereits installiert
)
echo.

:: PHD2 Installation
if %phd2Installed% equ 0 (
    echo Installiere PHD2...
    winget install --id=OpenPHDGuiding.PHD2 --silent
) else (
    echo Ueberspringe PHD2 - bereits installiert
)
echo.

:: ASCOM Installation
if %ascomInstalled% equ 0 (
    echo Installiere ASCOM Platform ...
    
    echo Lade ASCOM herunter...
    curl -L -o "%TEMP%\AscomPlatform702.4675.exe" "https://github.com/ASCOMInitiative/ASCOMPlatform/releases/download/v7.0.2/AscomPlatform702.4675.exe"

    if exist "%TEMP%\AscomPlatform702.4675.exe" (
        echo Fuehre ASCOM Installation aus...
        "%TEMP%\AscomPlatform702.4675.exe" /SILENT
        timeout /t 5 /nobreak > nul
        del "%TEMP%\AscomPlatform702.4675.exe" 2>nul
    ) else (
        echo [FEHLER] ASCOM Download fehlgeschlagen
    )
) else (
    echo Ueberspringe ASCOM - bereits installiert
)
echo.

:: ASTAP Installation
if %astapInstalled% equ 0 (
    echo Installiere ASTAP...
    
    echo Lade ASTAP herunter...
    curl -L -o "%TEMP%\astap_setup.exe" "https://sourceforge.net/projects/astap-program/files/windows_installer/astap_setup.exe/download"

    if exist "%TEMP%\astap_setup.exe" (
        echo Fuehre ASTAP Installation aus...
        "%TEMP%\astap_setup.exe" /SILENT
        timeout /t 5 /nobreak > nul
        del "%TEMP%\astap_setup.exe" 2>nul
    ) else (
        echo [FEHLER] ASTAP Download fehlgeschlagen
    )
    echo Installiere D50 Sterne-Datenbank...
    
    echo Lade D50 Datenbank herunter...
    curl -L -o "%TEMP%\d50_star_database.exe" "https://sourceforge.net/projects/astap-program/files/star_databases/d50_star_database.exe/download"

    if exist "%TEMP%\d50_star_database.exe" (
        echo Fuehre D50 Datenbank Installation aus...
        "%TEMP%\d50_star_database.exe" /SILENT
        timeout /t 5 /nobreak > nul
        del "%TEMP%\d50_star_database.exe" 2>nul
    ) else (
        echo [FEHLER] D50 Datenbank Download fehlgeschlagen
    )
) else (
    echo Ueberspringe ASTAP - bereits installiert
)
echo.

echo Script beendet!
pause
