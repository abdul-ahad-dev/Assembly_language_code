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
	mov ecx, input1
	mov edx, 5
    int 0x80
    
	mov eax, 4
	mov ebx, 1
	mov ecx, msg2
	mov edx, len2
    int 0x80
    
	mov eax, 3
	mov ebx, 0
	mov ecx, input2
	mov edx, 5
    int 0x80
    
    mov al, [input1]
    sub al, '0'
    
    mov bl, [input2]
    sub bl, '0'
    
    div bl
    add al, '0'
    mov [result], al

    
	mov eax, 4
	mov ebx, 1
	mov ecx, msg3
	mov edx, len3
    int 0x80
    
	mov eax, 4
	mov ebx, 1
	mov ecx, result
	mov edx, 1
    int 0x80
    
    
    mov eax, 1
    xor ebx, ebx
    int 0x80
    
    
section	.data

msg1 db	'Enter first number:  '
len1 equ	$ - msg1

msg2 db	'Enter second number:  '
len2 equ	$ - msg2

msg3 db	'Division of two num is:  '
len3 equ	$ - msg3	

section .bss
input1 resb 1
input2 resb 1
result resb 1