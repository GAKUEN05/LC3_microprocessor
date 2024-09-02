; @param R1 adresse de la chaîne 
; @return R0 longueur de la chaîne

 	.ORIG x3000
	LEA R1, chaine ; Chargement dans R1 de l'adresse de la chaîne
 	AND R0,R0,0 ; Mise à 0 du compteur : c = 0
loop: 	LDR R2,R1,0 ; Chargement dans R2 du caractère pointé par R1
 	BRz fini ; Test de fin de chaîne
 	ADD R1,R1,1 ; Incrémentation du pointeur : p++
 	ADD R0,R0,1 ; Incrémentation du compteur : c++
 	BR loop
fini: 	NOP
chaine: .STRINGZ "Hello World"
 	.END
