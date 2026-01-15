.model small
.stack 100h

.data
.code
PUBLIC exit_os
main:
    mov ax, @data
    mov ds,ax
    mov es,ax

    CMD:
        cld
        call read_command
        call process_command
        call dispatch_command
        jmp CMD
    
end main