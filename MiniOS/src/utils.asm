.model small
.stack 100

.data
sign db ?
enter db 0ah,0dh, "ENTER:$"
.code

PUBLIC strcmp
PUBLIC atoi
PUBLIC itoa
PUBLIC single_input
PUBLIC double_input
PUBLIC print_result
PUBLIC print_div

single_input PROC
    mov ah,01h
    int 21h
    ret
single_input ENDP


double_input PROC
    lea dx,enter
    mov ah,09h
    int 21h
    
    call single_input

    cmp al,'-'
    jne POSITIVE

    mov sign,-1

    call single_input
    mov bl,al ; first digit -ve input

    call single_input
    call atoi
    mov cl,al ; second digit -ve

    jmp BUILD

    POSITIVE:
        mov bl,al ; store first +ve digit
        mov sign,1

        call single_input
        call atoi
        mov cl,al ; store second +ve digit

    BUILD:
        mov al,bl ; lower register of ax stores 10s digit 
        mov bl,10
        mul bl ; mltiply and store in ax

        mov ch,0 ; cl has been initialized mov ch,0 to clear unkonwn number now cx prepared
        add ax,cx

        mov cx,0

        mov cl,sign
        cmp cl,-1
        je TO_NEG

        mov cl,0
        ret

    TO_NEG:
        neg ax
        mov cl,0
        ret
    
double_input ENDP

;description
strcmp PROC
    ret
strcmp ENDP

;description
atoi PROC
    sub al,030h
    ret
atoi ENDP

;description
itoa PROC
    add al,030h
    ret
itoa ENDP

;description
print_result PROC
    ret
print_result ENDP

;description
print_div PROC
    ret
print_div ENDP

END
