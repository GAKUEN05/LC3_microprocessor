	; Initialisation de la pile au début du programme
	.ORIG x6000
	pile: .FILL stackend 
main: 	LD R6,pile ; Équivalent à LEA R6,stackend
	LEA R2,source
	LEA R1,dest
	JSR strcat
	BR end

strcat:
	ADD R6,R6,#-2;
	STR R2,R6,#0;
	STR R1,R6,#1;
	
finchaine:
    	LDR R3, R1, #0      ; Charger le caractère courant de la destination
    	BRz loop            ; Si caractère nul, commencer la concaténation
    	ADD R1, R1, #1      ; Sinon, incrémenter l'adresse de la destination
    	BRnzp finchaine     ;


loop:
    	LDR R3, R2, #0      ; Charger le caractère courant de la source
    	STR R3, R1, #0      ; Stocker le caractère dans la destination
    	BRz fin             ; Si caractère nul, fin de la concaténation
    	ADD R1, R1, #1      ; Incrémenter l'adresse de la destination
    	ADD R2, R2, #1      ; Incrémenter l'adresse de la source
    	BRnzp loop          ; Répéter jusqu'à ce que la source soit complètement copiée

fin:
    	LDR R2,R6,#0;
	LDR R1,R6,#1;
	ADD R6,R6,#2;
	RET;                 ; Fin de la fonction strcat

end :
	NOP;
	HATL;


	; Réservation de l’espace pour la pile
 	
 	.BLKW x00A ; Taille de la pile : 256 octets

	stackend: ; Adresse de mot mémoire suivant
	source:	.STRINGZ "World"
	dest:	.STRINGZ "Hello"
	.END