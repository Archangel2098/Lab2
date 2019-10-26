	.ORIG X3000

;SORT PROGRAM
;CONNOR SIMPSON
;CWS2679
;DUE 10/26/2019

	LD	R0	POINTER		
	ADD	R0	R0	#-1	;CREATE A COUNTER FOR THE PROGRAM

CYCLE	ADD	R0	R0	#2	;INCREMENT THE COUNTER

	LDR 	R7	R0 	#-1	;CHECK THE DATA IN EVENT

	BRZ 	FINISH			;IF NO EVENTS, END

	LD	R5	POINTER		;START A POINTER FOR CHECK
		
	LDR	R3	R0	#-1	
	LDR	R1	R0	#0	;LOAD THE CURRENT EVENT INTO R1 AND R3

	NOT	R1	R1
	ADD	R1	R1	#1	;MAKE R1 NEGATIVE TO CHECK EASIER

CHECK	LDR	R4	R5	#0	
	LDR	R2	R5	#1	;LOAD THE EVENT TO CHECK AGAINST

	ADD	R5	R5	#2	;INCREMENT R5

	ADD	R7	R1	R2	;CHECK WHICH DATE IS LARGER
	BRN	PLACE			;IF THE NUMBER IS BIGGER, SHIFT EVERYTHING DOWN
	BRP	CHECK			;IF THE NUMBER IS SMALLER, KEEP CHECKING
	BRZ	CYCLE			;IF THE NUMBER IS EQUAL, IT IS THE SMALLEST IN THE LIST, START A NEW CYCLE

PLACE	NOT	R1	R1
	ADD	R1	R1	#1	;MAKE R1 POSITIVE AGAIN

SHIFT	STR	R3	R0	#-1
	STR	R1	R0	#0	;STORE THE NEW DATE WHERE IT IS SUPPOSED TO BE
	
	ADD	R1	R2	#0
	ADD	R3	R4	#0	;SHIFT THE REGISTERS

	ADD	R0	R0	#2	;INCREASE THE POINTER

	LDR	R4	R0	#-1	
	LDR	R2	R0	#0	
	BRZ	CYCLE			;LOAD THE NEW DATA IN, LEAVE IF YOU HAVE REACHED THE END
	
	BRP	SHIFT			;LOOP

FINISH	HALT

POINTER .FILL X4000

	.END