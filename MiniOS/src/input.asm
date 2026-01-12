.model small

.data
sign db 1
;chararray
;string array for command storage

.code


PUBLIC SINGLE_INPUT
PUBLIC DOUBLE_INPUT
PUBLIC cmd_str_INPUT
PUBLIC clear_STR_ARAY

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

 

;description
cmd_str_INPUT PROC
    ret
cmd_str_INPUT ENDP

;description
clear_STR_ARAY PROC
    ret
clear_STR_ARAY ENDP

END