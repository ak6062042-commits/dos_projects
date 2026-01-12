.model small
.stack 100h

.data
sign db 1
lmsg db 0ah,0dh, "TRY LOWER!$"
hmsg db 0ah, 0dh, "TRY HIGHER!$"
strt db 0ah,0dh, "ENTER NUMBER TO GUESS(-99 - +99):$"
won db 0ah,0dh, "game won!!!$"
hidden dw -67

.code

SINGLE_INPUT PROC
    mov ah,01h
    int 21h
    ret
SINGLE_INPUT ENDP

DOUBLE_INPUT PROC

   call SINGLE_INPUT

    cmp al,'-'
    jne POSITIVE

    mov sign,-1

    call SINGLE_INPUT
    mov bl,al ; first digit -ve input

    call SINGLE_INPUT
    mov cl,al ; second digit -ve

    jmp BUILD

    POSITIVE:
        mov bl,al ; store first +ve digit
        mov sign,1

        call SINGLE_INPUT
        mov cl,al ; store second +ve digit

    BUILD:
        sub bl,030h ; convert to int 10th digit
        sub cl,030h ; convert to int ones digit

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
    
DOUBLE_INPUT ENDP


main:
    mov ax,@data
    mov ds,ax
    
    lea dx,strt
    mov ah,09h
    int 21h

    call DOUBLE_INPUT

    mov bx,ax

    cmp bx,hidden
    je exit
    jl num_lower
    jg num_greater
    
    num_lower:
        lea dx,hmsg
        mov ah,09h
        int 21h
        jmp main
    
    num_greater:
        lea dx,lmsg
        mov ah,09h
        int 21h
        jmp main
    
    exit:
        lea dx,won
        mov ah,09h
        int 21h
        mov ah,4Ch
        int 21h

end main