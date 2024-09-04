@echo off
title Fix Microsoft Outlook by DanMixerBR
chcp 65001
cls

echo ======================================================================================================================
echo.
echo [EN] Fixing Microsoft Outlook. Please wait...
echo [PT] Corrigindo o Microsoft Outlook. Por favor, aguarde...
echo.

taskkill /f /im outlook.exe >nul 2>&1

del /q/f/s %temp%\* >nul 2>&1

reg delete "HKCU\Software\Microsoft\Office\Outlook" /f >nul 2>&1

echo ======================================================================================================================
echo.
echo Operation complete!
echo.
echo ======================================================================================================================
echo.

:x64
"C:\Program Files\Microsoft Office\root\Office16\outlook.exe" /resetnavpane 2>nul

:x86
"C:\Program Files (x86)\Microsoft Office\root\Office16\outlook.exe" /resetnavpane 2>nul

pause