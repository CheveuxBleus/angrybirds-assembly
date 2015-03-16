main:	lui $9, 0x1004
	#7 linhas
	#8 colunas
	
print_seta2:
	
#linha1: 
	addi $9, $9, 4 #começa na coluna 2

	#7 Pixels
	jal azul_c
	jal azul_c
	jal azul_c
	jal azul_c
	jal azul_c
	jal azul_c
	jal azul_c
	
#linha2:
	addi $9, $9, 492 #começa na coluna 4

	#4 Pixels
	jal azul_c
	jal azul_c
	jal azul_c
	jal azul_c

#linha3:
	addi $9, $9, 492 #começa na coluna 3

	#4 Pixels
	jal azul_c
	jal azul_c
	jal azul_c
	jal azul_c

#linha4:
	addi $9, $9, 492 #começa na coluna 2

	#2 Pixels
	jal azul_c
	jal azul_c
	
	#Pula 1
	addi $9, $9, 4 #Pula
	
	#1 Pixel
	jal azul_c
	
#linha5:
	addi $9, $9, 492 #começa na coluna 1

	#2 Pixels
	jal azul_c
	jal azul_c
	
	#Pula 1
	addi $9, $9, 4 #Pula
	
	#1 Pixel
	jal azul_c
	
fim:	addi $2, $0, 10
	syscall

azul_c:
	addi $10, $0, 0x87ceeb #cor: azul ceu
	sw $10, 0($9) #print cor 
	addi $9, $9, 4 #proximo pixel
	jr $31
