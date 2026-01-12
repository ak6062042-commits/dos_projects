;cls, echo, exit
.model small

.data
max_input db 16
input_buffer
input db max_input dup(0)
.code

PUBLIC CLEAR_SCR
PUBLIC ECHO
PUBLIC exit_os

exit_os PROC
    mov ah,4Ch
    int 21h
exit_os ENDP

END