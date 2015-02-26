main:	lui $9, 0x1004
	# 32 bits / pixel : 8 mais significativos vazios
	#		    8 red
	#		    8 green
	#		    8 blue (menos significativo)
	


	addi $11, $0, 128 #tamanho da lateral (colunas)
	addi $12, $0, 64 #tamanho vertical (linhas)
	addi $13, $0, 54 #tamanho vertical (linhas-ceu)
	
	
	
###################################################
	#Inicia plano de fundo
###################################################
	
	jal print_background #print fundo
	
	#Print Nuvem 1
	lui $9, 0x1004
	addi $9, $9, 10340
	jal print_cloud
	
	#Print Nuvem 2
	lui $9, 0x1004
	addi $9, $9, 3904
	jal print_cloud
	
	
	#Print detalhe da grama
	lui $9, 0x1004
	addi $9, $9, 29696 #onde começa a desenhar a grama
	addi $8, $0, 8 #salva local no registrador 8

grama:	beq $0, $8, pxm 
	jal print_grama
	subi $8, $8, 1
	subi $9, $9, 1016
	j grama
	

#####################################################################
	#Print Passaro
#####################################################################	
	
	#Print Bird
pxm:	lui $9, 0x1004
	addi $9, $9, 19468 #local onde começar a imprimir o bird
	jal print_bird

	
#####################################################################
	#FIM
#####################################################################		

fim:
	addi $2, $0, 10
	syscall
	

#####################################################################
	#BACKGROUND
#####################################################################	

print_background:

#CEU	
	add $30, $0, $31
	jal azul_ceu
		
#print linha
bg:	beq $0, $11, linha
	sw $10, 0($9) #print cor
	addi $9, $9, 4 #proximo pixel
	subi $11, $11, 1 #diminui o contador1 (coluna)
	j bg

#pula linha	
linha:	beq $0, $13, chao1
	subi $13, $13, 1 #diminui o contador2 (linha)
	addi $11, $0, 128 #reset contador1 (colunas)
	j bg
	
#CHAO
chao1:	beq $10, 0x008000, chao2
	beq $10, 0xa0522d, bg_fim
	addi $13, $0, 2 #tamanho vertical (linhas-grama)
	addi $11, $0, 128 #reset contador1 (colunas)
	jal verde
	j bg 

chao2:	addi $13, $0, 5 #tamanho vertical (linhas-terra)
	addi $11, $0, 128 #reset contador1 (colunas)
	jal terra
	j bg
	
bg_fim:	jr $30



#####################################################################
	#GRAMA
#####################################################################

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


#####################################################################
	#BIRD
#####################################################################

print_bird:

	add $30, $0, $31

#linha1: 
	addi $9, $9, 24 #começa na coluna 6

	#4 Pixels pretos	
	jal preto
	jal preto
	jal preto
	jal preto

#linha2:
	addi $9, $9, 496 #passa para a proxima linha
	
	#1 Pixel Preto	
	jal preto
	
	#3 Pixels Vinho	
	jal vinho
	jal vinho
	jal vinho
	
	#1 Pixel Preto
	jal preto
	
#linha3:
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

#linha4:
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

#linha5:
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

#linha6:
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

#linha7:
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

#linha8:
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

#linha9:
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

#linha10:
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
		
#linha11:
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


#linha12:
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
	

#linha13:
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

#linha14:
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

#linha15:
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
	
#linha16:
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

#linha17:
	addi $9, $9, 480 #passa para a proxima linha

	#7 Pixels Preto
	jal preto
	jal preto
	jal preto
	jal preto
	jal preto
	jal preto
	jal preto

	jr $30


#####################################################################
	#NUVEM
#####################################################################
	
print_cloud:
	add $30, $0, $31
	
linha1: 
	addi $9, $9, 48 #começa na coluna 12

#7 Pixels
	addi $8, $0, 7
	
n1:	beq $0, $8, linha2	
	jal branco
	subi $8, $8, 1
	j n1

linha2:
	addi $9, $9, 480 #começa na coluna 11

#10 Pixels
	addi $8, $0, 10
	
n2:	beq $0, $8, linha3	
	jal branco
	subi $8, $8, 1
	j n2

linha3:
	addi $9, $9, 468 #começa na coluna 10

#12 Pixels
	addi $8, $0, 12
	
n3:	beq $0, $8, linha4	
	jal branco
	subi $8, $8, 1
	j n3

linha4:
	addi $9, $9, 464 #começa na coluna 10

#12 Pixels
	addi $8, $0, 12
	
n4:	beq $0, $8, linha5	
	jal branco
	subi $8, $8, 1
	j n4

linha5:
	addi $9, $9, 464 #começa na coluna 10

#12 Pixels
	addi $8, $0, 12
	
n5:	beq $0, $8, linha6	
	jal branco
	subi $8, $8, 1
	j n5
	
linha6:
	addi $9, $9, 464 #começa na coluna 10

#12 Pixels
	addi $8, $0, 12
	
n6:	beq $0, $8, n7	
	jal branco
	subi $8, $8, 1
	j n6
	
