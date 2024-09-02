; @param R1 adresse de la chaîne 
; @return R2 copie de la chaine de R1

    	.ORIG x3000
	LEA R1,chaine 	      ; Chargement dans R1 de l'adresse de la chaîne
	LEA R2,copie 	    
loop:	LDR R3, R1, #0        ; Charger le caractère courant de la source
	BRz fin		;
    	STR R3, R2, #0        ; Stocker le caractère dans la destination
    	ADD R1, R1, #1        ; Incrémenter l'adresse de la source
    	ADD R2, R2, #1        ; Incrémenter l'adresse de la destination
    	BRnzp loop             ; Continuer tant que le caractère n'est pas le caractère nul
fin : 	NOP			;
chaine:	.STRINGZ "Hello World"
copie:	.STRINGZ ""		;.BLKW 10 
	.END
