main:	lui $9, 0x1004
	addi $11, $0, 16 #tamanho da lateral (colunas)
	addi $12, $0, 17 #tamanho vertical (linhas)
	
print_bird:

linha1: 
	addi $9, $9, 24 #começa na coluna 6

#4 Pixels pretos	
	jal preto
	jal preto
	jal preto
	jal preto

linha2:
	addi $9, $9, 496 #passa para a proxima linha
	
#1 Pixel Preto	
	jal preto
	
#3 Pixels Vinho	
	jal vinho
	jal vinho
	jal vinho
	
#1 Pixel Preto
	jal preto
	
linha3:
	addi $9, $9, 488 #passa para a proxima linha

#3 Pixels Pretos	
	jal preto
	jal preto
	jal preto
	
#2 Pixels Vinho
	jal vinho
	jal vinho

#1 Pixel Preto
	jal preto

linha4:
	addi $9, $9, 488 #passa para a proxima linha

#1 Pixel Preto
	jal preto
	
#2 Pixels Vinho
	jal vinho
	jal vinho

#1 Pixel Preto
	jal preto
	
#2 Pixels Vinho
	jal vinho
	jal vinho

#1 Pixel Preto
	jal preto

linha5:
	addi $9, $9, 488 #passa para a proxima linha

#1 Pixel Preto
	jal preto
	
#4 Pixels Vinho
	jal vinho
	jal vinho
	jal vinho
	jal vinho

#2 Pixel Preto
	jal preto
	jal preto

linha6:
	addi $9, $9, 488 #passa para a proxima linha
	
#2 Pixel Preto
	jal preto
	jal preto
	
#3 Pixels Vinho
	jal vinho
	jal vinho
	jal vinho

#1 Pixel Preto
	jal preto

linha7:
	addi $9, $9, 484 #passa para a proxima linha
	
#1 Pixel Preto
	jal preto
	
#6 Pixels Vinho
	jal vinho
	jal vinho
	jal vinho
	jal vinho
	jal vinho
	jal vinho

#2 Pixel Preto
	jal preto
	jal preto

linha8:
	addi $9, $9, 472 #passa para a proxima linha

#1 Pixel Preto
	jal preto
	
#3 Pixels Vinho
	jal vinho
	jal vinho
	jal vinho

#2 Pixel Preto
	jal preto
	jal preto

#3 Pixels Vinho
	jal vinho
	jal vinho
	jal vinho

#2 Pixel Preto
	jal preto
	jal preto	

linha9:
	addi $9, $9, 464 #passa para a proxima linha

#1 Pixel Preto
	jal preto
	
#5 Pixels Vinho
	jal vinho
	jal vinho
	jal vinho
	jal vinho
	jal vinho

#2 Pixel Preto
	jal preto
	jal preto

#1 Pixels Vinho
	jal vinho

#2 Pixel Preto
	jal preto
	jal preto

#1 Pixels Vinho
	jal vinho

#1 Pixel Preto
	jal preto	

linha10:
	addi $9, $9, 448 #passa para a proxima linha

#1 Pixel Preto
	jal preto	

#Pula 2 colunas
	addi $9, $9, 8 #pula 

#1 Pixel Preto
	jal preto
	
#5 Pixels Vinho
	jal vinho	
	jal vinho
	jal vinho
	jal vinho
	jal vinho
	
#2 Pixels Branco
	jal branco 
	jal branco 

#1 Pixels Vinho
	jal vinho

#2 Pixels Branco
	jal branco 
	jal branco 

#1 Pixels Vinho
	jal vinho

#1 Pixel Preto
	jal preto
		
linha11:
	addi $9, $9, 448 #passa para a proxima linha
	
#3 Pixel Preto
	jal preto	
	jal preto
	jal preto
	
#2 Pixels Vinho
	jal vinho	
	jal vinho

#1 Pixel Marrom
	jal marrom
	
#3 Pixels Vinho
	jal vinho	
	jal vinho	
	jal vinho
	
#1 Pixels Branco
	jal branco 

#1 Pixel Preto
	jal preto

