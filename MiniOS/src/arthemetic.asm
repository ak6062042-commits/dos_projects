;add, sub, mul, div, cmp for signed and unsigned 16 bit numbers
.model small

.data
cmp_gfi db 0ah,0dh, "FIRST INPUT IS GREATER$"
cmp_gsi db 0ah,0dh, "SECOND INPUT IN GREATER$"
cmp_eq db 0ah,0dh, "BOTH INPUT ARE EQUAL$"
.code

PUBLIC add_cmd
PUBLIC sub_cmd
PUBLIC mul_cmd
PUBLIC imul_cmd
PUBLIC div_cmd
PUBLIC idiv_cmd
PUBLIC cmp_cmd

;description
add_cmd PROC
    call double_input
    mov bx,ax
    push bx

    call double_input
    pop bx

    add ax,bx
    call print_result
    ret
add_cmd ENDP

;description
sub_cmd PROC
    call double_input
    mov bx,ax
    push bx

    call double_input
    pop bx
    sub bx,ax

    mov ax,bx
    call print_result
    ret
sub_cmd ENDP

;description
mul_cmd PROC
    call double_input
    mov bx,ax
    push bx

    call double_input
    pop bx

    mul bx
    call print_result
    ret
mul_cmd ENDP

;description
imul_cmd PROC
    call double_input
    mov bx,ax
    push bx

    call double_input
    pop bx

    imul bx
    call print_result
    ret
imul_cmd ENDP

;description
div_cmd PROC
    call double_input
    mov bx,ax
    push bx

    call double_input
    pop bx

    push dx
    mov dx,0
    div bx

    call print_div
    pop dx
    ret
div_cmd ENDP

;description
idiv_cmd PROC
    call double_input
    mov bx,ax          
    push bx

    call double_input  
    pop bx             

    push dx
    cwd                
    idiv bx            

    call print_div
    pop dx
    ret
idiv_cmd ENDP


;description
cmp_cmd PROC
    call double_input
    mov bx,ax
    push bx

    call double_input
    cmp ax,bx

    jg greater
    jl less
    je equal

    greater:
        lea dx,cmp_gfi
        mov ah,09h
        int 21h
    
    less:
        lea dx,cmp_gsi
        mov ah,09h
        int 21h

    equal:
        lea dx,cmp_eq
        mov ah,09h
        int 21h

    pop bx
    ret
cmp_cmd ENDP

END