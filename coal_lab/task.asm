.model small
.stack 100h

.data
sr8 db 0ah,0dh, "shifted right 705 1 bit 8 times: $"
sl8 db 0ah,0dh, "shifted left 705 1 bit 8 times: $"
id  dw 02C1h

.code
main:
    mov ax, @data
    mov ds, ax

    mov ax, id
    mov bx, id

    mov cl, 8           
shift_loop:
    shr ax, 1           
    shl bx, 1           
    dec cl
    jnz shift_loop

    push ax
    lea dx, sr8
    mov ah, 09h
    int 21h
    pop ax
    call PrintDecAX

    lea dx, sl8
    mov ah, 09h
    int 21h

    mov ax, bx
    call PrintDecAX

exit:
    mov ah, 4Ch
    int 21h


PrintDecAX proc
    push ax
    push bx
    push cx
    push dx

    mov bx, 10
    xor cx, cx        
convert:
    xor dx, dx
    div bx           
    push dx           
    inc cx
    cmp ax, 0
    jne convert

print_digits:
    pop dx
    add dl, '0'
    mov ah, 02h
    int 21h
    loop print_digits

    pop dx
    pop cx
    pop bx
    pop ax
    ret
PrintDecAX endp


end main
