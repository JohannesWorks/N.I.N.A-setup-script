@echo off

echo ========================================
echo NINA, PHD2 & ASCOM Installation
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
if exist "C:\Program Files\ASCOM\Platform 7" set "ascomInstalled=1"
if exist "C:\Program Files (x86)\ASCOM\Platform 7" set "ascomInstalled=1"

if %ascomInstalled% equ 1 (
    echo [BEREITS INSTALLIERT] ASCOM gefunden
) else (
    echo [NICHT INSTALLIERT] ASCOM
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
    echo Installiere ASCOM Platform 7.0.2...
    
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

:: Finale Prüfung
echo Pruefe finale Installationen...

:: NINA prüfen
set "ninaFound=0"
if exist "C:\Program Files\N.I.N.A. - Nighttime Imaging 'N' Astronomy" set "ninaFound=1"
if exist "C:\Program Files (x86)\N.I.N.A. - Nighttime Imaging 'N' Astronomy" set "ninaFound=1"

if %ninaFound% equ 1 (
    echo [OK] NINA gefunden
) else (
    echo [FEHLER] NINA nicht gefunden
)

:: PHD2 prüfen
set "phd2Found=0"
if exist "C:\Program Files\PHDGuiding2" set "phd2Found=1"
if exist "C:\Program Files (x86)\PHDGuiding2" set "phd2Found=1"

if %phd2Found% equ 1 (
    echo [OK] PHD2 gefunden
) else (
    echo [FEHLER] PHD2 nicht gefunden
)

:: ASCOM prüfen (verbesserte Pfadprüfung)
set "ascomFound=0"
if exist "C:\Program Files\ASCOM\Platform 7" set "ascomFound=1"
if exist "C:\Program Files (x86)\ASCOM\Platform 7" set "ascomFound=1"
if exist "C:\Program Files\Common Files\ASCOM\Platform" set "ascomFound=1"
if exist "C:\Program Files (x86)\Common Files\ASCOM\Platform" set "ascomFound=1"

if %ascomFound% equ 1 (
    echo [OK] ASCOM gefunden
) else (
    echo [FEHLER] ASCOM nicht gefunden
)

echo.
echo ========================================
echo Installations-Zusammenfassung:
echo ========================================
if %ninaFound% equ 1 (
    echo NINA: Erfolgreich
) else (
    echo NINA: Fehlgeschlagen
)

if %phd2Found% equ 1 (
    echo PHD2: Erfolgreich
) else (
    echo PHD2: Fehlgeschlagen
)

if %ascomFound% equ 1 (
    echo ASCOM: Erfolgreich
) else (
    echo ASCOM: Fehlgeschlagen
)

echo.
if %ninaFound% equ 1 if %phd2Found% equ 1 if %ascomFound% equ 1 (
    echo Alle Programme erfolgreich installiert!
) else (
    echo Einige Installationen waren nicht erfolgreich.
)

echo.
echo Script beendet!
pause
