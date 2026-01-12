.model small
.stack 100h
 
.data
input1 db 0ah,0dh, "enter 1st digit:$"
input2 db 0ah,0dh, "enter 2nd digit:$"

sum db 0ah,0dh, "sum is:$"
diff db 0ah,0dh, "difference is:$"

temp db 0                  
var1 db 0
var2 db 0

greater1 db 0ah,0dh, "input 1 is greater!$"
greater2 db 0ah,0dh, "input 2 is greater!$"
options db 0ah,0dh, "0.Exit, 1.sum, 2.diff, 3.swap 4.find greater!$"
newline db 0ah,0dh, " $"
option_input db 0
insert db 0ah,0dh, "ENTER:$"
invalid db 0ah,0dh, "INVALID INPUT!!!$"

.code
main:
mov ax,@data
mov ds,ax

lea dx,input1
mov ah,09h
int 21h

mov ah,01h
int 21h
mov bl,al ;first input in bl
sub bl,030h

lea dx,input2
mov ah,09h
int 21h

mov ah,01h
int 21h
mov bh,al ;second input in bh
sub bh,030h

lea dx,newline
mov ah,09h
int 21h

lea dx,options
mov ah,09h
int 21h

lea dx,insert
mov ah,09h
int 21h

mov ah,01h
int 21h
mov option_input,al ;option checked
    cmp option_input,'0'
    je return

    cmp option_input,'1'
    je DO_SUM
    
    cmp option_input,'2'
    je DIFFER
    
    cmp option_input,'3'
    je SWAP
    
    cmp option_input,'4'
    je CHECK_GREATER
    jmp INVALID_INPUT

DO_SUM:
    add var1,bl
    add var1,bh

    add var1,030h
    
    lea dx,sum
    mov ah,09h
    int 21h
    
    mov dl,var1
    mov ah,02h
    int 21h
    
    jmp main

DIFFER:
    mov var1,bl
    sub var1,bh

    add var1,030h
    
    lea dx,diff
    mov ah,09h
    int 21h
    
    mov dl,var1
    mov ah,02h
    int 21h
    
    jmp main

SWAP:
    mov var1,bl
    mov var2,bh
    
    mov temp,bl
    mov var1,bh
    mov var2,bl

    jmp main

CHECK_GREATER:
    mov var1,bl
    mov var2,bh
    
        cmp var1,bh
        jl var1_lower
        jg var1_greater
        
            var1_lower:
                lea dx,greater2
                mov ah,09h
                int 21h
                jmp main
            
            var1_greater:
                lea dx,greater1
                mov ah,09h
                int 21h
                jmp main   
    
    jmp main

INVALID_INPUT:
    lea dx,invalid
    mov ah,09h
    int 21h
    
    jmp main

return:
    mov ah,4CH
    int 21h


end main    