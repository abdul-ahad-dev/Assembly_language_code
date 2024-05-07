; Covert small letter to capital letter

section	.text
	global _start       
_start:                     
	mov eax, 4
	mov ebx, 1
	mov ecx, msg1
	mov edx, len1
    int 0x80
    
	mov eax, 3
	mov ebx, 0
	mov ecx, input
	mov edx, 1
    int 0x80
    
    mov eax, [input]
    sub eax, 32
    mov [char], eax
    int 0x80
    
	mov eax, 4
	mov ebx, 1
	mov ecx, msg2
	mov edx, len2
    int 0x80
    
	mov eax, 4
	mov ebx, 1
	mov ecx, char
	mov edx, 1
    int 0x80
    
    mov eax, 1
    xor ebx, eax
    int 0x80
    
section	.data

msg1 db	'Enter small Letter:  '
len1 equ	$ - msg1

msg2 db	'After convert into uppercase:  '
len2 equ	$ - msg2	

section .bss
char resb 1
input resb 1