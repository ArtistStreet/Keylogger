@echo off
powershell -Command "Start-Process powershell -ArgumentList 'Set-MpPreference -DisableRealtimeMonitoring $true' -Verb RunAs"
