	; Initialisation de la pile au début du programme
	.ORIG x3000
	pile: .FILL stackend 
	main: LD R6,pile ; Équivalent à LEA R6,stackend
	LEA R1,chaine 	      ; Chargement dans R1 de l'adresse de la chaîne
	LD R2,caract
	JSR rindex
	BR end

rindex:
	ADD R6,R6,#-2;
	STR R1,R6,#0;
	STR R1,R6,#1;
	AND R0, R0, #0;
    	AND R4, R4, #0;

loop :	LDR R3, R1, #0
	BRz fin

	NOT R5, R2
	ADD R5, R5, #1
    	ADD R5, R3, R5
	BRz majR4
	ADD R1, R1, #1
	BRnzp loop


majR4:
    	ADD R4, R1, #0
	ADD R1, R1, #1
    	BRnzp loop

fin:
    	LDR R1,R6,#0;
	LDR R1,R6,#1;
	ADD R6,R6,#2;
	ADD R0, R4, #0
	RET

end:
	NOP
	HATL;

	; Réservation de l’espace pour la pile
 	
 	.BLKW x00A ; Taille de la pile : 256 octets

	stackend: ; Adresse de mot mémoire suivant

	chaine: .STRINGZ "Hello"
	caract:	.FILL x6C 	; caract = 'l'     	
	.END