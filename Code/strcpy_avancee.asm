	.ORIG x3000
	; Initialisation de la pile au début du programme
	pile: .FILL stackend 
main: 	LD R6,pile ; Équivalent à LEA R6,stackend
	LEA R1,chaine 	      ; Chargement dans R1 de l'adresse de la chaîne
	LEA R2,copie
	JSR strcpy
	BR end

strcpy:
	ADD R6,R6,#-2;
	STR R1,R6,#0;
	STR R2,R6,#1;

loop:	LDR R3, R1, #0        ; Charger le caractère courant de la source
	BRz fin		;
    	STR R3, R2, #0        ; Stocker le caractère dans la destination
    	ADD R1, R1, #1        ; Incrémenter l'adresse de la source
    	ADD R2, R2, #1        ; Incrémenter l'adresse de la destination
    	BRnzp loop 

fin : 	
	LDR R1,R6,#0;
	LDR R2,R6,#1;
	ADD R6,R6,#2;
	RET;
end:
	NOP;
	HALT;

	; Réservation de l’espace pour la pile
 	.BLKW x00A ; Taille de la pile : 256 octets

	stackend: ; Adresse de mot mémoire suivant

	chaine:	.STRINGZ "Hello World"
	copie:	.STRINGZ ""		;.BLKW 10 

	.END