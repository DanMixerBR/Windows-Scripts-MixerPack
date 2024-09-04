@echo off
title Check Windows password validity
cls

echo ======================================================================================================================
echo *** Check Windows password validity v2 *** by DanMixerBR
echo ======================================================================================================================
echo.
echo Domain: %USERDOMAIN% / %USERDNSDOMAIN%
echo.
:Start
echo ======================================================================================================================
echo.

set /p username="Username: "
echo.

net user %username% /domain | findstr /r "name | Name | Password[^]expires | last | Nome | [^Ú]ltima | senha[^]expira"
echo.

goto Start

:End
pause