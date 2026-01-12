***WORKFLOW***

MiniOS/
│
├── build/             ; output folder for .OBJ files and minios.exe
│   ├── *.obj
│   └── minios.exe
│
├── src/               ; all source assembly files
│   ├── main.asm        ; Entry point, command loop, dispatcher
│   ├── input.asm       ; Keyboard input & parsing
│   ├── command.asm     ; command matching & dispatch
│   ├── screen.asm      ; cls, cursor, echo
│   ├── arithmetic.asm  ; add, sub, mul, div, cmp
│   ├── system.asm      ; time, date, delay, beep
│   ├── history.asm     ; command history
│   └── utils.asm       ; helper procedures (string compare, convert)
│
├── include/
│   └── minios.inc      ; shared declarations (EXTERN / PUBLIC)
│
└── scripts/
    └── build.bat       ; batch file to assemble and link project



🔹 command.asm → Policy / Control

Knows which commands exist
Decides which procedure to call
Contains NO string logic
Contains NO number conversion

🔹 utils.asm → Mechanism / Helpers

String compare (strcmp)
String length
ASCII → number (atoi)
Number → ASCII (itoa)
Tokenization (optional)


# NOTE : REMAKE ENTIRE PROJECT