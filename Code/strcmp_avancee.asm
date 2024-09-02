	; Initialisation de la pile au début du programme
	.ORIG x3000

	pile: .FILL stackend 
main: 	LD R6,pile ; Équivalent à LEA R6,stackend
	LEA R1,chaine1 	    ; Chargement dans R1 de l'adresse de la chaîne1
	LEA R2,chaine2 	    ; Chargement dans R2 de l'adresse de la chaîne2
    	JSR strcmp
	BR end

strcmp:
	ADD R6,R6,#-2
	STR R1,R6,#0;
	STR R2,R6,#1;
	AND R0, R0, #0

loop:
    	LDR R3, R1, #0        ; Charger le caractère courant de la première chaîne
    	BRz difference1
    	LDR R4, R2, #0        ; Charger le caractère courant de la deuxième chaîne
    	BRz difference2
    	ADD R1, R1, #1        ; Incrémenter le pointeur de la première chaîne
    	ADD R2, R2, #1        ; Incrémenter le pointeur de la deuxième chaîne
    	NOT R5, R3
    	ADD R5, R5, #1
   	ADD R5, R4, R5        ; Comparer les deux caractères
    	BRz loop

difference1:
	LDR R4, R2, #0
	NOT R5, R3
    	ADD R5, R5, #1
    	ADD R5, R4, R5
	BRp chaine1plusgrand
	BRz identique
difference2:
	LDR R3, R1, #0
	NOT R5, R3
    	ADD R5, R5, #1
    	ADD R5, R4, R5
	BRn chaine2plusgrand
	BRz identique
chaine1plusgrand:
    	LD R0, P              ; Charger +1 dans R0
    	BR fin

chaine2plusgrand:
    	LD R0, N              ; Charger -1 dans R0
    	BR fin
identique:
    	LD R0, Z              ; Charger 0 dans R0
    	BR fin



P: 	.FILL #1
N: 	.FILL #-1
Z: 	.FILL #0

fin:	
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

chaine1:.STRINGZ "Hello"
chaine2:.STRINGZ "Hallo"
    	.END