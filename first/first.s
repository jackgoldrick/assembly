section .data

section .text

; Entry point
; start is literally the start of the program
; global _start is the entry point of the program
; _start is a label that is used to indicate the start of the program
; _start is a global label, which means that it can be accessed from other files


global _start

_start:
    ; MOV Destination, Source
    ; mov is an instruction that moves data from one place to another
    ; EAX is a register
    ; MOV EAX, 1 moves the value 1 into the EAX register
    ;  asking gdb for the value of EAX will return 1
    ; MOV EAX, 1 with 80h is a system call that is used to exit the program
    ; 1 is the exit system call number
    MOV eax, 1
    ; MOV EBX, 1 moves the value 1 into the EBX register
    ;  with 1 is the exit status of the program
    MOV ebx, 1
    ; INT 80h is a software interrupt that is used to call the kernel
    ; 80h is the interrupt number
    ;  h is used to indicate that the number is in hexadecimal
    INT 80h