@echo off
title PuTTY Backup and Restorer
goto :menu


:menu
echo ==== PuTTY Backup and Restorer ====

echo 1 - Fazer Backup
echo 2 - Restaurar Backup
echo 0 - Sair
set /p menu=Digite o numero da opcao: 
if "%menu%"=="0" (goto :exit)
if "%menu%"=="1" (goto :dobackup)
if "%menu%"=="2" (goto :restorebackup)
goto :menu


:dobackup

set /p file=Digite o nome do arquivo: 
regedit /e %file% HKEY_CURRENT_USER\Software\SimonTatham
echo.
goto :menu



:restorebackup
set /p file=Digite o nome do arquivo: 

If Exist %file% (goto :restore)
If Not Exist %file% (goto :restorefail)



:restore

regedit /s %file%

goto :menu

:restorefail
echo Arquivo nao encontrado!
echo.
goto :menu


:exit
exit
