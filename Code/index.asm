; @param R1 adresse de la chaîne 
; @param R2 caractère
; @return R0 la première apparition du caractère stocké dans R2

	.ORIG x3000
	LEA R1,chaine 	    ; Chargement dans R1 de l'adresse de la chaîne
	LD R2,caract	    ; Chargement dans R2 du code ASCII de 'l'
	AND R0,R0,0 		; R0 <- 0
	AND R4,R4,0

loop: 	LDR R3, R1, #0 ; Charger le caractère courant de la chaîne en R3
	BRz fin           ; Si le caractère est nul, fin de la chaîne atteinte, sortir de la boucle
    	NOT R5, R2            ; Inverser tous les bits de R3 pour la comparaison
    	ADD R5, R5, #1
    	ADD R5, R3, R5        ; Soustraire le caractère recherché du caractère courant
    	BRz caracteretrouve   ; Si le résultat est zéro, le caractère a été trouvé
	ADD R1, R1, #1        ; Incrémenter le pointeur de la chaîne
    	BRnzp loop           ; Sinon, continuer la boucle

caracteretrouve:
    	ADD R0,R0,R1; Stocker l'adresse de la première occurrence dans R4
    	HALT        ;

fin:    
	NOP ;	
	HALT        ; 
chaine: .STRINGZ "Hello World"
caract	.FILL x6C 	; caract = 'l'
	.END

