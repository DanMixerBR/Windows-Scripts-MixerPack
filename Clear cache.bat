@echo off
title Clear cache by DanMixerBR
chcp 65001
cls

echo ======================================================================================================================
echo.
echo [EN] Clearing Windows temporary data. Please wait...
echo.
echo [PT] Limpando dados temporários do Windows. Por favor, aguarde...
echo.


taskkill /f /im explorer.exe >nul
start explorer.exe
RunDll32.exe InetCpl.cpl,ClearMyTracksByProcess 1
RunDll32.exe InetCpl.cpl,ClearMyTracksByProcess 2
RunDll32.exe InetCpl.cpl,ClearMyTracksByProcess 8
RunDll32.exe InetCpl.cpl,ClearMyTracksByProcess 16
RunDll32.exe InetCpl.cpl,ClearMyTracksByProcess 32
RunDll32.exe InetCpl.cpl,ClearMyTracksByProcess 255
del /q/f/s %temp%\* >nul 2>&1

echo ======================================================================================================================
echo.
pause