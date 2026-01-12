; ========= MiniOS Interface =========

; ---- Main ----
EXTERN exit_os:NEAR

; ---- Input ----
EXTERN read_command:NEAR

; ---- Command ----
EXTERN process_command:NEAR

; ---- Screen ----
EXTERN cls:NEAR
EXTERN print_string:NEAR

; ---- Arithmetic ----
EXTERN add_cmd:NEAR
EXTERN sub_cmd:NEAR
EXTERN mul_cmd:NEAR
EXTERN div_cmd:NEAR
EXTERN cmp_cmd:NEAR

; ---- System ----
EXTERN show_time:NEAR
EXTERN show_date:NEAR
EXTERN delay:NEAR
EXTERN beep:NEAR

; ---- History ----
EXTERN save_history:NEAR
EXTERN show_history:NEAR

; ---- Utils ----
EXTERN strcmp:NEAR
EXTERN atoi:NEAR
EXTERN itoa:NEAR
