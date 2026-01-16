;cls, echo, exit
.model small


.data
max_input EQU 30
inputlen db ?
input_buffer db max_input dup(?)
msg db 0ah,0dh, "echo > $"
.code
INCLUDE "C:\MiniOS\include\minios.inc"
EXTRN single_input:NEAR
EXTRN new_line:NEAR

;description
cls PROC NEAR
    mov ax, 0600h    ; AH = 06h (Scroll), AL = 00h (Full Screen)
    mov bh, 07h      ; BH = Attribute (07h is Light Gray on Black)
    mov cx, 0000h    ; CH = Row 0, CL = Col 0 (Top Left)
    mov dx, 184Fh    ; DH = Row 24, DL = Col 79 (Bottom Right for 80x25)
    int 10h          ; Call BIOS video service

    ; After clearing, the cursor stays at the bottom. 
    ; We must reset it to the top-left (0,0).
    mov ah, 02h      ; Function 02h: Set Cursor Position
    mov bh, 00h      ; Page 0
    mov dx, 0000h    ; Row 0, Col 0
    int 10h
    ret
cls ENDP

;description
echo PROC NEAR
    lea dx,msg
    mov ah,09h
    int 21h

    lea di,input_buffer
    
    input_str:
    cmp inputlen,30
    je done

    call single_input
    cmp al,0Dh
    je done

    inc inputlen
    mov [di],al
    inc di
    jmp input_str
    
    done:
    inc inputlen
    mov al,0
    mov [di],al
    stosb
    
    prepare:
    call new_line
    lea di,input_buffer

    print:
    mov dl,[di]
    cmp dl,0
    je printed
    
    mov ah,02h
    int 21h
    
    inc di
    jmp print
    
    printed:
    ret
echo ENDP

exit_os PROC NEAR
    mov ah,4Ch
    int 21h
exit_os ENDP

PUBLIC cls   ; not implemented myself 
PUBLIC ECHO
PUBLIC exit_os


END