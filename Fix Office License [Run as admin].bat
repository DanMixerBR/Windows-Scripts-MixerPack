@echo off
title Fix Office License by DanMixerBR
chcp 65001
cls

echo ======================================================================================================================
echo.
echo [EN] Fixing Microsoft Office License. Please wait...
echo.
echo [PT] Corrigindo a Licença do Microsoft Office. Por favor, aguarde...
echo.

cd "\Program Files\Common Files\microsoft shared\ClickToRun"

OfficeC2rclient.exe /update user updatetoversion=16.0.13801.20266

echo ======================================================================================================================
echo.
pause
