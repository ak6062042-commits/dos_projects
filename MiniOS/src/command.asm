;conatins list of commands and compares commands recieved from input.asm
.model small

.data
pos db 0

minios db 0ah,0dh, "MiniOS>$"
CMD_MAXLEN equ 16
cmd_buffer db CMD_MAXLEN dup(?)
cmd_len dw 0

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
         db "history",0; 15
         db "compare"
         db 0 

help db   0ah,0dh, "add-----add two numbers"
     db   0ah,0dh, "sub-----substract two numbers"
     db   0ah,0dh, "mul-----multiply two numbers"
     db   0ah,0dh, "div-----divide two numbers"
     db   0ah,0dh, "idiv-----perform signed division"
     db   0ah,0dh, "imul-----perform signed multiplication"
     db   0ah,0dh, "cls-----clear screen"
     db   0ah,0dh, "echo-----print a string on screen"
     db   0ah,0dh, "time-----display time on screen"
     db   0ah,0dh, "date-----display date on screen"
     db   0ah,0dh, "delay-----delay system for three seconds"
     db   0ah,0dh, "beep-----call system beep sound"
     db   0ah,0dh, "exit-----exit command line"
     db   0ah,0dh, "help-----information about available commands"
     db   0ah,0dh, "history-----show last 20 commands enterd"
     db   0ah,0dh, "compare-----compares two numbers$"

.code

INCLUDE "C:\MiniOS\include\minios.inc"
EXTRN single_input:NEAR
EXTRN save_history:NEAR

read_command PROC NEAR
    lea dx, minios
    mov ah, 09h
    int 21h

    lea di, cmd_buffer
    mov cmd_len, 0

READ_LOOP:
    cmp cmd_len, CMD_MAXLEN
    je DONE

    call single_input

    cmp al, 0Dh
    je DONE

    mov [di],al
    call save_history
    inc di
    inc cmd_len
    jmp READ_LOOP

DONE:
    mov byte ptr [di], 0 
    call save_history
    ret
read_command ENDP


;description
process_command PROC NEAR
    mov pos, 0
    lea si, commands    
next_word:
    inc pos
    lea di, cmd_buffer  
    mov bx, si         

    cmp byte ptr [si], 0
    je is_invalid

compare_chars:
    mov al, [bx]       
    mov dl, [di]       

    cmp dl, 0Dh
    jne check_null
    mov dl, 0

check_null:
    cmp al, dl
    jne move_to_next_word 

    cmp al, 0           
    je is_found

    inc bx
    inc di
    jmp compare_chars

move_to_next_word:
    cmp byte ptr [si], 0
    je reached_end_of_word
    inc si
    jmp move_to_next_word

reached_end_of_word:
    inc si              
    jmp next_word

is_found:
    mov al, pos         
    ret

is_invalid:
    mov al, 17     
    ret
process_command ENDP

;description
help_output PROC NEAR
    lea dx, help
    mov ah, 09h
    int 21h
    ret
help_output ENDP

PUBLIC process_command
PUBLIC read_command
PUBLIC help_output

END