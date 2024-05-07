; Check two conditional which is true or false

section	.text
	global _start       
_start: 

    

    mov eax, 4
    mov ebx, 1
    mov ecx, m1
    mov edx, m1_len
    int 0x80
    
    mov eax, 4
    mov ebx, 1
    mov ecx, m2
    mov edx, m2_len
    int 0x80
    
    mov eax, 4
    mov ebx, 1
    mov ecx, m3
    mov edx, m3_len
    int 0x80
    
    mov eax, 3
    mov ebx, 0
    mov ecx, output
    mov edx, 1
    int 0x80
    
    mov eax, '1'
    cmp [output], eax
    je hello
    
    call name 
    
    mov eax, 1
    xor ebx, eax
    int 0x80
    
    hello:
    mov	eax, 4
    mov	ebx, 1
    mov	ecx, d1
	mov	edx, d1_len 
	int 0x80
	
	mov eax, 1
    xor ebx, eax
    int 0x80
    
    
    name:
    mov eax, 4
    mov ebx, 1
    mov ecx, d2
    mov edx, d2_len
    int 0x80
    ret
    
    
    
    mov eax, 1
    xor ebx, eax
    int 0x80 
    
    
    

section	.data

m1	db	'Enter Selection',0xa
m1_len	equ	$ - m1

m2	db	'1. Hello',0xa
m2_len	equ	$ - m2

m3	db	'2. Name',0xa
m3_len	equ	$ - m3

d1	db	'Hello, world!',0xa	
d1_len	equ	$ - d1	

d2	db	'Abdul Ahad',0xa
d2_len	equ	$ - d2

section .bss
output resb 1