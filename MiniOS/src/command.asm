;conatins list of commands and compares commands recieved from input.asm
.model small

.data
recieved_cmd db ""0
commands db "add",0 ;ok 1
         db "sub",0 ;ok 2
         db "mul",0 ;ok 3
         db "div",0 ;ok 4
         db "idiv",0 ;ok 5
         db "imul",0 ;ok 6
         db "cls",0 ;7
         db "echo",0 ;8
         db "time",0 ;9
         db "date",0 ;10
         db "delay",0 ;11
         db "beep",0 ;12
         db "exit",0 ;13
         db "help",0 ;14

help db 0ah,0dh, "add-----add two numbers$",
        0ah,0dh, "sub-----substract two numbers$",
        0ah,0dh, "mul-----multiply two numbers$",
        0ah,0dh, "div-----divide two numbers$",
        0ah,0dh, "idiv-----perform signed division$",
        0ah,0dh, "imul-----perform signed multiplication$",
        0ah,0dh, "cls-----clear screen$",
        0ah,0dh, "echo-----print a string on screen$",
        0ah,0dh, "time-----display time on screen$",
        0ah,0dh, "date-----display date on screen$",
        0ah,0dh, "delay-----delay system for three seconds$",
        0ah,0dh, "beep-----call system beep sound$",
        0ah,0dh, "exit-----exit command line$",
        0ah,0dh, "help-----information about available commands$"

.code

PUBLIC process_command
PUBLIC help_output

;description
process_command PROC
    ret
process_command ENDP

;description
help_output PROC
    lea dx, help
    mov ah, 09h
    int 21h
    ret
help_output ENDP

END