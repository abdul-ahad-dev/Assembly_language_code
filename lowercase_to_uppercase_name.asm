section .text
    global _start      
_start:      
    
    mov eax, 4          
    mov ebx, 1          
    mov ecx, msg   
    mov edx, msg_len    
    int 0x80        
    
   
    mov eax, 3        
    mov ebx, 0  
    mov ecx, s1  
    mov edx, 16   
    int 0x80       

    
    mov [len], eax

    
    mov ecx, [len]     
    mov esi, s1   
    mov edi, s2   
    
loop1:
    lodsb             
    sub al, 32        
    stosb            
    
    loop loop1         
    
    cld
    rep movsb
    
    
    mov eax, 4         
    mov ebx, 1     
    mov ecx, s2     
    mov edx, [len]     
    int 0x80     
    
   
    mov eax, 1        
    xor ebx, ebx       
    int 0x80         
    
section .data

msg db "Enter any message: "
msg_len equ $ - msg

section .bss

s1 resb 10
s2 resb 10            
len resd 1           
