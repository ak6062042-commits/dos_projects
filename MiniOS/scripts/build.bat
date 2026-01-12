@echo off

REM Project build script

if not exist ..\build mkdir ..\build

tasm ..\src\main.asm       /I ..\include /fo ..\build\main.obj
tasm ..\src\input.asm      /I ..\include /fo ..\build\input.obj
tasm ..\src\command.asm    /I ..\include /fo ..\build\command.obj
tasm ..\src\screen.asm     /I ..\include /fo ..\build\screen.obj
tasm ..\src\arithmetic.asm /I ..\include /fo ..\build\arithmetic.obj
tasm ..\src\system.asm     /I ..\include /fo ..\build\system.obj
tasm ..\src\history.asm    /I ..\include /fo ..\build\history.obj
tasm ..\src\utils.asm      /I ..\include /fo ..\build\utils.obj

tlink /t /x ..\build\main.obj ..\build\input.obj ..\build\command.obj ..\build\screen.obj ..\build\arithmetic.obj ..\build\system.obj ..\build\history.obj ..\build\utils.obj /fo ..\build\minios.exe

echo.
echo Build completed! Executable: ..\build\minios.exe
pause
