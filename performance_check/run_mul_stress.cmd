@echo off
setlocal
cd /d "%~dp0.."
if exist ".venv\Scripts\python.exe" (
    ".venv\Scripts\python.exe" "performance_check\run_mul_stress.py" %*
) else (
    python "performance_check\run_mul_stress.py" %*
)
exit /b %errorlevel%
