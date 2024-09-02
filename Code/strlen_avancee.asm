	; Initialisation de la pile au début du programme
	.ORIG x3000
	pile: .FILL stackend
main: 	LD R6,pile ; Équivalent à LEA R6,stackends
	LEA R1, chaine ; Chargement dans R1 de l'adresse de la chaîne
	JSR strlen
	BR end

strlen:
	ADD R6,R6,#-1;
	STR R1,R6,#0;
	AND R0,R0,0 ; Mise à 0 du compteur : c = 0

loop: 	LDR R2,R1,0 ; Chargement dans R2 du caractère pointé par R1
 	BRz fini ; Test de fin de chaîne
 	ADD R1,R1,1 ; Incrémentation du pointeur : p++
 	ADD R0,R0,1 ; Incrémentation du compteur : c++
 	BR loop

fini:
	LDR R1,R6,#0;
	ADD R6,R6,#1;
	ADD R0,R0,#0;
	RET;

end:
	NOP;
	HALT;

	; Réservation de l’espace pour la pile
 	
 	.BLKW x00A ; Taille de la pile : 256 octets

	stackend: ; Adresse de mot mémoire suivant

	chaine: .STRINGZ "Hello World"
	.END