cd /d %~dp0
@echo off
setlocal
setlocal EnableDelayedExpansion
title Prime Widescreen HUD Patcher Helper

set errorflag=0

set "knownHash=eeacd0ced8e2bae491eca14f141a4b7c"

set pakToolPath=%~dp0PakTool\PakTool.exe
set nodToolPath=%~dp0tools\nodtool.v1.win64.exe

echo.
echo # PRIME WIDESCREEN HUD PATCHER HELPER #

:start
echo. && echo.
echo ## START ##
echo.
echo To begin, copy the GGuiSys-pak, NoARAM-pak, and the PakTool folders into the same folder as this script.
echo Then make a copy of your Metroid Prime ^(USA^) ^(GM8E01^) ^(0-00^) ISO and place it in ths same folder as this script.
echo Make sure it is named: prime.iso
echo.
echo Then,
echo Press any key to to patch and create prime_widescreenhud.iso . . .
pause > NUL

:paktoolcheck
echo.
if not exist %pakToolPath% (
    echo %pakToolPath% not found.
    echo You'll need to copy the files from the original MetroidPrimeWidescreen mod here first.
    echo Please see the README.md file for more information.
    pause
    goto paktoolcheck
)
if not exist %~dp0NoARAM-pak (
    echo NoARAM-pak folder not found.
    echo You'll need to copy the files from the original MetroidPrimeWidescreen mod here first.
    echo Please see the README.md file for more information.
    pause
    goto paktoolcheck
)
if not exist %~dp0GGuiSys-pak (
    echo GGuiSys-pak folder not found.
    echo You'll need to copy the files from the original MetroidPrimeWidescreen mod here first.
    echo Please see the README.md file for more information.
    pause
    goto paktoolcheck
)

:fileverify
echo. && echo.
echo ## FILE VERIFICATION ##
echo Checking for prime.iso in "%cd%"
echo.
if exist %~dp0prime.iso (
    echo prime.iso found. Continuing...
) else (
    echo prime.iso not found.
    echo.
    echo Make a copy of your Metroid Prime ^(USA^) ^(GM8E01^) ^(0-00^) ISO and place it in ths same folder as this script.
    echo Make sure it is named: prime.iso
    echo.
    echo Press any key to try again . . .
    pause > nul
    goto fileverify
)

echo.
echo Verifying MD5 hash of prime.iso...
call %~dp0tools\md5.bat %~dp0prime.iso md5
echo.
echo             prime.iso hash: %md5%
echo   Expected G2ME01 ISO hash: %knownHash%
echo.

if %md5% == %knownHash% (
    echo Hash verified. Continuing...
) else (
    echo Warning: The hash of prime.iso does not match the known expected MD5 hash for Metroid Prime ^(USA^) ^(GM8E01^) ^(0-00^).
    echo This may be due to prime.iso being an improperly dumped image, in a different image format, a different localized version of the game, etc.
    echo While you may still continue, this process will likely fail.
    echo.
    echo Press any key to continue anyway . . .
    pause > nul
    echo.
)

echo. && echo.
echo ## EXTRACTING ORIGINAL IMAGE ##
%nodToolPath% extract -f %~dp0prime.iso "%~dp0imgfs"
if %ERRORLEVEL% neq 0 (
    set errorflag=1
    echo.
    echo An error has occured. ERRORLEVEL: %ERRORLEVEL%
    echo.
    echo Press any key to continue anyway . . .
    pause > nul
)

echo. && echo.
echo ## PROCESSING PAKS ##
%pakToolPath% -x "%~dp0imgfs\files\GGuiSys.pak" -o %~dp0temp\GGuiSys-pak
%pakToolPath% -x "%~dp0imgfs\files\NoARAM.pak"  -o %~dp0temp\NoARAM-pak
%pakToolPath% -d "%~dp0imgfs\files\GGuiSys.pak" -o %~dp0temp\
%pakToolPath% -d "%~dp0imgfs\files\NoARAM.pak" -o %~dp0temp\ 

@echo on
copy %~dp0GGuiSys-pak\* %~dp0temp\GGuiSys-pak\ 
copy %~dp0NoARAM-pak\* %~dp0temp\NoARAM-pak\
@echo off

%pakToolPath% -ra mp1 %~dp0temp\GGuiSys
%pakToolPath% -ra mp1 %~dp0temp\NoARAM

@echo on
del %~dp0imgfs\files\GGuiSys.pak
copy %~dp0temp\GGuiSys.pak %~dp0imgfs\files\
del %~dp0imgfs\files\NoARAM.pak
copy %~dp0temp\NoARAM.pak %~dp0imgfs\files\
@echo off

echo. && echo.
echo ## BUILDING NEW IMAGE ##
"%nodToolPath%" makegcn "%~dp0imgfs" "prime_widescreenhud.iso"
if %ERRORLEVEL% neq 0 (
    set errorflag=1
    echo.
    echo An error has occured. ERRORLEVEL: %ERRORLEVEL%
    echo.
    echo Press any key to continue anyway . . .
    pause > nul
)

echo. && echo.
echo ## ClEANING UP ##
echo Deleting temporary files that are no longer needed...
@echo on
rmdir %~dp0imgfs /q /s
rmdir %~dp0temp /q /s
@echo off

echo. && echo.
echo ## FINISHED ##

echo.
if %errorflag% neq 0 (
    echo Something went wrong. prime_widescreenhud.iso may have failed to be created properly.
) else (
    echo prime_widescreenhud.iso has been created.
)
echo.
echo Reminder: Remember to enable the Widescreen Gecko cheat-codes in the emulator or loader. 
echo           See the included README text for details.
echo.

:exit
echo.
echo Press any key to to exit . . .
pause > NUL

