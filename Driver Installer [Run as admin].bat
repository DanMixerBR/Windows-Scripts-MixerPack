@echo off
title Driver Installer
chcp 65001
cd /d "%~dp0"
cls
echo ======================================================================================================================
echo  *** Driver Installer [Run as administrator] *** by DanMixerBR
:Start
echo ======================================================================================================================
echo.

mkdir drivers 2>nul
echo [EN] Copy the driver or .INF file to the "Drivers" folder in this directory.
echo [PT] Copie o driver ou o arquivo .INF para a pasta "Drivers" neste diretório.
echo.

:Menu
echo ======================================================================================================================
echo.
set /p areyousure="Install drivers? (Y/N): "
echo.
if "%areyousure%"=="y" goto Install
if "%areyousure%"=="Y" goto Install
if "%areyousure%"=="n" goto End
if "%areyousure%"=="N" goto End

:Install
pnputil /subdirs /i /a drivers\*.inf
goto Menu

:End
echo ======================================================================================================================
echo.
pause