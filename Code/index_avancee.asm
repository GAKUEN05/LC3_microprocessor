; Initialisation de la pile au début du programme
	

	.ORIG x0000
	pile: .FILL stackend 
main :  LD R6,pile ; Équivalent à LEA R6,stackend
	LEA R1,chaine 	    ; Chargement dans R1 de l'adresse de la chaîne
	LD R2,caract	    ; Chargement dans R2 du code ASCII de 'l'
	JSR index
	BR end

index :
	ADD R6,R6,-2
	STR R2,R6,#0
	STR R1,R6,#1
	AND R0,R0,0 

loop :	LDR R3, R1, #0 ; Charger le caractère courant de la chaîne en R3
	BRz fin           ; Si le caractère est nul, fin de la chaîne atteinte, sortir de la boucle
    	NOT R5, R2            ; Inverser tous les bits de R3 pour la comparaison
    	ADD R5, R5, #1
    	ADD R5, R3, R5        ; Soustraire le caractère recherché du caractère courant
    	BRz caracteretrouve   ; Si le résultat est zéro, le caractère a été trouvé
	ADD R1, R1, #1        ; Incrémenter le pointeur de la chaîne
    	BRnzp loop          

caracteretrouve:
    	ADD R0,R0,R1;
	BR fin

fin:    
	LDR R1,R6,#1 
	LDR R2,R6,#0
	ADD R6,R6,#2	
	RET
end:
	NOP
	HATL 

; Réservation de l’espace pour la pile
 
 .BLKW x00A ; Taille de la pile : 256 octets

stackend: ; Adresse de mot mémoire suivant

chaine: .STRINGZ "Hello World"
caract	.FILL x6C 	; caract = 'l'
	.END