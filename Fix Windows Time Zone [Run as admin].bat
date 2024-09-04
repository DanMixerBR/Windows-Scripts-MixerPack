@echo off
title Fix Windows Time Zone
chcp 65001
cls

echo ======================================================================================================================
echo *** Fix Windows Time Zone [Run as admin] *** by DanMixerBR
echo ======================================================================================================================
echo.

w32tm /register
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\w32time\Parameters" /v Type /t REG_SZ /d NTP /f 1>nul
echo.
sc config w32time start= demand 1>nul
net start w32time
w32tm /resync
schtasks /change /tn "\Microsoft\Windows\Time Synchronization\SynchronizeTime" /enable 1>nul

echo.
echo ======================================================================================================================
echo.

pause