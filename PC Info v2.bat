@echo off
title PC Info
cls
echo ======================================================================================================================
echo  *** PC Info v2 *** by DanMixerBR
echo ======================================================================================================================
echo.

ipconfig | findstr /C:IPv4
echo.

systeminfo | findstr "Host[^]Name | OS[^]Name | Version | System[^]Manufacturer | System[^]Model | System[^]Type | Total | Domain | Nome[^]do[^]host | Nome[^]do[^]sistema | Vers[^ã]o | Fabricante[^]do[^]sistema: | Modelo | Tipo[^]de[^]sistema | total | Dom[^í]nio"
echo.

wmic cpu get Name
wmic bios get SerialNumber

echo ======================================================================================================================
echo.
pause