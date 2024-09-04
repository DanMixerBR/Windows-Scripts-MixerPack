@echo off
title Fix Office 2016 by DanMixerBR
chcp 65001
cls

echo ======================================================================================================================
echo.
echo [EN] Fixing Microsoft Office 2016. Please wait...
echo.
echo [PT] Corrigindo o Microsoft Office 2016. Por favor, aguarde...
echo.

cd "\Program Files\Common Files\microsoft shared\ClickToRun"

OfficeC2rclient.exe /update user updatetoversion=16.0.13801.20266

echo ======================================================================================================================
echo.
pause