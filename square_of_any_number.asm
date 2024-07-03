section	.text
	global _start 
          
_start:                     
	mov	eax, 4	    
	mov	ebx, 1	    
	mov	ecx, msg   
	mov	edx, len    
	int	0x80       
	
	mov eax, 3
	mov ebx, 0
	mov ecx, input
	mov edx, 1
	int 0x80
	
	call square
	
	mov	eax, 4	   
	mov	ebx, 1	   
	mov	ecx, msg1   
	mov	edx, len1    
	int	0x80       
	
	mov eax, 4
	mov ebx, 1
	mov ecx, input
	mov edx, 1
	int 0x80
	
	mov	eax, 1	   
	xor ebx, eax
	int	0x80      
	
	
	square:
	mov eax, [input]
	sub eax, '0'
	
	imul eax
	
	add eax, '0'
	mov [input], eax
	ret 
	
	mov eax, 1
	xor ebx, eax
	int 0x80

section	.data

msg	db	'Enter number: '
len	equ	$ - msg			

msg1 db	'Square is: '	
len1 equ	$ - msg1	

section .bss
input resb 1
