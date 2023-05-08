org 100h
   
 lea si,message
 mov ah,2
 mov cx,21
prompt_disp:
 mov dl,[si]
 int 21h
 inc si
 loop prompt_disp

 lea si,input
 mov ah,1
 mov cx,2
input_disp: 
 int 21h 
 mov [si],al
 inc si
 loop input_disp

 lea si,input
 mov al,[si] 
 sub al,30h
 inc si
 mov ah, [si]
 sub ah,30h 
 mov dl,ah
 mov ah,0
 mov bl,10
 mul bl
 add al,dl 

 mov bl,9
 mul bl
 mov bl,5
 div bl
 add al,32

 mov ch,ah
 mov ah,0
 mov bl,100
 cmp bl,al
 jge div
 mov bl,10
 div bl
 add al,30h
 add ah,30h
 lea si,result
 inc si 
 mov [si],al
 inc si
 mov [si],ah
 jmp print_result

 div:
 mov bl,100
 div bl
 add al,30h
 lea si,result
 mov [si],al
 mov al,ah
 mov ah,0
 mov bl,10
 div bl
 add ah,30h
 add al,30h
 inc si
 mov [si],al
 inc si
 mov [si],ah

print_result: 

  
 inc si
 inc si
 mov al,ch
 mov bl,10
 mul bl
 mov bl,5
 div bl
 add al,30h
 mov [si],al
 mov ah,2
 mov dl,'=' 
 int 21h
 lea si,result
 mov al,[si]
 mov ah,00h
 mov bl,30h
 cmp al,bl
 jg print_prompt
 inc si
 mov ah,2
 mov cx,5
loop2:
 mov dl,[si]
 int 21h
 inc si
 loop loop2
 jmp exit: 

print_prompt:
 
 mov ah,2
 mov cx,6
loop1:
 mov dl,[si]
 int 21h
 inc si
 loop loop1


exit:

 ret

input db '0','0'
result db '0','0','0','.','0','0' 
message db "Enter the temp in 0C:"





