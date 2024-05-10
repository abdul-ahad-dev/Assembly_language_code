section	.text
	global _start    
_start:       
	mov	edx, len 
	mov	ecx, msg
	mov	ebx, 1
	mov	eax, 4
	int	0x80
	
	mov eax, 3
	mov ebx, 0
	mov ecx, radius
	mov edx, 1
	int 0x80
	
	call circumference
	
	mov eax, 4
	mov ebx, 1
	mov ecx, msg1
	mov edx, len1
	int 0x80
	
	mov eax, 4
	mov ebx, 1
	mov ecx, radius
	mov edx, 1
	int 0x80
	
	
	
	mov	eax, 1
	xor ebx, eax
	int	0x80 
	
	circumference:
	mov eax, [radius]
	sub eax, '0'
	
	mov ebx, 6
	
	imul eax, ebx
	add eax, '0'
	mov [radius], eax
	ret

section	.data

msg	db	'Enter radius of circle: '
len	equ	$ - msg	
msg1	db	'Circumference of circle: '	
len1	equ	$ - msg1

section .bss
radius resb 1