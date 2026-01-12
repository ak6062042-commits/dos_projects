.model small
.stack 100h

.data
.code
PUBLIC exit_os
main:
    mov ax, @data
    mov ds,ax

    CMD:
        call read_command
        call process_command
        call dispatch_command
    
end main