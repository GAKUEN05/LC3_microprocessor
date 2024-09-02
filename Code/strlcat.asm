; @param R2 adresse de la chaîne source
; @param R3 nombre de caractère max de la chaine destination
; @return R1 adresse de la chaîne destination

	.ORIG x3000

        ; Trouver la fin de la chaîne destination
        LD R0, zero  	; R0 est utilisé pour le comptage
	LEA R2,source 	      ; Chargement dans R2 de l'adresse de la chaîne source
	LEA R1,dest 	      ; Chargement dans R1 de l'adresse de la chaîne destination
finchaine:
	LDR R4, R1, #0  ; Charge le caractère actuel de la destination en R4
        BRz copie  	; Si on trouve un caractère nul, on commence la copie
        ADD R0, R0, #1  ; Incrémente le compteur de la longueur destination
        ADD R1, R1, #1  ; Incrémente le pointeur de la destination
        BRnp finchaine

copie
        ; Copier la chaîne source vers la destination
        LD R5, zero  	; R5 est le compteur de caractères copiés
        LD R3, taille
        ADD R3, R3, #-1
        NOT R3, R3
        ADD R3, R3, 1
loop:
 	LDR R6, R2, #0  ; Charge le caractère actuel de la source en R6
        STR R6, R1, #0  ; Stocke le caractère dans la destination
        ADD R1, R1, #1  ; Incrémente le pointeur de la destination
        ADD R2, R2, #1  ; Incrémente le pointeur de la source
        ADD R5, R5, #1  ; Incrémente le compteur de caractères copiés
        ADD R4, R0, R5  ; Calcule la longueur actuelle de la destination
        ADD R7, R4, R3 ; 
        BRz fin		; Si R4 égale R3-1, on a atteint la taille max
        BRnp loop

fin:     ST R4, taille  ; Stocke la longueur finale dans taille

; Variables et étiquettes
zero:     .FILL #0  	; Représente le caractère nul
taille:   .FILL #7  	; Stocke la longueur finale de la chaîne
source:	.STRINGZ "World"
dest:	.STRINGZ "Hello"
	.END
