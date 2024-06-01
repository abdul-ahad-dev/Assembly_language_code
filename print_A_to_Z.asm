section	.text
	global _start      
_start: 
    mov ecx, 26
    mov eax, 'A'

    myloop:
    mov [num],eax
    mov eax, 4
    mov ebx, 1
    push ecx
    mov ecx, num
    mov edx, 1
	int	0x80 
	
	mov eax, 4
	mov ebx, 1
	mov ecx , m
	mov edx, l
	int 0x80
	
	mov eax, [num]
	sub eax, 'A'
	inc eax
	add eax, 'A'
	pop ecx
	
	
	loop myloop
	mov	eax, 1	    
	int	0x80        

section	.data
m db '', 0xa
l equ $ - m
section .bss
num resb 1