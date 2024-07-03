section	.text
	global _start       
_start: 
    mov eax, 4
    mov ebx, 1
    mov ecx, m1
    mov edx, ml1
    int 0x80
    
    mov eax, 4
    mov ebx, 1
    mov ecx, m2
    mov edx, ml2
    int 0x80
    
    mov eax, 4
    mov ebx, 1
    mov ecx, m3
    mov edx, ml3
    int 0x80
    
    mov eax, 4
    mov ebx, 1
    mov ecx, m4
    mov edx, ml4
    int 0x80
   
    mov eax, 3
    mov ebx, 0
    mov ecx, choice
    mov edx, 4
    int 0x80
    
    mov eax, 4
    mov ebx, 1
    mov ecx, nm1
    mov edx, nml1
    int 0x80
   
    mov eax, 3
    mov ebx, 0
    mov ecx, num1
    mov edx, 4
    int 0x80
    
    mov eax, 4
    mov ebx, 1
    mov ecx, nm2
    mov edx, nml2
    int 0x80
   
    mov eax, 3
    mov ebx, 0
    mov ecx, num2
    mov edx, 4
    int 0x80
    
    mov eax, [choice]
    
    cmp eax, '1'
    je per_addition
    
    cmp eax, '2'
    je per_subtraction
    
    cmp eax, '3'
    je per_multiplication
    
    
    
    addition:
    call per_addition
	
	mov eax, 4
    mov ebx, 1
    mov ecx, pm1
    mov edx, pml1
    int 0x80
    
	mov eax, 4
    mov ebx, 1
    mov ecx, result
    mov edx, 1
    int 0x80
    
    mov eax, 1
    xor ebx, eax
    int 0x80
    
    subtraction:
    call per_subtraction
	
	mov eax, 4
    mov ebx, 1
    mov ecx, pm2
    mov edx, pml2
    int 0x80
    
	mov eax, 4
    mov ebx, 1
    mov ecx, result
    mov edx, 1
    int 0x80
    
    mov eax, 1
    xor ebx, eax
    int 0x80
    
    multiplication:
    call per_multiplication
	
	mov eax, 4
    mov ebx, 1
    mov ecx, pm2
    mov edx, pml2
    int 0x80
    
	mov eax, 4
    mov ebx, 1
    mov ecx, result
    mov edx, 1
    int 0x80
    
    mov eax, 1
    xor ebx, eax
    int 0x80
    
    per_addition:
    mov eax, [num1]
	sub eax, '0'
		
	mov ebx, [num2]
	sub ebx, '0'
		
	add eax, ebx
	add eax, '0'
	mov [result], eax
	int 0x80
	ret
	
	per_subtraction:
    mov eax, [num1]
	sub eax, '0'
		
	mov ebx, [num2]
	sub ebx, '0'
		
	sub eax, ebx
	add eax, '0'
	mov [result], eax
	int 0x80
	ret
	
	per_multiplication:
    mov eax, [num1]
	sub eax, '0'
		
	mov ebx, [num2]
	sub ebx, '0'
		
	imul eax, ebx
	add eax, '0'
	mov [result], eax
	int 0x80
	ret
    

section	.data

m1	db	'1. Addition',0xa
ml1	equ	$ - m1

m2	db	'2. Subtraction',0xa
ml2	equ	$ - m2

m3	db	'3. Multiplication',0xa
ml3	equ	$ - m3

m4	db	'Enter choice: '
ml4	equ	$ - m4

nm1	db	'Enter first number: '
nml1	equ	$ - nm1

nm2	db	'Enter second number: '
nml2	equ	$ - nm2

pm1	db	'Addition: '
pml1	equ	$ - pm1

pm2	db	'Subtraction: '
pml2 equ $ - pm2

pm3	db	'Multiplication: '
pml3 equ $ - pm3


section .bss
choice resb 4
num1 resb 4
num2 resb 4
result resb 1
