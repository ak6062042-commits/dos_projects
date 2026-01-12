; ========= MiniOS Interface =========

; ---- main ----
;call input processing dispatching

; ---- input ----
EXTERN read_command:NEAR

; ---- command ----
EXTERN process_command:NEAR
EXTERN help_output

; ---- screen ----
EXTERN cls:NEAR
EXTERN print_string:NEAR
EXTERN exit_os:NEAR

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

; ---- dispathcher ----
EXTERN dispatch_command:NEAR