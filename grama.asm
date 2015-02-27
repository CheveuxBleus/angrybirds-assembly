main:	lui $9, 0x1004
	#3 linhas
	#16 colunas
	
	addi $9, $9, 30208 #onde começa a desenhar a grama
	addi $8, $0, 8 #salva local no registrador 8


grama:	beq $0, $8, fim 
	jal print_grama
	subi $8, $8, 1
	subi $9, $9, 1016
	j grama
	
fim:	addi $2, $0, 10
	syscall
	
print_grama:

	add $30, $0, $31
	
#linha1: 
	addi $9, $9, 4 #começa na coluna 2

	#6 Pixels Verde
	jal verde_grama
	jal verde_grama
	jal verde_grama
	jal verde_grama
	jal verde_grama
	jal verde_grama

	#Pula 1
	addi $9, $9, 4 #pula

	#2 Pixels Verde
	jal verde_grama
	jal verde_grama
	
	#Pula 1
	addi $9, $9, 4 #pula

	#5 Pixels Verde
	jal verde_grama
	jal verde_grama
	jal verde_grama
	jal verde_grama
	jal verde_grama

#linha2: 
	addi $9, $9, 452 #começa na coluna 2	
	
	#2 Pixels Verde
	jal verde_grama
	jal verde_grama
	
	#Pula 1
	addi $9, $9, 4 #pula

	#2 Pixels Verde
	jal verde_grama
	jal verde_grama
	
	#Pula 2
	addi $9, $9, 8 #pula
	
	#1 Pixel Verde
	jal verde_grama
	
	#Pula 3
	addi $9, $9, 12 #pula

	#2 Pixels Verde
	jal verde_grama
	jal verde_grama
	
	#Pula 1
	addi $9, $9, 4 #pula		
	
	#1 Pixel Verde
	jal verde_grama

#linha3: 
	addi $9, $9, 464 #começa na coluna 5	
	
	#1 Pixel Verde
	jal verde_grama
	
	#Pula 8
	addi $9, $9, 32 #pula

	#1 Pixels Verde
	jal verde_grama

#fim:
	jr $30

verde_grama:
	addi $10, $0, 0x008000 #cor: verde
	sw $10, 0($9) #print cor 
	addi $9, $9, 4 #proximo pixel
	jr $31