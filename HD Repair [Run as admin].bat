@echo off
title Reparo de HD
chcp 65001
cls
echo ======================================================================================================================
echo  *** HD Repair [Run as administrator] *** by DanMixerBR
echo ======================================================================================================================
echo.

:Start
echo [EN] Enter the letter of the drive you want to repair. Example C, D, E.
echo [PT] Insira a letra da unidade que você deseja reparar. Exemplo C, D, E.
echo.
echo ======================================================================================================================
echo.

set /p driveletter="Drive letter: "
echo.

chkdsk %driveletter%: /f
echo.

set /p areyousure="Do you want to check again? / Deseja verificar novamente (Y/N)? "
echo.
echo ======================================================================================================================
echo.
if "%areyousure%"=="y" goto Start
if "%areyousure%"=="Y" goto Start
if "%areyousure%"=="n" goto End
if "%areyousure%"=="N" goto End

:End
pause