; @param R1 adresse de la chaîne 
; @param R2 caractère
; @return R0 la dernière apparition du caractère stocké dans R2

    	.ORIG x3000
	LEA R1,chaine 	      ; Chargement dans R1 de l'adresse de la chaîne
	LD R2,caract	      ; Chargement dans R2 du code ASCII de 'l'
    	AND R0, R0, #0        ; R0 <- 0 pour stocker l'adresse de la dernière occurrence
    	AND R4, R4, #0        ; R4 <- 0 Utilisé pour stocker l'adresse temporaire de la dernière occurrence

loop:
  	LDR R3, R1, #0        ; Charger le caractère courant de la chaîne en R3
	BRz fin	 	      ; Si R3 est nul, fin de la chaîne
    	             
    	NOT R5, R2            ; Inverser tous les bits de R3 pour la comparaison
    	ADD R5, R5, #1
    	ADD R5, R3, R5        ; Soustraire le caractère recherché du caractère courant
    	BRz majR4             ; Si le résultat est zéro, mettre à jour R4
	ADD R1, R1, #1        ; Incrémenter le pointeur de la chaîne
    	BRnzp loop            ; Sinon, continuer la boucle

majR4:
    	ADD R4, R1, #0       ; Mettre à jour R4 avec l'adresse courante moins un pour la dernière occurrence
    	ADD R1, R1, #1
    	BRnzp loop            ; Continuer la boucle

fin:
    	ADD R0, R4, #0
	HATL       ; Mettre à jour R0 avec l'adresse de la dernière occurrence trouvée
chaine: .STRINGZ "Hello"
caract:	.FILL x6C 	; caract = 'l'     	
	.END
