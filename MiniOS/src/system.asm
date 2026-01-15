.model small

.data
date db 0ah,0dh, "DATE:$"
time db 0ah,0dh, "TIME:$"
delay db 0ah,0dh, "DELAYED FOR 3 SECONDS"
sound db 0ah,0dh, "dos sound service called!$"
input db 0ah,0dh, "BEEP ?TIMES:$"

.code
PUBLIC show_time
PUBLIC show_date
PUBLIC delay
PUBLIC beep

;description
show_time PROC
    ret
show_time ENDP

;description
show_date PROC
    ret
show_date ENDP

;description
delay PROC
    ret
delay ENDP

;description
beep PROC
    lea dx,input
    mov ah,09h
    int 21h

    call single_input
    call atoi
    xor ch,ch
    mov cl,al
    
    lea dx,sound
    mov ah,09h
    int 21h

    sou_nd:
        cmp cx,0
        je exit

        mov dl, 07h
        mov ah, 02h
        int 21h

        dec cx
        jmp sou_nd

    exit:
        ret
beep ENDP

END