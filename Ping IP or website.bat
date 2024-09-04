@echo off
title Ping IP or website
chcp 65001
cls
echo ======================================================================================================================
echo  *** Ping IP or website *** by DanMixerBR
:Start
echo ======================================================================================================================
echo.

set /p url="Insert URL: "
echo.

ping %url% 2>nul
echo.
goto Start

set /p areyousure="Do you want to check again? / Deseja verificar novamente (Y/N)? "
echo.
if "%areyousure%"=="y" goto Start
if "%areyousure%"=="Y" goto Start
if "%areyousure%"=="n" goto End
if "%areyousure%"=="N" goto End
echo.

:End
pause