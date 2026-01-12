;add, sub, mul, div, cmp for signed and unsigned 16 bit numbers
.model small

.data
.code
PUBLIC unsigned_add
PUBLIC unsigned_sub
PUBLIC unsigned_mul
PUBLIC unsigned_div
PUBLIC signed_add
PUBLIC signed_sub
PUBLIC signed_mul
PUBLIC signed_div
PUBLIC COMPARE_SIGNED
PUBLIC COMPARED_UNSIGNED
;==================================================================
unsigned_div PROC
    xor dx,dx ; clear dx before div
    div bx
    ret
unsigned_div ENDP
unsigned_add PROC
    add ax,bx
    ret
unsigned_add ENDP
unsigned_mul PROC
    mul bx
    ret
unsigned_mul ENDP
unsigned_sub PROC
    sub ax,bx
    ret
unsigned_sub ENDP
;==================================================================

SIGNED_ADD PROC
    add ax,bx
    ret
SIGNED_ADD ENDP
SIGNED_SUB PROC
    sub ax,bx
    ret
SIGNED_SUB ENDP
SIGNED_MUL PROC
    imul bx
    ret
SIGNED_MUL ENDP
SIGNED_DIV PROC
    idiv bx
    ret
SIGNED_DIV ENDP
;==================================================================
COMPARE_SIGNED PROC
    cmp ax,bx
    ret
COMPARE_SIGNED ENDP
COMPARE_UNSIGNED PROC
    cmp ax,bx
    ret
COMPARE_UNSIGNED ENDP
;==================================================================
END