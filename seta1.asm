main:	lui $9, 0x1004
	#7 linhas
	#8 colunas
	
print_seta1:
	
#linha1: 
	addi $9, $9, 16 #começa na coluna 5

	#1 Pixel
	jal branco
	

#linha2:
	addi $9, $9, 508 #começa na coluna 5

	#2 Pixels
	jal branco
	jal branco

#linha3:
	addi $9, $9, 492 #começa na coluna 2

	#6 Pixels
	jal branco
	jal branco
	jal branco
	jal branco
	jal branco
	jal branco

#linha4:
	addi $9, $9, 484 #começa na coluna 1

	#8 Pixels
	jal branco
	jal branco
	jal branco
	jal branco
	jal branco
	jal branco
	jal branco
	jal branco
	
#linha5:
	addi $9, $9, 496 #começa na coluna 5

	#3 Pixels
	jal branco
	jal branco
	jal branco
	
#linha6:
	addi $9, $9, 500 #começa na coluna 5

	#2 Pixels
	jal branco
	jal branco

#linha7:
	addi $9, $9, 504 #começa na coluna 5

	#1 Pixel
	jal branco
	
fim:	addi $2, $0, 10
	syscall

branco:
	addi $10, $0, 0xffffff #cor: branco
	sw $10, 0($9) #print cor 
	addi $9, $9, 4 #proximo pixel
	jr $31