#Pula 3 colunas
n7:
	addi $9, $9, 12 #pula
	
#4 Pixels
	addi $8, $0, 4
	
n8:	beq $0, $8, linha7
	jal branco
	subi $8, $8, 1
	j n8

linha7:
	addi $9, $9, 412 #começa na coluna 4

#4 Pixels
	addi $8, $0, 4
	
n9:	beq $0, $8, n10	
	jal branco
	subi $8, $8, 1
	j n9

#Pula 3 colunas
n10:
	addi $9, $9, 12 #pula
	
#10 Pixels
	addi $8, $0, 10
	
n11:	beq $0, $8, n12	
	jal branco
	subi $8, $8, 1
	j n11
	
#Pula 2 colunas
n12:
	addi $9, $9, 8 #pula
	
#7 Pixels
	addi $8, $0, 7
	
n13:	beq $0, $8, linha8	
	jal branco
	subi $8, $8, 1
	j n13
				
linha8: 
	addi $9, $9, 404 #começa na coluna 3

#7 Pixels
	addi $8, $0, 7
	
n14:	beq $0, $8, n15	
	jal branco
	subi $8, $8, 1
	j n14

#Pula 1 coluna
n15:
	addi $9, $9, 4 #pula
	
#10 Pixels
	addi $8, $0, 10
	
n16:	beq $0, $8, n17
	jal branco
	subi $8, $8, 1
	j n16
	
#Pula 1 coluna
n17:
	addi $9, $9, 4 #pula
	
#7 Pixels
	addi $8, $0, 9
	
n18:	beq $0, $8, linha9	
	jal branco
	subi $8, $8, 1
	j n18
	
linha9:
	addi $9, $9, 396 #começa na coluna 2

#29 Pixels
	addi $8, $0, 29
	
n19:	beq $0, $8, linha10	
	jal branco
	subi $8, $8, 1
	j n19

linha10:
	addi $9, $9, 396 #começa na coluna 2

#29 Pixels
	addi $8, $0, 29
	
n20:	beq $0, $8, linha11	
	jal branco
	subi $8, $8, 1
	j n20
	
linha11:
	addi $9, $9, 392 #começa na coluna 1

#30 Pixels
	addi $8, $0, 30
	
n21:	beq $0, $8, linha12	
	jal branco
	subi $8, $8, 1
	j n21

linha12:
	addi $9, $9, 392 #começa na coluna 1

#30 Pixels
	addi $8, $0, 30
	
n22:	beq $0, $8, linha13	
	jal branco
	subi $8, $8, 1
	j n22

linha13:
	addi $9, $9, 392 #começa na coluna 1

#29 Pixels
	addi $8, $0, 29
	
n23:	beq $0, $8, linha14
	jal branco
	subi $8, $8, 1
	j n23
	
linha14:
	addi $9, $9, 396 #começa na coluna 1

#29 Pixels
	addi $8, $0, 29
	
n24:	beq $0, $8, linha15
	jal branco
	subi $8, $8, 1
	j n24

linha15:
	addi $9, $9, 400 #começa na coluna 2

#27 Pixels
	addi $8, $0, 27
	
n25:	beq $0, $8, linha16
	jal branco
	subi $8, $8, 1
	j n25

linha16:
	addi $9, $9, 404 #começa na coluna 2

#13 Pixels
	addi $8, $0, 13
	
n26:	beq $0, $8, n27
	jal branco
	subi $8, $8, 1
	j n26

#Pula 2 colunas
n27:
	addi $9, $9, 8 #pula
	
#11 Pixels
	addi $8, $0, 11
	
n28:	beq $0, $8, linha17	
	jal branco
	subi $8, $8, 1
	j n28

linha17:
	addi $9, $9, 416 #começa na coluna 4

#10 Pixels
	addi $8, $0, 10
	
n29:	beq $0, $8, n30
	jal branco
	subi $8, $8, 1
	j n29

#Pula 4 colunas
n30:
	addi $9, $9, 16 #pula
	
#8 Pixels
	addi $8, $0, 8
	
n31:	beq $0, $8, linha18	
	jal branco
	subi $8, $8, 1
	j n31
	
linha18:
	addi $9, $9, 436 #começa na coluna 7

#4 Pixels
	addi $8, $0, 4
	
n32:	beq $0, $8, fim
	jal branco
	subi $8, $8, 1
	j n32
	
fim_nuvem:
	jr $30
	

#####################################################################
	#CORES
#####################################################################

preto:
	addi $10, $0, 0x000000 #cor: preto
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

verde_grama:
	addi $10, $0, 0x008000 #cor: verde
	sw $10, 0($9) #print cor 
	addi $9, $9, 4 #proximo pixel
	jr $31
	
	
azul_ceu:
	addi $10, $0, 0x87ceeb #cor: azul
	jr $31
	
verde:
	addi $10, $0, 0x008000 #cor: verde
	jr $31
	
terra:
	addi $10, $0, 0xa0522d #cor: marrom - terra
	jr $31
