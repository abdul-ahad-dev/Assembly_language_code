section .text
    global _start      
_start:      
    
    mov ecx, len       ; Set ECX to the length of the string
    mov esi, s1        ; Set ESI to point to the source string (s1)
    mov edi, s2        ; Set EDI to point to the destination buffer (s2)
    
    loop1:
    lodsb              ; Load a byte from [ESI] into AL and increment ESI
    add al, 2          ; Add 2 to the byte in AL
    stosb              ; Store the byte in AL to [EDI] and increment EDI
    
    loop loop1         ; Decrement ECX and loop if ECX != 0
    
    ; Printing the modified string
    mov eax, 4         ; Syscall number for sys_write (4)
    mov ebx, 1         ; File descriptor 1 (stdout)
    mov ecx, s2        ; Pointer to the modified string (s2)
    mov edx, len       ; Length of the string to print
    int 0x80           ; Make the syscall
    
    ; Exit the program
    mov eax, 1         ; Syscall number for sys_exit (1)
    xor ebx, ebx       ; Exit status 0
    int 0x80           ; Make the syscall

section .data

s1 db 'Message', 0  ; Source string (null-terminated)
len equ $ - s1 - 1     ; Length of the source string (excluding the null terminator)

section .bss

s2 resb 10             ; Buffer for the modified string (10 bytes)
