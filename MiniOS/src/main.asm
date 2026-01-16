.MODEL SMALL
.STACK 100h

INCLUDE "C:\MiniOS\include\minios.inc"

.DATA
.CODE

PUBLIC main

EXTRN read_command:NEAR
EXTRN process_command:NEAR
EXTRN dispatch_command:NEAR

main PROC NEAR
    mov ax, @data
    mov ds, ax
    mov es, ax

CMD:
    cld
    call read_command
    call process_command
    call dispatch_command
    jmp CMD
main ENDP

END main

