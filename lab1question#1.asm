ORG 100h 

  lea si, x
  mov al, [si]
  lea si,y
  mov bl,[si]
  cmp al,bl
  jg label1
    dd:
  sub bl,1
  jmp stop

label1:

  add al,1
  jmp dd 
stop:
  ret
      x db 10 
      y db 7