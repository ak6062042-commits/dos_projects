.model small

.data
invalid db 0ah,0dh, "INVALID COMMAND$"

.code
INCLUDE "C:\MiniOS\include\minios.inc"

EXTRN help_output:NEAR
EXTRN cls:NEAR
EXTRN exit_os:NEAR
EXTRN echo:NEAR

EXTRN add_cmd:NEAR
EXTRN sub_cmd:NEAR
EXTRN mul_cmd:NEAR
EXTRN imul_cmd:NEAR
EXTRN div_cmd:NEAR
EXTRN idiv_cmd:NEAR
EXTRN cmp_cmd:NEAR

EXTRN show_time:NEAR
EXTRN show_date:NEAR
EXTRN delay:NEAR
EXTRN beep:NEAR
EXTRN show_history:NEAR


;description
dispatch_command PROC NEAR
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
    je comparecmd

    cmp al,17
    je inva_lid

    addcmd:
        mov al,0
        call add_cmd
        ret

    subcmd:
        mov al,0
        call sub_cmd
        ret

    mulcmd:
        mov al,0
        call mul_cmd
        ret

    divcmd:
        mov al,0
        call div_cmd
        ret

    idivcmd:
        mov al,0
        call idiv_cmd
        ret

    imulcmd:
        mov al,0
        call imul_cmd
        ret

    clscmd:
        mov al,0
        call cls
        ret

    echocmd:
        mov al,0
        call echo
        ret
    timecmd:
        mov al,0
        call show_time
        ret

    datecmd:
        mov al,0
        call show_date
        ret

    delaycmd:
        mov al,0
        call delay
        ret

    beepcmd:
        mov al,0
        call beep
        ret

    exitcmd:
        mov al,0
        call exit_os
        ret

    helpcmd:
        mov al,0
        call help_output
        ret
    historycmd:
        mov al,0
        call show_history
        ret
    comparecmd:
        mov al,0
        call cmp_cmd
        ret
    
    inva_lid:
        mov al,0
        lea dx,invalid
        mov ah,09h
        int 21h
        ret
dispatch_command ENDP

PUBLIC dispatch_command

END