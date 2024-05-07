; Print user input

section	.text
	global _start       
_start:                     
	mov eax, 4
	mov ebx, 1
	mov ecx, m1
	mov edx, l1
    int 0x80
    
	mov eax, 3
	mov ebx, 0
	mov ecx, input
	mov edx, 10
    int 0x80
    
	mov eax, 4
	mov ebx, 1
	mov ecx, m2
	mov edx, l2
    int 0x80
    
	mov eax, 4
	mov ebx, 1
	mov ecx, input
	mov edx, 10
    int 0x80
    
    mov eax, 1
    xor ebx, eax
    int 0x80
    
section	.data

m1	db	'Enter your name: '
l1	equ	$ - m1	

m2 db 'Name is: '
l2 equ $ - m2

section .bss

input resb 10