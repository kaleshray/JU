.MODEL SMALL
.STACK 100H
.DATA
VAR1 DB "FIBONACCI SERIES:",10,13,"$"
T1 DB 00H
T2 DB 01H
T3 DB 00H
.CODE
MAIN PROC
 MOV AX, @DATA
 MOV DS, AX
 MOV DX, OFFSET VAR1
 MOV AH, 09H
 INT 21H
 MOV DL, T2
 ADD DL, 30H
 MOV AH, 02H
 INT 21H
FIBO:
 MOV CX, 10
L1:
 PUSH CX
 MOV DL, 10
 MOV AH, 02H
 INT 21H
 MOV DL, 13
 MOV AH, 02H
 INT 21H
 MOV BL, T1
 ADD BL, T2
 MOV T3, BL
 MOV AH, 0
 MOV AL, T3
 MOV DX, 0
 MOV BX, 10
 MOV CX, 0
L2:
 DIV BX
 PUSH DX
 MOV DX, 0
 MOV AH, 0
 INC CX
 CMP AX, 0
 JNE L2
L3:
 POP DX
 ADD DX, 30H
 MOV AH, 02H
 INT 21H
 LOOP L3
 MOV BL, T2
 MOV T1, BL
 MOV BL, T3
 MOV T2, BL
 POP CX
 LOOP L1
 MOV AH, 4CH
 INT 21H
MAIN ENDP
END MAIN
