@echo off
setlocal
cd /d "%~dp0"

if not "%~1"=="" goto direct

echo.
echo ==============================
echo   Select FPGA vendor
echo ==============================
echo   1 = Gowin
echo   2 = Xilinx
echo   3 = Exit
echo ==============================
choice /C 123 /N /M "Enter 1, 2, or 3: "
set "selection=%errorlevel%"
if "%selection%"=="3" exit /b 0
goto run

:direct
set "selection=%~1"

:run
powershell -NoProfile -ExecutionPolicy Bypass -File "%~dp0select_fpga.ps1" "%selection%"
set "result=%errorlevel%"
if not "%result%"=="0" (
    echo.
    echo Switch failed.
)

if "%~1"=="" pause
exit /b %result%
