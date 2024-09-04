@echo off
title Windows Program Update
chcp 65001
cls

:Start
cls
echo ======================================================================================================================
echo *** Windows Program Update v2 [Run as administrator] *** by DanMixerBR
echo ======================================================================================================================
echo.

PowerShell Add-AppxPackage -RegisterByFamilyName -MainPackage Microsoft.DesktopAppInstaller_8wekyb3d8bbwe

winget upgrade
echo.

:Menu1
echo ======================================================================================================================
echo 1 - Update all programs
echo 2 - Select programs
echo ======================================================================================================================
echo.

:Menu2
set /p areyousure="Enter an option: "
echo.
if "%areyousure%"=="1" goto All
if "%areyousure%"=="2" goto Selected1
goto Menu2

:All
winget upgrade --all --accept-package-agreements --accept-source-agreements
echo.
goto Menu1

:Selected1
echo ======================================================================================================================
echo ID Example: Microsoft.Teams  Microsoft.OneDrive  Google.Chrome.EXE
:Selected2
echo ======================================================================================================================
echo.
:Selected3
set /p NameID="Program ID: "
echo.
if "%NameID%"=="" goto Selected3

winget upgrade %NameID% --accept-package-agreements --accept-source-agreements
echo.
goto Selected2

:End
pause