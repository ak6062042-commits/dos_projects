.model small


.data
date db 0ah,0dh, "DATE:$"
time db 0ah,0dh, "TIME:$"
del_ay db 0ah,0dh, "DELAYED FOR 3 SECONDS$"
sound db 0ah,0dh, "dos sound service called!$"
input db 0ah,0dh, "BEEP ?TIMES:$"

.code
INCLUDE "C:\MiniOS\include\minios.inc"
EXTRN single_input:NEAR
EXTRN atoi:NEAR
EXTRN print_result:NEAR

;description
show_time PROC NEAR
    mov ah, 2Ch
    int 21h

    mov al, ch
    call print_result

    mov dl, ':'
    mov ah, 02h
    int 21h

    mov al, cl
    call print_result

    mov dl, ':'
    mov ah, 02h
    int 21h

    mov al, dh
    call print_result

    ret
show_time ENDP

;description
show_date PROC NEAR
    mov ah, 2Ah
    int 21h

    push cx
    push dx

    mov al, dl
    mov ah, 0
    call print_result

    call print_slash

    pop dx
    push dx
    mov al, dh
    mov ah, 0
    call print_result

    call print_slash

    pop dx
    pop ax
    call print_result

    ret
show_date ENDP

print_slash PROC NEAR
    mov al, '/'
    mov dl, al
    mov ah, 02h
    int 21h
    ret
print_slash ENDP

;description
delay PROC NEAR
    lea dx,del_ay
    mov ah,09h
    int 21h
    
    mov ah, 86h
    mov cx, 002Dh
    int 15h

    ret
delay ENDP

;description
beep PROC NEAR
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

PUBLIC show_time
PUBLIC show_date
PUBLIC delay
PUBLIC beep
PUBLIC print_slash

END