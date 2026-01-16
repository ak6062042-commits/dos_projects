@echo off
cls

cd \minios
if not exist build mkdir build

set TASM_FLAGS=/m /zi /iinclude


tasm %TASM_FLAGS% src\history.asm,    build\history.obj
tasm %TASM_FLAGS% src\main.asm,       build\main.obj
tasm %TASM_FLAGS% src\command.asm,    build\command.obj
tasm %TASM_FLAGS% src\dispatch.asm,   build\dispatch.obj
tasm %TASM_FLAGS% src\cal.asm,        build\arith.obj
tasm %TASM_FLAGS% src\screen.asm,     build\screen.obj
tasm %TASM_FLAGS% src\system.asm,     build\system.obj
tasm %TASM_FLAGS% src\utils.asm,      build\utils.obj

tlink /v build\main+build\command+build\dispatch+build\screen+build\arith+build\system+build\history+build\utils, build/minios.exe
