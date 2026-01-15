.model small

.data
minios db 0ah,0dh, "MiniOS>$"
CMD_MAXLEN equ 16
cmd_bufer db CMD_MAXLEN dup(0)
cmd_len db 0

.code
PUBLIC read_command

read_command PROC
    mov dx,minios
    mov ah,09h
    int 21h

    lea di,cmd_bufer ;load address to di per input
    mov cx,CMD_MAXLEN ;for loop
    mov cmd_len,0 ;keep counting command length
    
    READ_LOOP:
        call SINGLE_INPUT

        cmp al,0DH ;check if enter pressed return to caller
        je DONE
        
        stosb ;store string byte
        inc cmd_len
        dec cx
        
        jmp READ_LOOP
    DONE:
        mov al,0 ;strings end with a null charater here 0 
        stosb ;store string bytes
        ret
read_command ENDP


END