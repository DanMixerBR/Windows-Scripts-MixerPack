@echo off
title Fix Office 365 by DanMixerBR
chcp 65001
cls

echo ======================================================================================================================
echo.
echo [EN] Fixing Microsoft Office 365. Please wait...
echo.
echo [PT] Corrigindo o Microsoft Office 365. Por favor, aguarde...
echo.

cd "\Program Files\Common Files\microsoft shared\ClickToRun"

OfficeClickToRun.exe scenario=Repair RepairType=QuickRepair

echo ======================================================================================================================
echo.
pause