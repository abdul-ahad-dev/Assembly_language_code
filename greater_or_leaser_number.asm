section	.text
	global _start       
_start: 
    mov eax, 4
    mov ebx, 1
    mov ecx, m1
    mov edx, m1_len
    int 0x80
    
    mov eax, 3
    mov ebx, 0
    mov ecx, num1
    mov edx, 10
    int 0x80
    
    mov eax, 4
    mov ebx, 1
    mov ecx, m2
    mov edx, m2_len
    int 0x80
    
    mov eax, 3
    mov ebx, 0
    mov ecx, num2
    mov edx, 10
    int 0x80
    
    mov eax, [num1]
    mov ebx, [num2]

    cmp eax, ebx 
    jg greater 
    jl leaser 
    jmp equal
    
    
    mov eax, 1
    xor ebx, eax
    int 0x80
    
    
greater:
mov eax, 4
mov ebx, 1 
mov ecx, greater_msg 
mov edx, greater_msg_len 
int 0x80

mov eax, 1 ; exit system call
mov ebx, 0 ; exit status
int 0x80 ; call kernel 



    
leaser:
mov eax, 4 
mov ebx, 1 
mov ecx, not_greater_msg 
mov edx, not_greater_msg_len 
int 0x80 

mov eax, 1 ; exit system call
mov ebx, 1 ; exit status
int 0x80 ; call kernel 

    
equal:
mov eax, 4
mov ebx, 1 
mov ecx, equal_msg 
mov edx, equal_msg_len 
int 0x80 

mov eax, 1 ; exit system call
mov ebx, 2 ; exit status
int 0x80 ; call kernel 
    

section	.data

m1	db	'Enter first number: '
m1_len	equ	$ - m1

m2	db	'Enter second number: '
m2_len	equ	$ - m2

greater_msg db 'The first number is greater.'
greater_msg_len equ $ - greater_msg

not_greater_msg db 'The second number is greater'
not_greater_msg_len equ $ - not_greater_msg

equal_msg db 'Both number are equal'
equal_msg_len equ $ - equal_msg


section .bss
num1 resb 10
num2 resb 10