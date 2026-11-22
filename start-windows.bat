@echo off
setlocal
cd /d "%~dp0"
echo Setting up InstaScan AI Pro...
call npm install
if errorlevel 1 goto failed
call npm run setup
if errorlevel 1 goto failed
start "InstaScan Backend" cmd /k "cd /d ""%~dp0"" && npm run server"
start "InstaScan Frontend" cmd /k "cd /d ""%~dp0"" && npm run client"
echo.
echo Open http://localhost:5173 in your browser.
pause
exit /b 0
:failed
echo Setup failed. Check that Node.js 20+ is installed and try again.
pause
exit /b 1
