@echo off
title Restore Win10 Context Menu
chcp 65001
cls

echo ======================================================================================================================
echo *** Restore Win10 Context Menu *** by DanMixerBR
echo ======================================================================================================================
echo.

reg add "HKCU\Software\Classes\CLSID\{86ca1aa0-34aa-4e8b-a509-50c905bae2a2}\InprocServer32" /f
echo.

echo ======================================================================================================================
echo.
echo [EN] Windows Explorer will restart. Please wait a few seconds...
echo [PT] O Windows Explorer será reiniciado. Por favor, aguarde alguns segundos...
echo.
echo ======================================================================================================================
echo.

taskkill /f /im explorer.exe >nul
start explorer.exe

pause