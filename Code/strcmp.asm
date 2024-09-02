; @param R1 adresse de la chaîne 1
; @param R2 adresse de la chaîne 2
; @return R0 longueur de la chaîne

    	.ORIG x3000
	LEA R1,chaine1 	    ; Chargement dans R1 de l'adresse de la chaîne1
	LEA R2,chaine2 	    ; Chargement dans R2 de l'adresse de la chaîne2
    	AND R0, R0, #0        ; R0 pour stocker le résultat de la comparaison

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
    	BRz loop         ; Si les caractères sont égaux, vérifier la fin de chaîne
    	BRp chaine1plusgrand  ; Si R4 > R3, la première chaîne est plus grande
    	BRn chaine2plusgrand  ; Si R4 < R3, la deuxième chaîne est plus grande

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

fin:	NOP
chaine1:.STRINGZ "Hello"
chaine2:.STRINGZ "Hallo"
    	.END

