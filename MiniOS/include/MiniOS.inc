; ================= MiniOS Interface =================
; This file is meant to be INCLUDED inside .CODE

IFNDEF __MINIOS_INC__
__MINIOS_INC__ EQU 1

; ---- input ----
EXTERN read_command:NEAR
;EXTERN cmd_buffer:BYTE

; ---- command ----
EXTERN process_command:NEAR
EXTERN help_output:NEAR

; ---- screen ----
EXTERN cls:NEAR
EXTERN exit_os:NEAR
EXTERN echo:NEAR

; ---- arithmetic ----
EXTERN add_cmd:NEAR
EXTERN sub_cmd:NEAR
EXTERN mul_cmd:NEAR
EXTERN imul_cmd:NEAR
EXTERN div_cmd:NEAR
EXTERN idiv_cmd:NEAR
EXTERN cmp_cmd:NEAR

; ---- system ----
EXTERN show_time:NEAR
EXTERN show_date:NEAR
EXTERN delay:NEAR
EXTERN beep:NEAR

; ---- history ----
EXTERN save_history:NEAR
EXTERN show_history:NEAR

; ---- utils ----
EXTERN strcmp:NEAR
EXTERN atoi:NEAR
EXTERN itoa:NEAR
EXTERN single_input:NEAR
EXTERN double_input:NEAR
EXTERN print_result:NEAR
EXTERN print_div:NEAR

; ---- dispatcher ----
EXTERN dispatch_command:NEAR

ENDIF
