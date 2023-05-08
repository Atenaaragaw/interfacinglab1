org 100h

  lea si,y
  mov al,[si] 
  lea si,x
  mov bl,[si]

loopStart: 
  cmp bl,0 
  jnz c
  hlt
c: 
  mul bl 
  dec bl 
  loop loopStart  
x db 4
y db 1

