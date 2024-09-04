@echo off
title Driver Uninstaller
chcp 65001
cd /d "%~dp0"
cls
echo ======================================================================================================================
echo  *** Driver Uninstaller [Run as administrator] *** by DanMixerBR
echo ======================================================================================================================
echo.

set /p areyousure="List drivers? (Y/N): "
echo.
if "%areyousure%"=="y" goto Driver-List
if "%areyousure%"=="Y" goto Driver-List
if "%areyousure%"=="n" goto Delete
if "%areyousure%"=="N" goto Delete

:Driver-List
pnputil /enum-drivers > driver-list.txt
start driver-list.txt

:Delete
echo ======================================================================================================================
echo.
echo. [EN] Enter the published name of the driver. Example: oem0.inf 
echo. [PT] Digite o nome publicado do driver. Exemplo: oem0.inf
echo.
echo ======================================================================================================================
echo.
set /p driverdelete="Driver name: "
echo.

pnputil /delete-driver %driverdelete% /force
echo.

goto Delete