.model small

.data
invalid db 0ah,0dh, "INVALID COMMAND$"

.code
PUBLIC dispatch_command

;description
dispatch_command PROC
    cmp al,1
    je addcmd

    cmp al,2
    je subcmd
    
    cmp al,3
    je mulcmd

    cmp al,4
    je divcmd

    cmp al,5
    je idivcmd

    cmp al,6
    je imulcmd

    cmp al,7
    je clscmd

    cmp al,8
    je echocmd

    cmp al,9
    je timecmd

    cmp al,10
    je datecmd

    cmp al,11
    je delaycmd

    cmp al,12
    je beepcmd

    cmp al,13
    je exitcmd

    cmp al,14
    je helpcmd

    cmp al,15
    je historycmd

    cmp al,16
    je invalid

    addcmd:
        xor al,al
        call add_cmd
        ret

    subcmd:
        xor al,al
        call sub_cmd
        ret

    mulcmd:
        xor al,al
        call mul_cmd
        ret

    divcmd:
        xor al,al
        call div_cmd
        ret

    idivcmd:
        xor al,al
        call idiv_cmd
        ret

    imulcmd:
        xor al,al
        call imul_cmd
        ret

    clscmd:
        xor al,al
        call cls
        ret

    echocmd:
        xor al,al
        call echo
        ret
    timecmd:
        xor al,al
        call show_time
        ret

    datecmd:
        xor al,al
        call show_date
        ret

    delaycmd:
        xor al,al
        call delay
        ret

    beepcmd:
        xor al,al
        call beep
        ret

    exitcmd:
        xor al,al
        call exit_os
        ret

    helpcmd:
        xor al,al
        call help_output
        ret
    historycmd:
        xor al,al
        call show_history
        ret
        
    invalid:
        xor al,al
        lea dx,invalid
        mov ah,09h
        int 21h
        ret
dispatch_command ENDP

END