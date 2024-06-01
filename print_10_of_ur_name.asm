section	.text
	global _start      
_start: 
    mov ecx, 9

    myloop:
    mov eax, 4
    mov ebx, 1
    push ecx
    mov ecx, num
    mov edx, len
	int	0x80 
	
	
	mov eax, [num]
	pop ecx
	
	
	loop myloop
	mov	eax, 1	    
	int	0x80        

section	.data
num db "ABDUL AHAD", 0xa
len equ $ - num