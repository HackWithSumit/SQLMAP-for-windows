@echo off
setlocal

echo ================================
echo Installing SQLMap on Windows...
echo ================================

REM Set install directory
set INSTALL_DIR=C:\sqlmap

REM Create install directory if not exists
if not exist "%INSTALL_DIR%" (
    mkdir "%INSTALL_DIR%"
)

echo Downloading SQLMap package...
powershell -command "Invoke-WebRequest -Uri https://github.com/sqlmapproject/sqlmap/archive/refs/heads/master.zip -OutFile sqlmap.zip"

echo Extracting files...
powershell -command "Expand-Archive -LiteralPath sqlmap.zip -DestinationPath %INSTALL_DIR%"

del sqlmap.zip

REM Rename extracted folder
cd %INSTALL_DIR%
for /d %%i in (sqlmap-*) do (
    ren "%%i" sqlmap
)

REM Add SQLMap runner for easy command shortcut
echo @echo off > "%INSTALL_DIR%\sqlmap\sqlmap.bat"
echo python "%INSTALL_DIR%\sqlmap\sqlmap.py" %%* >> "%INSTALL_DIR%\sqlmap\sqlmap.bat"

REM Add to PATH for current session
setx PATH "%PATH%;%INSTALL_DIR%\sqlmap" >nul

echo.
echo =====================================
echo SQLMap Installed Successfully!
echo Run: sqlmap -h
echo Installed at: %INSTALL_DIR%\sqlmap
echo =====================================

pause
exit
