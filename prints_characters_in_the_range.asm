section .text
   global _start

_start:
   ; Print first message and read first input
   mov eax, 4
   mov ebx, 1
   mov ecx, msg1
   mov edx, len1
   int 0x80

   mov eax, 3
   mov ebx, 0
   mov ecx, input_1
   mov edx, 4
   int 0x80

   ; Print second message and read second input
   mov eax, 4
   mov ebx, 1
   mov ecx, msg2
   mov edx, len2
   int 0x80

   mov eax, 3
   mov ebx, 0
   mov ecx, input_2
   mov edx, 4
   int 0x80

   ; Convert input characters to integers by subtracting
   mov eax, [input_1]
   sub eax, [input_1]

   mov ebx, [input_2]
   sub ebx, [input_1]
    

   ; Calculate number of iterations
   sub ebx, eax
   mov [input_2], ebx

   ; Setup loop
   mov ecx, [input_2]
   mov eax, [input_1]

myloop:
   ; Print current character
   mov [num], eax
   push ecx
   mov eax, 4
   mov ebx, 1
   mov ecx, num
   mov edx, 1
   int 0x80

   ; Prepare for next iteration
   mov eax, [num]
   sub eax, [input_1]
   inc eax      
   add eax, [input_1]  
   pop ecx
   loop myloop

   ; Exit
   mov eax, 1
   int 0x80

section .data
msg1 db 'Enter the alphabet letter from you want to start: '
len1 equ $ - msg1

msg2 db 'Enter the alphabet letter from you want to end: '
len2 equ $ - msg2

section .bss

num resb 4
input_1 resb 4
input_2 resb 4