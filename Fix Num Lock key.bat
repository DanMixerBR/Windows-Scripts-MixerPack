@echo off
title Fix Num Lock key
chcp 65001
cls

echo ======================================================================================================================
echo *** Fix Num Lock key *** by DanMixerBR
echo ======================================================================================================================
echo.

echo [EN] You may need to press the FN and Num Lock keys to enable the function.
echo [PT] Pode ser necessário pressionar as teclas FN e Num Lock para habilitar a função.
echo.
echo ======================================================================================================================
echo.

POWERSHELL [CONSOLE]::NumberLock | FIND /I "FALSE">NUL&&POWERSHELL ($WSH = New-Object -ComObject WScript.Shell)-AND($WSH.SendKeys('{NUMLOCK}'))>NUL

reg add "HKCU\Software\Microsoft\Osk" /v ShowNumPad /t REG_DWORD /d 1 /f >nul

reg add "HKCU\Control Panel\Keyboard" /v InitialKeyboardIndicators /t REG_SZ /d 2 /f

echo.
echo ======================================================================================================================
echo.
pause