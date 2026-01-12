;conatins list of commands and compares commands recieved from input.asm
.model small

.data
commands db "add",0 ;ok
         db "sub",0 ;ok
         db "mul",0 ;ok
         db "div",0 ;ok
         db "cursor",0
         db "idiv",0 ;ok
         db "imul",0 ;ok
         db "cls",0
         db "print",0
         db "echo",0
         db "time",0
         db "date",0
         db "delay",0
         db "beep",0
         db "exit",0
         db "help",0

.code
