***WORKFLOW***

MiniOS/
│
├── build/                     ; Output folder for assembled and linked files
│   ├── *.obj                  ; Object files for each module
│   └── minios.exe             ; Final executable
│
├── src/                       ; All source assembly files
│   ├── main.asm               ; Entry point, command loop, dispatcher
│   ├── input.asm              ; Keyboard input & parsing
│   ├── command.asm            ; Command matching & individual command procedures
│   ├── dispatcher.asm         ; Maps command IDs to their corresponding procedures
│   ├── screen.asm             ; cls, cursor, echo
│   ├── arithmetic.asm         ; add, sub, mul, imul, div, idiv, cmp
│   ├── system.asm             ; time, date, delay, beep
│   ├── history.asm            ; command history save/show
│   └── utils.asm              ; helper procedures: strcmp, atoi, itoa, single/double input, print_result/div
│
├── include/                   ; Shared declarations
│   └── minios.inc             ; EXTERN/PUBLIC declarations for all modules
│
└── scripts/                   ; Build automation
    └── build.bat              ; Assemble & link all modules into minios.exe




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