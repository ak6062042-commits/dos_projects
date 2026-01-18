.model small


.data
maxhistory equ 140
SavedHistory db maxhistory dup(?)
global_counter dw 0
PUBLIC global_counter

temp db 0
.code

EXTRN new_line:NEAR
call global_counter
;description
save_history PROC NEAR
    push bx

    mov bx, global_counter
    cmp bx, maxhistory
    jb sh_store
    mov bx, 0
sh_store:
    lea si, SavedHistory
    add si, bx
    mov [si], al
    inc bx
    cmp bx, maxhistory
    jb sh_ok
    mov bx, 0
sh_ok:
    mov global_counter, bx
    pop bx
    ret
save_history ENDP


show_history PROC NEAR
    push bx
    push cx

    lea si, SavedHistory
    mov cx, global_counter
    mov bx, cx
    mov dx, maxhistory
    sub dx, bx
    add si, bx
    cmp cx, maxhistory
    jb sh_print_loop
    mov cx, maxhistory
sh_print_loop:
    cmp cx, 0
    je sh_done
    cmp si, OFFSET SavedHistory + maxhistory
    jb sh_char
    lea si, SavedHistory
sh_char:
    mov al, [si]
    cmp al, 0
    je sh_nl
    mov dl, al
    mov ah, 02h
    int 21h
    jmp sh_next
sh_nl:
    call new_line
sh_next:
    inc si
    dec cx
    jmp sh_print_loop
sh_done:
    pop cx
    pop bx
    ret
show_history ENDP


PUBLIC save_history
PUBLIC show_history

END