; This Tutorial is about storing numerical data

section .data
    ; Define a variable called 'myVar' and store the value 42 in it
    ;  DB is define byte, which means that the variable is 1 byte long
    ;  DW is define word, which means that the variable is 2 bytes long
    ;  DD is define doubleword, which means that the variable is 4 bytes long (32 bits)
    ;  DQ is define quadword, which means that the variable is 8 bytes long (64 bits)
    ;  DT is define ten bytes, which means that the variable is 10 bytes long (80 bits)
    ;  D? is define uninitialized data, which means that the variable is not initialized
    ;  These vars can be used to store numerical data, characters, strings, etc.
    myVar DB 42
    num DD 5

section .text
    
global _start

_start:

    mov eax, 1
    ; square brackets are used to access the value stored in a variable
    ;  [myVar] is used to access the value stored in the variable 'myVar'
    ;  [num] is used to access the value stored in the variable 'num'
    ;  in gdb '$' is used to represent the address of a variable
    
    mov ebx, [num]
    int 80h
