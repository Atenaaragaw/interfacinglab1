read PROC 
    
  MOV CX, 5  
  MOV SI, 0    

ReadLoop:
    
  MOV AH, 01h 
  INT 21h      
  CMP AL, 0Dh   
  JE Done   
  MOV BX, SI  
  MOV [InputString+BX], AL
  INC SI 
  LOOP ReadLoop

Done:

  MOV [InputString+BX+1], '0'
  RET 
  
read ENDP

InputString DB 6 DUP (0)