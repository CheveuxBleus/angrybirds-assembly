main:	lui $9, 0x1004
	#8 linhas
	#7 colunas
	
print_seta3:
	
#linha1: 
	addi $9, $9, 12 #começa na coluna 4

	#1 Pixel
	jal azul_c
	
#linha2:
	addi $9, $9, 504 #começa na coluna 3

	#3 Pixels
	jal azul_c
	jal azul_c
	jal azul_c
	
#linha3:
	addi $9, $9, 496 #começa na coluna 2

	#5 Pixels
	jal azul_c
	jal azul_c
	jal azul_c
	jal azul_c
	jal azul_c

#linha4:
	addi $9, $9, 488 #começa na coluna 1

	#7 Pixels
	jal azul_c
	jal azul_c
	jal azul_c
	jal azul_c
	jal azul_c
	jal azul_c
	jal azul_c
	
#linha5:
	addi $9, $9, 492 #começa na coluna 3
	
	#2 Pixels
	jal azul_c
	jal azul_c

#linha6:
	addi $9, $9, 504 #começa na coluna 3

	#2 Pixels
	jal azul_c
	jal azul_c
	
#linha7:
	addi $9, $9, 504 #começa na coluna 3

	#2 Pixels
	jal azul_c
	jal azul_c

#linha8:
	addi $9, $9, 508 #começa na coluna 4

	#1 Pixel
	jal azul_c

		
fim:	addi $2, $0, 10
	syscall

azul_c:
	addi $10, $0, 0x87ceeb #cor: azul ceu
	sw $10, 0($9) #print cor 
	addi $9, $9, 4 #proximo pixel
	jr $31
