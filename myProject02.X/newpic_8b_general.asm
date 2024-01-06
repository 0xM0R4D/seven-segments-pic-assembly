LIST P = 18F4550
include<p18f4550.inc>
counter EQU 0x22
;mul EQU 0x20
ORG 0x00

    MOVLW 0x00;portD -> output
    MOVWF TRISD
    MOVLW 0x09
    MOVWF counter

 
LOOP 
    MOVF counter, w 
    CALL applySevenSegment
    MOVWF PORTD
    DECFSZ counter, F  ; cnt--, if(counter=0)skip nxt line 
    GOTO LOOP 
    GOTO $     ; end loop 

applySevenSegment 
    ADDWF counter,w
    ADDWF PCL,F
    RETLW B'0111111' ;0
    RETLW B'0000110' ;1
    RETLW B'1011011' ;2
    RETLW B'1001111' ;3
    RETLW B'1100110' ;4
    RETLW B'1101101' ;5
    RETLW B'1111101' ;6
    RETLW B'0000111' ;7
    RETLW B'1111111' ;8
    RETLW B'1101111' ;9
END