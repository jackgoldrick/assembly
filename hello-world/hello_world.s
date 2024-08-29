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
    ; Define a variable called 'msg' and store the string "Hello, World!" in it
    msg db "Hello, World!", 14, 10, 0 ; 14 is the length of the string, 10 is the ASCII value of newline, 0 is the null terminator
    helloLen  equ $-msg ; $ is used to represent the address of the current line

    

section .text
    
global _start

_start:
    ; Sys write
    mov eax, 4
    mov ebx, 1 ; file descriptor 1 is stdout
    mov ecx, msg ; address of the string
    mov edx, helloLen ; length of the string
    int 80h ; call the kernel

    ; square brackets are used to access the value stored in a variable
    ;  [myVar] is used to access the value stored in the variable 'myVar'
    ;  [num] is used to access the value stored in the variable 'num'
    ;  in gdb '$' is used to represent the address of a variable
    ; sys_exit
    mov eax, 1
    mov ebx, 0
    int 80h
;  nasm -f elf -o hello.o hello_world.s 
;  ld -m elf_i386 hello.o -o hello