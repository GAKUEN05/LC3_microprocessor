; @param R2 adresse de la chaîne source
; @return R1 adresse de la chaîne destination

	.ORIG x3000
	LEA R2,source 	      ; Chargement dans R2 de l'adresse de la chaîne source
	LEA R1,dest 	      ; Chargement dans R1 de l'adresse de la chaîne destination

; Trouver la fin de la chaîne destination
finchaine:
    	LDR R3, R1, #0      ; Charger le caractère courant de la destination
    	BRz loop            ; Si caractère nul, commencer la concaténation
    	ADD R1, R1, #1      ; Sinon, incrémenter l'adresse de la destination
    	BRnzp finchaine     ; Continuer jusqu'à la fin de la chaîne

; Concaténer la chaîne source à la destination
loop:
    	LDR R3, R2, #0      ; Charger le caractère courant de la source
    	STR R3, R1, #0      ; Stocker le caractère dans la destination
    	BRz fin             ; Si caractère nul, fin de la concaténation
    	ADD R1, R1, #1      ; Incrémenter l'adresse de la destination
    	ADD R2, R2, #1      ; Incrémenter l'adresse de la source
    	BRnzp loop          ; Répéter jusqu'à ce que la source soit complètement copiée

fin:
    	NOP                 ; Fin de la fonction strcat
source:	.STRINGZ "World"
dest:	.STRINGZ "Hello"
	.END
