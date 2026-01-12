.model small
.stack 100

.data

.code
main:
    ; 1.call interface ; from "screen.asm"

    ; 2.enter cmd    ; commands entrerd defined in "commands.asm"...processed by "input.asm"
    ; 3.check cmd    ; parsed by "input.asm"


    ; 4. give inputs for operations processed by 
    ; "input.asm" -> to "arthemetic.asm", "history.asm", "system.asm" and so on...

    ; 5.check input by concerned external code label   
    ; 6.run processess (if exit jmp to 7) by external code label
    ; 7.show output of output recieved from external code label/ from external code label


    ; 8.return to main
    ; 9.terminate programm