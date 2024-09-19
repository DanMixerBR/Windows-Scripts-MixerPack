@echo off
title HD Zero Fill
chcp 65001
cls


echo ======================================================================================================================
echo.
echo [EN] WARNING:
echo.
echo Zero Fill completely wipes the hard drive, making data recovery irreversible.
echo Please be aware of this information before proceeding with formatting.
echo.
echo ======================================================================================================================
echo.
echo [PT] ATENÇÃO:
echo.
echo O Zero Fill limpa completamente o disco rígido, tornando a recuperação de dados irreversível.
echo Esteja ciente dessas informações antes de prosseguir com a formatação.
echo.
echo ======================================================================================================================
echo.
pause
cls

echo ======================================================================================================================
echo  *** HD Zero Fill [Run as administrator] *** by DanMixerBR
:Start
echo ======================================================================================================================
echo.
wmic logicaldisk get name,size,volumename
echo ======================================================================================================================
echo.

echo [EN] Enter the letter of the drive you want to format. Example C, D, E.
echo [PT] Digite a letra da unidade que você deseja formatar. Exemplo C, D, E.
echo.
echo ======================================================================================================================
echo.

set /p driveletter="Drive letter: "
echo.

format %driveletter%: /fs:NTFS /p:0
echo.

goto Start