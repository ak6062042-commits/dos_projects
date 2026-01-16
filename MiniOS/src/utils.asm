.model small
.stack 100h

.data
sign db ?
msg db 0ah,0dh, "ENTER:$"
output db 0ah,0dh, "RESUTL:$"

.code
INCLUDE "C:\MiniOS\include\minios.inc"

single_input PROC NEAR
    mov ah,01h
    int 21h
    ret
single_input ENDP

double_input PROC NEAR
    lea dx,msg
    mov ah,09h
    int 21h
    
    call single_input

    cmp al,'-'
    jne POSITIVE

    mov sign,-1

    call single_input
    call atoi
    mov bl,al

    call single_input
    call atoi
    mov cl,al

    jmp BUILD

POSITIVE:
    call atoi
    mov bl,al
    mov sign,1

    call single_input
    call atoi
    mov cl,al

BUILD:
    mov al,bl
    mov bl,10
    mul bl

    mov ch,0
    add ax,cx

    cmp sign,-1
    je TO_NEG

    ret

TO_NEG:
    neg ax
    ret
double_input ENDP

atoi PROC NEAR
    sub al,030h
    ret
atoi ENDP

itoa PROC NEAR
    add al,030h
    ret
itoa ENDP

print_result PROC NEAR
    push ax
    push bx
    push cx
    push dx

    ;lea dx, output
    ;mov ah, 09h
    ;int 21h

    pop dx
    pop cx
    pop bx
    pop ax    
    
    push ax   
    push bx
    push cx
    push dx

    cmp ax, 0
    jge is_positive
    
    push ax
    mov al, '-'
    call print_one_digit
    pop ax
    neg ax

is_positive:
    mov cx, 0 
    mov bx, 10

convert_loop:
    xor dx, dx
    div bx
    push dx
    inc cx
    cmp ax, 0
    jne convert_loop

print_loop:
    pop dx
    mov al, dl
    call itoa
    call print_one_digit
    loop print_loop

exit_print:
    pop dx
    pop cx
    pop bx
    pop ax
    ret
print_result ENDP

print_div PROC NEAR
    push ax
    push bx
    push cx
    push dx

    mov cx, si
    push dx

    call print_result

    mov al, '.'
    call print_one_digit

    pop ax
    mov bx, 10
    imul bx
    idiv cx

    cmp ax, 0
    jge print_decimal
    neg ax

print_decimal:
    call itoa
    call print_one_digit

    pop dx
    pop cx
    pop bx
    pop ax
    ret
print_div ENDP

print_one_digit PROC
    push ax
    push dx

    mov dl, al
    mov ah, 02h
    int 21h

    pop dx
    pop ax
    ret
print_one_digit ENDP


;description
new_line PROC NEAR
    mov dl,0ah
    mov ah,02h
    int 21h
    
    mov dl,0dh
    mov ah,02h
    int 21h
    ret
new_line ENDP

;description
poutput PROC NEAR
    push dx
    push ax
    lea dx, output
    mov ah,09h 
    int 21h
    pop ax
    pop dx
    ret
poutput ENDP

PUBLIC print_one_digit
PUBLIC atoi
PUBLIC itoa
PUBLIC single_input
PUBLIC double_input
PUBLIC print_result
PUBLIC print_div
PUBLIC new_line
PUBLIC poutput

END
