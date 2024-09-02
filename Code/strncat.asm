; @param R2 adresse de la chaîne source
; @param R3 nombre de caractère max de R2 à copier
; @return R1 adresse de la chaîne destination

	.ORIG x3000
	LEA R2,source 	      ; Chargement dans R2 de l'adresse de la chaîne source
	LEA R1,dest 	      ; Chargement dans R1 de l'adresse de la chaîne destination
	LD R3,NB		

; Trouver la fin de la chaîne destination
finchaine:
    	LDR R4, R1, #0      ; Charger le caractère courant de la destination
    	BRz loop            ; Si caractère nul, commencer la concaténation
    	ADD R1, R1, #1      ; Sinon, incrémenter l'adresse de la destination
    	BRnzp finchaine      ; Continuer jusqu'à la fin de la chaîne

; Concaténer la chaîne source à la destination
loop:
    	AND R3, R3, R3      ; Vérifier si R3 est déjà à 0
    	BRz fin	            ; Si R3 est 0, fin de la concaténation
    	LDR R4, R2, #0      ; Charger le caractère courant de la source
    	BRz fin             ; Si caractère nul, fin de la concaténation
    	STR R4, R1, #0      ; Stocker le caractère dans la destination
    	ADD R1, R1, #1      ; Incrémenter l'adresse de la destination
    	ADD R2, R2, #1      ; Incrémenter l'adresse de la source
    	ADD R3, R3, #-1     ; Décrémenter le nombre de caractères restants à copier
    	BRnzp loop          ; Répéter jusqu'à ce que le nombre spécifié soit copié

fin:
    	NOP                 ; Fin de la fonction strncat
source:	.STRINGZ "World"
dest:	.STRINGZ "Hello"
NB:	.FILL 2
	.END