#1 Pixels Vinho
	jal vinho

#1 Pixels Branco
	jal branco 

#1 Pixel Preto
	jal preto

#1 Pixels Vinho
	jal vinho

#1 Pixel Preto
	jal preto


linha12:
	addi $9, $9, 456 #passa para a proxima linha

#2 Pixel Preto
	jal preto
	jal preto

#3 Pixels Vinho
	jal vinho
	jal vinho
	jal vinho

#1 Pixel Marrom
	jal marrom

#3 Pixels Vinho
	jal vinho
	jal vinho
	jal vinho

#3 Pixels Amarelo
	jal amarelo
	jal amarelo
	jal amarelo

#1 Pixels Vinho
	jal vinho

#1 Pixel Preto
	jal preto
	

linha13:
	addi $9, $9, 448 #passa para a proxima linha

#2 Pixel Preto
	jal preto
	jal preto

#Pula 1 coluna
	addi $9, $9, 4 #pula 

#1 Pixel Preto
	jal preto
	
#1 Pixels Vinho
	jal vinho

#1 Pixel Marrom
	jal marrom

#4 Pixels Vinho
	jal vinho
	jal vinho
	jal vinho
	jal vinho

#5 Pixels Amarelo
	jal amarelo
	jal amarelo
	jal amarelo
	jal amarelo
	jal amarelo

#1 Pixel Preto
	jal preto

linha14:
	addi $9, $9, 448 #passa para a proxima linha
	
#1 Pixel Preto
	jal preto

#Pula 3 colunas
	addi $9, $9, 12 #pula 

#1 Pixel Preto
	jal preto
	
#2 Pixels Vinho
	jal vinho
	jal vinho
	
#3 Pixels Bege
	jal bege
	jal bege
	jal bege

#1 Pixel Amarelo
	jal amarelo
	
#3 Pixel Preto
	jal preto
	jal preto
	jal preto
	
#1 Pixel Vinho
	jal vinho

#1 Pixel Preto
	jal preto

linha15:
	addi $9, $9, 464 #passa para a proxima linha

#1 Pixel Preto
	jal preto

#1 Pixel Vinho
	jal vinho
	
#5 Pixels Bege
	jal bege
	jal bege
	jal bege
	jal bege
	jal bege

#2 Pixels Amarelo
	jal amarelo
	jal amarelo
	
#1 Pixel Vinho
	jal vinho

#1 Pixel Preto
	jal preto
	
linha16:
	addi $9, $9, 472 #passa para a proxima linha

#2 Pixels Preto
	jal preto
	jal preto
	
#5 Pixels Bege
	jal bege
	jal bege
	jal bege
	jal bege
	jal bege

#2 Pixels Preto
	jal preto
	jal preto	

linha17:
	addi $9, $9, 480 #passa para a proxima linha

#7 Pixels Preto
	jal preto
	jal preto
	jal preto
	jal preto
	jal preto
	jal preto
	jal preto
		
fim:
	addi $2, $0, 10
	syscall

preto:
	addi $10, $0, 0x0 #cor: preto
	sw $10, 0($9) #print cor 
	addi $9, $9, 4 #proximo pixel
	jr $31
	
vinho:
	addi $10, $0, 0xd80808  #cor: vinho
	sw $10, 0($9) #print cor 
	addi $9, $9, 4 #proximo pixel
	jr $31
	
branco:
	addi $10, $0, 0xffffff #cor: branco
	sw $10, 0($9) #print cor 
	addi $9, $9, 4 #proximo pixel
	jr $31
	
marrom:
	addi $10, $0, 0x8b4513 #cor: marrom
	sw $10, 0($9) #print cor 
	addi $9, $9, 4 #proximo pixel
	jr $31
	
amarelo:
	addi $10, $0, 0xdaa520 #cor: amarelo
	sw $10, 0($9) #print cor 
	addi $9, $9, 4 #proximo pixel
	jr $31
	
bege:
	addi $10, $0, 0xffe4b5 #cor: bege
	sw $10, 0($9) #print cor 
	addi $9, $9, 4 #proximo pixel
	jr $31
	
