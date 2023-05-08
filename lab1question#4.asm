.MODEL small
.STACK 100h
.DATA
Password DB 'ATENA'   ; The password to compare with
Message1 DB 'Enter password: $'
Message2 DB '..Access granted.$'
Message3 DB '..Access denied.$'
InputString DB 6 DUP (?) 

.CODE
Main PROC
  MOV AX, @DATA
  MOV DS, AX

    ; Display message to enter password
  MOV AH, 09h
  MOV DX, OFFSET Message1
  INT 21h

    ; Read password from keyboard
  CALL read

    ; Compare input string with password
  MOV BX, OFFSET Password
  MOV SI, OFFSET InputString
  XOR CX, CX
CheckLoop:
  MOV AL, [BX]
  CMP AL, [SI]
  JNE AccessDenied
  INC BX
  INC SI
  INC CX
  CMP CX, 5
  JNZ CheckLoop

    ; If all characters match, access is granted
  MOV AH, 09h
  MOV DX, OFFSET Message2
  INT 21h
  JMP EndProgram

AccessDenied:
    ; If any character does not match, access is denied
  MOV AH, 09h
  MOV DX, OFFSET Message3
  INT 21h

EndProgram:
  MOV AH, 4Ch
  INT 21h
Main ENDP

read PROC
  MOV CX, 5     
  MOV SI, 0    

ReadLoop:
    ; Read a character from the keyboard
  MOV AH, 01h    ; Set AH to 01h to read a character from the keyboard
  INT 21h        ; Call the DOS.ReadChar function to read a character
  CMP AL, 0Dh    ; Check if the character is a carriage return
  JE ReadDone   
  MOV BX, SI     
  MOV [InputString+BX], AL  
  INC SI        
  LOOP ReadLoop  

ReadDone:
  MOV [InputString+BX+1], '$'  ; Add a null terminator at the end of the string
  RET
read ENDP

END Main