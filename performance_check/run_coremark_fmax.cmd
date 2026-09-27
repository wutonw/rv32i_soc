@echo off
setlocal
set "PYTHON=%~dp0..\.venv\Scripts\python.exe"
set "PATH=%~dp0..\.venv\Scripts;%PATH%"

if not exist "%PYTHON%" (
    >&2 echo Project virtual environment not found. Run: python -m venv .venv
    exit /b 1
)

"%PYTHON%" "%~dp0run_precoremark_stress.py"
if errorlevel 1 exit /b %errorlevel%

"%PYTHON%" "%~dp0coremark_fmax.py" %*
exit /b %errorlevel%
