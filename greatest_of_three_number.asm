;check three number which one is greater

section	.text
	global _start       
_start:                    
	mov	eax, 4	    
	mov	ebx, 1	    
	mov	ecx, msg1   
	mov	edx, len1    
	int	0x80   
	
	mov eax, 3
	mov ebx, 0
	mov ecx, inp1
	mov edx, 4
	int 0x80
	
	mov	eax, 4	    
	mov	ebx, 1	    
	mov	ecx, msg2   
	mov	edx, len2    
	int	0x80   
	
	mov eax, 3
	mov ebx, 0
	mov ecx, inp2
	mov edx, 4
	int 0x80
	
	mov	eax, 4	    
	mov	ebx, 1	    
	mov	ecx, msg3   
	mov	edx, len3   
	int	0x80   
	
	mov eax, 3
	mov ebx, 0
	mov ecx, inp3
	mov edx, 4
	int 0x80
	
	mov eax, [inp1]
	mov ebx, [inp2]
	mov ecx, [inp3]
	
	cmp eax, ebx
	jg num1_great
	
	cmp ebx, ecx
	jg num2_great
	
	
	mov	eax, 4	    
	mov	ebx, 1	    
	mov	ecx, num3   
	mov	edx, l3   
	int	0x80 
	
	
	mov	eax, 1
	xor ebx, eax
	int	0x80
	
	
	num1_great:
	cmp ebx, ecx
	jg num1_greater
	
	num1_greater:
	mov	eax, 4	    
	mov	ebx, 1	    
	mov	ecx, num1   
	mov	edx, l1   
	int	0x80 
	
	mov	eax, 1
	xor ebx, eax
	int	0x80
	
	
	
	num2_great:
	cmp ebx, eax
	jg num2_greater
	
	num2_greater:
	mov	eax, 4	    
	mov	ebx, 1	    
	mov	ecx, num2   
	mov	edx, l2   
	int	0x80 
	
	mov	eax, 1
	xor ebx, eax
	int	0x80
	
	
	       

section	.data

msg1 db	'Enter first number: '
len1 equ	$ - msg1		

msg2 db	'Enter second number: '
len2 equ	$ - msg2		

msg3 db	'Enter thrid number: '
len3 equ	$ - msg3

num1 db	'first number is greater'
l1 equ	$ - num1

num2 db	'second is greater'
l2 equ	$ - num2

num3 db	'third is greater'
l3 equ	$ - num3

section .bss

inp1 resb 4
inp2 resb 4
inp3 resb 4