@echo off
setlocal
set "PYTHON=%~dp0.venv\Scripts\python.exe"

if not exist "%PYTHON%" (
    >&2 echo Project virtual environment not found. Run: python -m venv .venv
    exit /b 1
)

"%PYTHON%" "%~dp0coremark_fmax.py" %*
exit /b %errorlevel%
