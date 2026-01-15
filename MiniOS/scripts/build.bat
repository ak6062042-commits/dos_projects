@echo off
cls

echo ===============================
echo Building MiniOS using TASM
echo ===============================

REM Go to project root
cd ..

REM Ensure build directory exists
if not exist build mkdir build

echo.
echo Assembling source files...
echo.

echo Building main.obj
tasm /zi /m /iinclude src\main.asm,       build\main.obj
echo Building input.obj
tasm /zi /m /iinclude src\input.asm,      build\input.obj
echo Building command.obj
tasm /zi /m /iinclude src\command.asm,    build\command.obj
echo Building dispatcher.obj
tasm /zi /m /iinclude src\dispatcher.asm, build\dispatcher.obj
echo Building screen.obj
tasm /zi /m /iinclude src\screen.asm,     build\screen.obj
echo Building arithmetic.obj
tasm /zi /m /iinclude src\arithmetic.asm, build\arithmetic.obj
echo Building system.obj
tasm /zi /m /iinclude src\system.asm,     build\system.obj
echo Building history.obj
tasm /zi /m /iinclude src\history.asm,    build\history.obj
echo Building utils.obj
tasm /zi /m /iinclude src\utils.asm,      build\utils.obj

if errorlevel 1 goto error

echo.
echo Linking all object files to ../build/minios.exe
echo.

tlink /v ^
 build/main.obj +
 build/input.obj +
 build/command.obj +
 build/dispatcher.obj +
 build/screen.obj +
 build/arithmetic.obj +
 build/system.obj +
 build/history.obj +
 build/utils.obj, ^
 build/minios.exe

if errorlevel 1 goto error

echo.
echo ===============================
echo Build successful!
echo Output: build\minios.exe
echo ===============================
goto end

:error
echo.
echo *******************************
echo BUILD FAILED!
echo Check assembly errors.
echo *******************************

:end
pause
