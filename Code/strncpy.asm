; @param R1 adresse de la chaîne 1
; @param R0 nombre de caractère à copier
; @return R2 copie de R0 caractère de R1

    	.ORIG x3000
	LEA R1,chaine 	      ; Chargement dans R1 de l'adresse de la chaîne
	LEA R2,copie
	LD R0,NB
    	AND R3, R3, #0        ; Utilisé pour le chargement temporaire des caractères

loop:	AND R0, R0, R0
    	BRz fin               ; Si R0 est 0, nous avons fini de copier
    	LDR R3, R1, #0        ; Charger le caractère courant de la source dans R3
    	STR R3, R2, #0        ; Stocker le caractère de R3 dans la destination
    	ADD R1, R1, #1        ; Incrémenter l'adresse de la source
    	ADD R2, R2, #1        ; Incrémenter l'adresse de la destination
    	ADD R0, R0, #-1       ; Décrémenter le nombre de caractères restants à copier
    	BRnp loop             ; Si le caractère n'est pas nul et R0 n'est pas 0, continuer la boucle

fin:
    	NOP                    ; Retourner à l'instruction appelante
chaine:	.STRINGZ "Hello World"
NB:	.FILL 4
copie:	.STRINGZ "Bonjour"
	.END
