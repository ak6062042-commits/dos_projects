;add, sub, mul, div, cmp for signed and unsigned 16 bit numbers
.model small

.data
cmp_gfi db 0ah,0dh, "FIRST INPUT IS GREATER$"
cmp_gsi db 0ah,0dh, "SECOND INPUT IN GREATER$"
cmp_eq db 0ah,0dh, "BOTH INPUT ARE EQUAL$"
.code
INCLUDE "C:\MiniOS\include\minios.inc"
EXTRN double_input:NEAR
EXTRN print_result:NEAR
EXTRN print_div:NEAR
EXTRN poutput:NEAR
;description
add_cmd PROC NEAR
    call double_input
    mov si, ax          
    call double_input   
    add ax, si
    call poutput          
    call print_result
    ret
add_cmd ENDP

;description
sub_cmd PROC NEAR
    call double_input
    mov bx,ax
    push bx

    call double_input
    pop bx
    sub bx,ax

    mov ax,bx
    call poutput
    call print_result
    ret
sub_cmd ENDP

;description
mul_cmd PROC NEAR
    call double_input
    mov si, ax
    call double_input
    mul si
    call poutput             
    call print_result
    ret
mul_cmd ENDP

;description
imul_cmd PROC NEAR
    call double_input
    mov si, ax
    call double_input
    imul si
    call poutput
    call print_result
    ret
imul_cmd ENDP
;description
div_cmd PROC NEAR
    call double_input
    push ax
    call double_input
    mov si,ax
    pop ax
    mov dx,0
    div si
    call poutput
    call print_div
    ret
div_cmd ENDP

;description
idiv_cmd PROC NEAR
    call double_input
    push ax     

    call double_input          
    mov si,ax
    pop ax
    push dx
    cwd                
    idiv si            
    call poutput
    call print_div
    pop dx
    ret
idiv_cmd ENDP


;description
cmp_cmd PROC NEAR
    call double_input
    mov si,ax
    push bx

    call double_input
    cmp si,ax
    jg greater
    jl less
    je equal

    greater:
        lea dx,cmp_gfi
        mov ah,09h
        int 21h
        jmp return
    
    less:
        lea dx,cmp_gsi
        mov ah,09h
        int 21h
        jmp return

    equal:
        lea dx,cmp_eq
        mov ah,09h
        int 21h
        jmp return

    return:
        pop bx
        ret
cmp_cmd ENDP

PUBLIC add_cmd
PUBLIC sub_cmd
PUBLIC mul_cmd
PUBLIC imul_cmd
PUBLIC div_cmd
PUBLIC idiv_cmd
PUBLIC cmp_cmd

END