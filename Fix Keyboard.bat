@echo off
title Fix Keyboard
chcp 65001
cls

echo ======================================================================================================================
echo *** Fix Keyboard *** by DanMixerBR
echo ======================================================================================================================
echo.

C:\Windows\System32\ctfmon.exe

powershell "$s=(New-Object -COM WScript.Shell).CreateShortcut('%AppData%\Microsoft\Windows\Start Menu\Programs\Startup\ctfmon.lnk');$s.TargetPath='C:\Windows\System32\ctfmon.exe';$s.Save()"

echo Operation complete!
echo.
echo ======================================================================================================================
echo.

pause