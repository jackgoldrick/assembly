section .data
    file_path db'vars.txt', 0
    floatBuffer dd 2
    len_name equ $-file_path
    msg_done db 'Written to file', 0xa
    len_done equ $-msg_done

section .bss
    fd_out resb 1
    fd_in  resb 1
    info resb  26

section .text
    %define SYS_OPEN 0x05
    %define SYS_READ 0x03
    %define SYS_WRITE 0x04
    %define SYS_CLOSE 0x06
    %define SYS_EXIT 0x01

global _start

_start:
    ; open text file with sys_open
    mov eax, SYS_OPEN
    mov ebx, file_path
    mov ecx, 0 ; read only
    mov edx, 0 ; mode
    int 80h

    ; Check if the file was opened successfully
    test eax, eax
    js .error             ; If eax is negative, there's an error
    mov [fd_in], eax      ; Store file descriptor

    ; read text file with sys_read
    mov eax, SYS_READ
    mov ebx, [fd_in] ; file descriptor is already in [fd_in] from the SYS_Read call
    mov ecx, info
    mov edx, 26
    int 80h

    ; close the file
    mov eax, SYS_CLOSE
    mov ebx, [fd_in]
    int  0x80

    ; print the info
    mov eax, SYS_WRITE
    mov ebx, 1
    mov ecx, info
    mov edx, 26 ; change this to the actual number of bytes read from the file
    int 80h

    mov eax, SYS_EXIT
    mov ebx, 0
    int 80h


.error:
    ; Handle errors (e.g., print an error message or exit)
    ; Here you can add code to handle errors if desired
    mov eax, SYS_EXIT
    mov ebx, 1            ; Return code 1 for error
    int 0x80