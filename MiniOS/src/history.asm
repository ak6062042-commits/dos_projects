.model small


.data
maxhistory equ 20
SavedHistory db maxhistory dup(?)

.code
INCLUDE "C:\MiniOS\include\minios.inc"
PUBLIC save_history
PUBLIC show_history

;description
save_history PROC
    ret
save_history ENDP

;description
show_history PROC
    ret
show_history ENDP

END