main:	lui $9, 0x1004
	#7 linhas
	#8 colunas
	
print_seta3:
	
#linha1: 
	addi $9, $9, 4 #começa na coluna 2

	#7 Pixels
	jal branco
	jal branco
	jal branco
	jal branco
	jal branco
	jal branco
	jal branco
	
#linha2:
	addi $9, $9, 492 #começa na coluna 4

	#4 Pixels
	jal branco
	jal branco
	jal branco
	jal branco

#linha3:
	addi $9, $9, 492 #começa na coluna 3

	#4 Pixels
	jal branco
	jal branco
	jal branco
	jal branco

#linha4:
	addi $9, $9, 492 #começa na coluna 2

	#2 Pixels
	jal branco
	jal branco
	
	#Pula 1
	addi $9, $9, 4 #Pula
	
	#1 Pixel
	jal branco
	
#linha5:
	addi $9, $9, 492 #começa na coluna 1

	#2 Pixels
	jal branco
	jal branco
	
	#Pula 1
	addi $9, $9, 4 #Pula
	
	#1 Pixel
	jal branco
	
fim:	addi $2, $0, 10
	syscall

branco:
	addi $10, $0, 0xffffff #cor: branco
	sw $10, 0($9) #print cor 
	addi $9, $9, 4 #proximo pixel
	jr $31
