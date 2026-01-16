@echo off
cls
echo ========================================
echo        MiniOS Emergency Build
echo ========================================

REM Force the script to look at the current directory
cd C:\minios

REM Verify the file exists physically
if not exist src\main.asm (
    echo [ERROR] Cannot find C:\minios\src\main.asm
    echo Current Directory is:
    cd
    dir
    pause
    exit
)

if not exist build mkdir build

echo Assembling Main...
tasm /m2 /zi src\main.asm, build\main.obj

echo Assembling Modules...
tasm /m2 /zi src\input.asm, build\input.obj
tasm /m2 /zi src\command.asm, build\command.obj
tasm /m2 /zi src\dispatcher.asm, build\dispatch.obj
tasm /m2 /zi src\screen.asm, build\screen.obj
tasm /m2 /zi src\arithmetic.asm, build\arith.obj
tasm /m2 /zi src\system.asm, build\system.obj
tasm /m2 /zi src\history.asm, build\history.obj
tasm /m2 /zi src\utils.asm, build\utils.obj

if errorlevel 1 goto err

echo Linking...
tlink /v build\main+build\input+build\command+build\dispatch+build\screen+build\arith+build\system+build\history+build\utils, build\minios.exe

echo ----------------------------------------
echo BUILD SUCCESSFUL! Starting OS...
build\minios.exe
goto end

:err
echo.
echo !!! BUILD FAILED !!!
pause

:end