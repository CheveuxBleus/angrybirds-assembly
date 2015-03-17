main:	lui $9, 0x1004
	# 32 bits / pixel : 8 mais significativos vazios
	#		    8 red
	#		    8 green
	#		    8 blue (menos significativo)
	

	#$8 -> temporario
	addi $11, $0, 128 #tamanho da lateral (colunas)
	addi $12, $0, 64 #tamanho vertical (linhas)
	addi $13, $0, 54 #tamanho vertical (linhas-ceu)
	#$14 -> compara tecla
	#$15 -> valor da seta
	#$16 -> checa se o usuario digitou algo
	
	
	
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

grama:	beq $0, $8, bird 
	jal print_grama
	subi $8, $8, 1
	subi $9, $9, 1016
	j grama
	

#####################################################################
	#Print Passaro
#####################################################################	
	
	#Print Bird
bird:	lui $9, 0x1004
	addi $9, $9, 19468 #local onde começar a imprimir o bird
	jal print_bird
	
#####################################################################
	#Print Pig
#####################################################################	
	
	#Print Pig
pig:	lui $9, 0x1004
	addi $9, $9, 14724 #local onde começar a imprimir o bird
	jal print_pig
	
#####################################################################
	#Print Seta Inicial
#####################################################################	

seta_inicial:
	#Print Seta1
	lui $9, 0x1004
	addi $9, $9, 24664 #local onde começar a imprimir a seta
	jal print_seta1
	
	addi $15, $15, 1 #valor da seta = 1
	
#####################################################################
	#Ler Teclado
#####################################################################

LeituraTec:
                lw $16, 0xFFFF0000         # Checa se alguma tecla foi pressionada
                blez $16, TecladoOK          # Pula caso nao tenha sido pressionada
                lw $14, 0xFFFF0004         # Guarda valor da tecla pressionada em $14
                
ChecaBaixo:
                bne $14, 115, ChecaCima     # Testa se tecla pressionada foi 's' (Baixo)
              	beq $15, 1, TecladoOK	#se a seta estiver na posiçao 1, nao fazer nada
              	beq $15, 2, seta1 	#se a seta estiver na posiçao 2, mover para posiçao 1
              	beq $15, 3, seta2	#se a seta estiver na posiçao 1, mover para posiçao 2
              	beq $15, 4, seta3       #se a seta estiver na posiçao 1, mover para posiçao 3
              	
                j       TecladoOK               # Termina leitura teclado
                
ChecaCima:
                bne $14, 119, ChecaFim      # Testa se tecla pressionada foi 'w' (Cima)
                beq $15, 1, seta2	#se a seta estiver na posiçao 1, mover para posiçao 2
              	beq $15, 2, seta3 	#se a seta estiver na posiçao 2, mover para posiçao 3
              	beq $15, 3, seta4	#se a seta estiver na posiçao 1, mover para posiçao 4
              	beq $15, 4, TecladoOK       #se a seta estiver na posiçao 1, nao fazer nada
                j       TecladoOK               # Termina leitura teclado
                
#Enter:
#		bne $14, 97, TecladoOK      # Testa se tecla pressionada foi 'a' (Enter)                

ChecaFim:
                bne $14, 100, TecladoOK      # Testa se tecla pressionada foi 'd' (end)
                j fim
 
TecladoOK:
                j LeituraTec
	
#####################################################################
	#FIM
#####################################################################		

fim:
	addi $2, $0, 10
	syscall
		
#####################################################################
	#Print Setas
#####################################################################	
		
seta1:	
	#Apaga seta 2
	lui $9, 0x1004
	addi $9, $9, 22620 #local onde começar a imprimir a seta
	jal print_setaneg2
	
	#Print Seta1
	lui $9, 0x1004
	addi $9, $9, 24664 #local onde começar a imprimir a seta
	jal print_seta1
	
	addi $15, $0, 1 #valor da seta = 1
	j LeituraTec
	
seta2:
	#Apaga Seta1
	lui $9, 0x1004
	addi $9, $9, 24664 #local onde começar a imprimir a seta
	jal print_setaneg1
	
	#Apaga seta 3
	lui $9, 0x1004
	addi $9, $9, 19544 #local onde começar a imprimir a seta
	jal print_setaneg3
	
	#Print Seta2
	lui $9, 0x1004
	addi $9, $9, 22620 #local onde começar a imprimir a seta
	jal print_seta2
	
	addi $15, $0, 2 #valor da seta = 2
	j LeituraTec
	
seta3:	#Apaga seta 2
	lui $9, 0x1004
	addi $9, $9, 22620 #local onde começar a imprimir a seta
	jal print_setaneg2
	
	#Apaga seta 4
	lui $9, 0x1004
	addi $9, $9, 17988 #local onde começar a imprimir a seta
	jal print_setaneg4
	
	#Print Seta3
	lui $9, 0x1004
	addi $9, $9, 19544 #local onde começar a imprimir a seta
	jal print_seta3
	
	addi $15, $0, 3 #valor da seta = 3
	j LeituraTec
	
seta4:		
	#Apaga seta 3
	lui $9, 0x1004
	addi $9, $9, 19544 #local onde começar a imprimir a seta
	jal print_setaneg3
	
	#print seta 4	
	lui $9, 0x1004
	addi $9, $9, 17988 #local onde começar a imprimir a seta
	jal print_seta4

	addi $15, $0, 4 #valor da seta = 4
	j LeituraTec
	
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
	
n32:	beq $0, $8, fim_nuvem
	jal branco
	subi $8, $8, 1
	j n32
	
fim_nuvem:
	jr $30
	

#####################################################################
	#SETA1
#####################################################################
	
print_seta1:
	add $30, $0, $31
	
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
	
fim_seta1:
	jr $30
	
#####################################################################
	#SETA2
#####################################################################
	
print_seta2:
	add $30, $0, $31
	
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
	
fim_seta2:
	jr $30
	
#####################################################################
	#SETA3
#####################################################################

print_seta3:
	add $30, $0, $31
	
#linha1: 
	addi $9, $9, 16 #começa na coluna 5

	#1 Pixel
	jal branco
	
#linha2:
	addi $9, $9, 504 #começa na coluna 4

	#2 Pixels
	jal branco
	jal branco

#linha3:
	addi $9, $9, 500 #começa na coluna 3

	#3 Pixels
	jal branco
	jal branco
	jal branco

#linha4:
	addi $9, $9, 496 #começa na coluna 2

	#4 Pixels
	jal branco
	jal branco
	jal branco
	jal branco
	
#linha5:
	addi $9, $9, 492 #começa na coluna 1

	#1 Pixel
	jal branco
	
	#Pula 1
	addi $9, $9, 4 #Pula
	
	#3 Pixels
	jal branco
	jal branco
	jal branco

#linha6:
	addi $9, $9, 496 #começa na coluna 2

	#2 Pixels
	jal branco
	jal branco
	
	#Pula 1
	addi $9, $9, 4 #Pula
	
	#1 Pixel
	jal branco
	
#linha7:
	addi $9, $9, 492 #começa na coluna 1

	#2 Pixels
	jal branco
	jal branco
	
	#Pula 2
	addi $9, $9, 8 #Pula
	
	#1 Pixel
	jal branco

#linha8:
	addi $9, $9, 492 #começa na coluna 1

	#1 Pixel
	jal branco

fim_seta3:
	jr $30
	
#####################################################################
	#SETA4
#####################################################################

print_seta4:
	add $30, $0, $31
	
#linha1: 
	addi $9, $9, 12 #começa na coluna 4

	#1 Pixel
	jal branco
	
#linha2:
	addi $9, $9, 504 #começa na coluna 3

	#3 Pixels
	jal branco
	jal branco
	jal branco
	
#linha3:
	addi $9, $9, 496 #começa na coluna 2

	#5 Pixels
	jal branco
	jal branco
	jal branco
	jal branco
	jal branco

#linha4:
	addi $9, $9, 488 #começa na coluna 1

	#7 Pixels
	jal branco
	jal branco
	jal branco
	jal branco
	jal branco
	jal branco
	jal branco
	
#linha5:
	addi $9, $9, 492 #começa na coluna 3
	
	#2 Pixels
	jal branco
	jal branco

#linha6:
	addi $9, $9, 504 #começa na coluna 3

	#2 Pixels
	jal branco
	jal branco
	
#linha7:
	addi $9, $9, 504 #começa na coluna 3

	#2 Pixels
	jal branco
	jal branco

#linha8:
	addi $9, $9, 508 #começa na coluna 4

	#1 Pixel
	jal branco

fim_seta4:
	jr $30		

#####################################################################
	#SETA NEGATIVA 1
#####################################################################
	
print_setaneg1:
	add $30, $0, $31
	
#linha1: 
	addi $9, $9, 16 #começa na coluna 5

	#1 Pixel
	jal azul_c
	

#linha2:
	addi $9, $9, 508 #começa na coluna 5

	#2 Pixels
	jal azul_c
	jal azul_c

#linha3:
	addi $9, $9, 492 #começa na coluna 2

	#6 Pixels
	jal azul_c
	jal azul_c
	jal azul_c
	jal azul_c
	jal azul_c
	jal azul_c

#linha4:
	addi $9, $9, 484 #começa na coluna 1

	#8 Pixels
	jal azul_c
	jal azul_c
	jal azul_c
	jal azul_c
	jal azul_c
	jal azul_c
	jal azul_c
	jal azul_c
	
#linha5:
	addi $9, $9, 496 #começa na coluna 5

	#3 Pixels
	jal azul_c
	jal azul_c
	jal azul_c
	
#linha6:
	addi $9, $9, 500 #começa na coluna 5

	#2 Pixels
	jal azul_c
	jal azul_c

#linha7:
	addi $9, $9, 504 #começa na coluna 5

	#1 Pixel
	jal azul_c

fim_setaneg1:
	jr $30	

#####################################################################
	#SETA NEGATIVA 2
#####################################################################

print_setaneg2:
	add $30, $0, $31
	
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
	
fim_setaneg2:
	jr $30
	
#####################################################################
	#SETA NEGATIVA 3
#####################################################################
	
print_setaneg3:
	add $30, $0, $31
	
#linha1: 
	addi $9, $9, 16 #começa na coluna 5

	#1 Pixel
	jal azul_c
	
#linha2:
	addi $9, $9, 504 #começa na coluna 4

	#2 Pixels
	jal azul_c
	jal azul_c

#linha3:
	addi $9, $9, 500 #começa na coluna 3

	#3 Pixels
	jal azul_c
	jal azul_c
	jal azul_c

#linha4:
	addi $9, $9, 496 #começa na coluna 2

	#4 Pixels
	jal azul_c
	jal azul_c
	jal azul_c
	jal azul_c
	
#linha5:
	addi $9, $9, 492 #começa na coluna 1

	#1 Pixel
	jal azul_c
	
	#Pula 1
	addi $9, $9, 4 #Pula
	
	#3 Pixels
	jal azul_c
	jal azul_c
	jal azul_c

#linha6:
	addi $9, $9, 496 #começa na coluna 2

	#2 Pixels
	jal azul_c
	jal azul_c
	
	#Pula 1
	addi $9, $9, 4 #Pula
	
	#1 Pixel
	jal azul_c
	
#linha7:
	addi $9, $9, 492 #começa na coluna 1

	#2 Pixels
	jal azul_c
	jal azul_c
	
	#Pula 2
	addi $9, $9, 8 #Pula
	
	#1 Pixel
	jal azul_c

#linha8:
	addi $9, $9, 492 #começa na coluna 1

	#1 Pixel
	jal azul_c

fim_setaneg3:
	jr $30
	
#####################################################################
	#SETA NEGATIVA 4
#####################################################################
	
print_setaneg4:
	add $30, $0, $31
	
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

fim_setaneg4:
	jr $30
	
#####################################################################
	#PIG_INIMIGO
#####################################################################

print_pig:
	add $30, $0, $31

#linha1: 
	addi $9, $9, 12 #começa na coluna 4

#2 Pixels marrom escuro	
	jal marrom_esc
	jal marrom_esc
	
#1 Pixel marrom
	jal marrom

#13 Pixels marrom escuro
	jal marrom_esc
	jal marrom_esc
	jal marrom_esc
	jal marrom_esc
	jal marrom_esc
	jal marrom_esc
	jal marrom_esc
	jal marrom_esc
	jal marrom_esc
	jal marrom_esc
	jal marrom_esc
	jal marrom_esc
	jal marrom_esc

#linha2:
	addi $9, $9, 448 # coluna 4
	
#1 Pixel marrom escuro	
	jal marrom_esc
	
#14 Pixels marrom	
	jal marrom
	jal marrom
	jal marrom
	jal marrom
	jal marrom
	jal marrom
	jal marrom
	jal marrom
	jal marrom
	jal marrom
	jal marrom
	jal marrom
	jal marrom
	jal marrom
	
#1 Pixel marrom escuro
	jal marrom_esc
	
#linha3:
	addi $9, $9, 448 # coluna 4
	
#16 Pixels marrom escuro	
	jal marrom_esc
	jal marrom_esc
	jal marrom_esc
	jal marrom_esc
	jal marrom_esc
	jal marrom_esc
	jal marrom_esc
	jal marrom_esc
	jal marrom_esc
	jal marrom_esc
	jal marrom_esc
	jal marrom_esc
	jal marrom_esc
	jal marrom_esc
	jal marrom_esc
	jal marrom_esc

#linha4:
	addi $9, $9, 456 # coluna 6
	
#3 Pixels marrom escuro	
	jal marrom_esc
	jal marrom_esc
	jal marrom_esc

#Pula 7
	addi $9, $9, 28

#3 Pixels marrom escuro	
	jal marrom_esc
	jal marrom_esc
	jal marrom_esc	
		
#linha5:
	addi $9, $9, 460 # coluna 6
	
#1 Pixel marrom escuro	
	jal marrom_esc

#1 Pixel marrom
	jal marrom

#1 Pixel marrom escuro
	jal marrom_esc

#Pula 7
	addi $9, $9, 28

#1 Pixel marrom escuro	
	jal marrom_esc

#1 Pixel marrom
	jal marrom

#1 Pixel marrom escuro
	jal marrom_esc

#linha6:
	addi $9, $9, 460 # coluna 6
	
#1 Pixel marrom escuro	
	jal marrom_esc

#2 Pixels marrom
	jal marrom
	jal marrom

#Pula 7
	addi $9, $9, 28

#1 Pixel marrom escuro	
	jal marrom_esc

#1 Pixel marrom
	jal marrom

#1 Pixel marrom escuro
	jal marrom_esc

#linha7:
	addi $9, $9, 460 # coluna 6
	
#1 Pixel marrom escuro	
	jal marrom_esc

#1 Pixel marrom
	jal marrom

#1 Pixel marrom escuro
	jal marrom_esc

#Pula 7
	addi $9, $9, 28

#1 Pixel marrom escuro	
	jal marrom_esc

#1 Pixel marrom
	jal marrom

#1 Pixel marrom escuro
	jal marrom_esc
	
#linha8:
	addi $9, $9, 460 # coluna 6
	
#1 Pixel marrom escuro	
	jal marrom_esc

#1 Pixel marrom
	jal marrom

#1 Pixel marrom escuro
	jal marrom_esc

#Pula 7
	addi $9, $9, 28

#1 Pixel marrom escuro	
	jal marrom_esc

#1 Pixel marrom
	jal marrom

#1 Pixel marrom escuro
	jal marrom_esc

#linha9:
	addi $9, $9, 460 # coluna 6
	
#1 Pixel marrom escuro	
	jal marrom_esc

#1 Pixel marrom
	jal marrom

#1 Pixel marrom escuro
	jal marrom_esc

#Pula 7
	addi $9, $9, 28

#2 Pixels marrom
	jal marrom
	jal marrom
	
#1 Pixel marrom escuro
	jal marrom_esc
	
#linha10:
	addi $9, $9, 460 # coluna 6
	
#1 Pixel marrom escuro	
	jal marrom_esc

#1 Pixel marrom
	jal marrom

#1 Pixel marrom escuro
	jal marrom_esc

#Pula 7
	addi $9, $9, 28

#1 Pixel marrom escuro	
	jal marrom_esc

#1 Pixel marrom
	jal marrom

#1 Pixel marrom escuro
	jal marrom_esc

#linha11:
	addi $9, $9, 460 # coluna 6
	
#3 Pixels marrom escuro	
	jal marrom_esc
	jal marrom_esc
	jal marrom_esc
	
#Pula 7
	addi $9, $9, 28

#3 Pixels marrom escuro	
	jal marrom_esc
	jal marrom_esc
	jal marrom_esc

#linha12:
	addi $9, $9, 440 # coluna 1
	
#13 Pixels marrom escuro	
	jal marrom_esc
	jal marrom_esc
	jal marrom_esc
	jal marrom_esc
	jal marrom_esc
	jal marrom_esc
	jal marrom_esc
	jal marrom_esc
	jal marrom_esc
	jal marrom_esc
	jal marrom_esc
	jal marrom_esc
	jal marrom_esc
	
#1 pixel marrom
	jal marrom

#12 Pixels marrom escuro
	jal marrom_esc
	jal marrom_esc
	jal marrom_esc
	jal marrom_esc
	jal marrom_esc
	jal marrom_esc
	jal marrom_esc
	jal marrom_esc
	jal marrom_esc
	jal marrom_esc
	jal marrom_esc
	jal marrom_esc
	
#linha13:
	addi $9, $9, 408 # coluna 1

#1 Pixel marrom escuro
	jal marrom_esc

#24 Pixels marrom
	jal marrom
	jal marrom
	jal marrom
	jal marrom
	jal marrom
	jal marrom
	jal marrom
	jal marrom
	jal marrom
	jal marrom
	jal marrom
	jal marrom
	jal marrom
	jal marrom
	jal marrom
	jal marrom
	jal marrom
	jal marrom
	jal marrom
	jal marrom
	jal marrom
	jal marrom
	jal marrom
	jal marrom
	
#1 Pixel marrom escuro
	jal marrom_esc

#linha14:
	addi $9, $9, 408 # coluna 1
	
#26 Pixels marrom escuro
	jal marrom_esc
	jal marrom_esc
	jal marrom_esc
	jal marrom_esc
	jal marrom_esc
	jal marrom_esc
	jal marrom_esc
	jal marrom_esc
	jal marrom_esc
	jal marrom_esc
	jal marrom_esc
	jal marrom_esc
	jal marrom_esc
	jal marrom_esc
	jal marrom_esc
	jal marrom_esc
	jal marrom_esc
	jal marrom_esc
	jal marrom_esc
	jal marrom_esc
	jal marrom_esc
	jal marrom_esc
	jal marrom_esc
	jal marrom_esc
	jal marrom_esc
	jal marrom_esc
	
#linha15:
	addi $9, $9, 408 # coluna 1

#3 Pixxels marrom escuro
	jal marrom_esc
	jal marrom_esc
	jal marrom_esc
	
#Pula 18
	addi $9, $9, 72

#3 Pixxels marrom escuro
	jal marrom_esc
	jal marrom_esc
	jal marrom_esc
		
#linha16:
	addi $9, $9, 416 # coluna 1

#1 Pixel marrom escuro	
	jal marrom_esc

#1 Pixel marrom
	jal marrom

#1 Pixel marrom escuro
	jal marrom_esc

#Pula 2
	addi $9, $9, 8

#3 Pixels preto
	jal preto
	jal preto
	jal preto

#Pula 7
	addi $9, $9, 28
	
#4 Pixels preto
	jal preto
	jal preto
	jal preto
	jal preto

#Pula 2
	addi $9, $9, 8
	
#1 Pixel marrom escuro	
	jal marrom_esc

#1 Pixel marrom
	jal marrom

#1 Pixel marrom escuro
	jal marrom_esc
	
#linha17:
	addi $9, $9, 416 # coluna 1
	
#1 Pixel marrom escuro	
	jal marrom_esc

#1 Pixel marrom
	jal marrom

#1 Pixel marrom escuro
	jal marrom_esc

#Pula 2
	addi $9, $9, 8

#1 pixel preto
	jal preto

#2 Pixels verde escuro
	jal verde_grama
	jal verde_grama

#8 Pixels preto
	jal preto
	jal preto
	jal preto
	jal preto
	jal preto
	jal preto
	jal preto
	jal preto

#2 Pixels verde escuro
	jal verde_grama
	jal verde_grama

#1 Pixel preto
	jal preto

#Pula 2
	addi $9, $9, 8
	
#1 Pixel marrom escuro	
	jal marrom_esc

#1 Pixel marrom
	jal marrom

#1 Pixel marrom escuro
	jal marrom_esc	

#linha18:
	addi $9, $9, 416 # coluna 1

#1 Pixel marrom escuro	
	jal marrom_esc

#1 Pixel marrom
	jal marrom

#1 Pixel marrom escuro
	jal marrom_esc

#Pula 2
	addi $9, $9, 8
	
#1 Pixel preto
	jal preto

#12 Pixels verde escuro
	jal verde_grama
	jal verde_grama
	jal verde_grama
	jal verde_grama
	jal verde_grama
	jal verde_grama
	jal verde_grama
	jal verde_grama
	jal verde_grama
	jal verde_grama
	jal verde_grama
	jal verde_grama

#1 Pixel preto
	jal preto

#Pula 2
	addi $9, $9, 8
	
#1 Pixel marrom escuro	
	jal marrom_esc

#2 Pixels marrom
	jal marrom
	jal marrom
	
#linha19:
	addi $9, $9, 416 # coluna 1
	
#2 Pixels marrom
	jal marrom
	jal marrom

#1 Pixel marrom escuro	
	jal marrom_esc
	
#Pula 3
	addi $9, $9, 12

#1 Pixel preto
	jal preto
	
#10 Pixels verde escuro
	jal verde_grama
	jal verde_grama
	jal verde_grama
	jal verde_grama
	jal verde_grama
	jal verde_grama
	jal verde_grama
	jal verde_grama
	jal verde_grama
	jal verde_grama

#1 Pixel preto
	jal preto
	
#Pula 3
	addi $9, $9, 12
	
#1 Pixel marrom escuro	
	jal marrom_esc

#1 Pixel marrom
	jal marrom

#1 Pixel marrom escuro
	jal marrom_esc	

#linha20:
	addi $9, $9, 416 # coluna 1

#1 Pixel marrom escuro	
	jal marrom_esc

#1 Pixel marrom
	jal marrom

#1 Pixel marrom escuro
	jal marrom_esc
	
#Pula 2
	addi $9, $9, 8
	
#1 Pixel preto
	jal preto
	
#1 Pixel verde escuro
	jal verde_grama

#3 Pixels branco
	jal branco
	jal branco
	jal branco
	
#3 Pixels verde escuro
	jal verde_grama
	jal verde_grama
	jal verde_grama
	
#3 Pixels branco
	jal branco
	jal branco
	jal branco

#1 Pixel verde escuro
	jal verde_grama

#1 Pixel preto
	jal preto

#Pula 3
	addi $9, $9, 12
	
#1 Pixel marrom escuro	
	jal marrom_esc

#1 Pixel marrom
	jal marrom

#1 Pixel marrom escuro
	jal marrom_esc	

#linha21:
	addi $9, $9, 416 # coluna 1

#1 Pixel marrom escuro	
	jal marrom_esc

#1 Pixel marrom
	jal marrom

#1 Pixel marrom escuro
	jal marrom_esc	

#Pula 1
	addi $9, $9, 4
	
#1 Pixel preto
	jal preto
	
#2 Pixels verde escuro
	jal verde_grama
	jal verde_grama
	
#1 Pixel branco
	jal branco

#1 Pixel preto
	jal preto
	
#1 Pixel branco
	jal branco

#3 Pixels verde escuro
	jal verde_grama
	jal verde_grama
	jal verde_grama

#1 Pixel branco
	jal branco

#1 Pixel preto
	jal preto
	
#1 Pixel branco
	jal branco	

#2 Pixels verde escuro
	jal verde_grama
	jal verde_grama
	
#1 Pixel preto
	jal preto
	
#Pula 2
	addi $9, $9, 8

#1 Pixel marrom escuro	
	jal marrom_esc

#1 Pixel marrom
	jal marrom

#1 Pixel marrom escuro
	jal marrom_esc	

#linha22:
	addi $9, $9, 416 # coluna 1

#1 Pixel marrom escuro	
	jal marrom_esc

#1 Pixel marrom
	jal marrom

#1 Pixel marrom escuro
	jal marrom_esc
	
#Pula 1
	addi $9, $9, 4

#1 Pixel preto
	jal preto

#5 Pixels verde escuro
	jal verde_grama
	jal verde_grama
	jal verde_grama
	jal verde_grama
	jal verde_grama

#3 Pixels verde claro
	jal verde_claro
	jal verde_claro
	jal verde_claro

#5 Pixels verde escuro
	jal verde_grama
	jal verde_grama
	jal verde_grama
	jal verde_grama
	jal verde_grama
		
#1 Pixel preto
	jal preto
	
#Pula 2
	addi $9, $9, 8
	
#1 Pixel marrom escuro	
	jal marrom_esc

#1 Pixel marrom
	jal marrom

#1 Pixel marrom escuro
	jal marrom_esc

#linha23:
	addi $9, $9, 416 # coluna 1

#1 Pixel marrom escuro	
	jal marrom_esc

#1 Pixel marrom
	jal marrom

#1 Pixel marrom escuro
	jal marrom_esc	
	
#Pula 1
	addi $9, $9, 4
	
#1 Pixel preto
	jal preto

#4 Pixels verde escuro
	jal verde_grama
	jal verde_grama
	jal verde_grama
	jal verde_grama

#1 Pixel verde claro
	jal verde_claro

#1 Pixel preto
	jal preto

#1 Pixel verde claro
	jal verde_claro

#1 Pixel preto
	jal preto
	
#1 Pixel verde claro
	jal verde_claro
	
#4 Pixels verde escuro
	jal verde_grama
	jal verde_grama
	jal verde_grama
	jal verde_grama

#1 Pixel preto
	jal preto
					
#Pula 2
	addi $9, $9, 8
	
#1 Pixel marrom escuro	
	jal marrom_esc

#1 Pixel marrom
	jal marrom

#1 Pixel marrom escuro
	jal marrom_esc	
	
#linha24:
	addi $9, $9, 416 # coluna 1

#1 Pixel marrom escuro	
	jal marrom_esc

#1 Pixel marrom
	jal marrom

#1 Pixel marrom escuro
	jal marrom_esc	
	
#Pula 2
	addi $9, $9, 8
	
#1 Pixel preto
	jal preto

#4 Pixels verde escuro
	jal verde_grama
	jal verde_grama
	jal verde_grama
	jal verde_grama

#3 Pixels verde claro
	jal verde_claro
	jal verde_claro
	jal verde_claro

#4 Pixels verde escuro
	jal verde_grama
	jal verde_grama
	jal verde_grama
	jal verde_grama
			
#1 Pixel preto
	jal preto
	
#Pula 3
	addi $9, $9, 12
	
#1 Pixel marrom escuro	
	jal marrom_esc

#1 Pixel marrom
	jal marrom

#1 Pixel marrom escuro
	jal marrom_esc	
	
#linha25:
	addi $9, $9, 416 # coluna 1
	
#1 Pixel marrom escuro	
	jal marrom_esc

#2 Pixels marrom
	jal marrom
	jal marrom

#Pula 3
	addi $9, $9, 12
	
#1 Pixel preto
	jal preto

#9 Pixels verde escuro
	jal verde_grama
	jal verde_grama
	jal verde_grama
	jal verde_grama	
	jal verde_grama
	jal verde_grama
	jal verde_grama
	jal verde_grama
	jal verde_grama
	
#1 Pixel preto
	jal preto
	
#Pula 4
	addi $9, $9, 16
	
#1 Pixel marrom escuro	
	jal marrom_esc

#1 Pixel marrom
	jal marrom

#1 Pixel marrom escuro
	jal marrom_esc	
	
#linha26:
	addi $9, $9, 416 # coluna 1
	
#1 Pixel marrom escuro	
	jal marrom_esc

#1 Pixel marrom
	jal marrom

#1 Pixel marrom escuro
	jal marrom_esc	
	
#Pula 4
	addi $9, $9, 16

#2 Pixels preto
	jal preto
	jal preto
	
#5 Pixels verde escuro
	jal verde_grama
	jal verde_grama
	jal verde_grama
	jal verde_grama	
	jal verde_grama

#2 Pixels preto
	jal preto
	jal preto

#Pula 5
	addi $9, $9, 20
			
#1 Pixel marrom escuro	
	jal marrom_esc

#1 Pixel marrom
	jal marrom

#1 Pixel marrom escuro
	jal marrom_esc	
	
#linha27:
	addi $9, $9, 416 # coluna 1

#3 Pixels marrom escuro	
	jal marrom_esc
	jal marrom_esc
	jal marrom_esc
	
#Pula 6
	addi $9, $9, 24
	
#5 Pixels preto
	jal preto
	jal preto
	jal preto
	jal preto
	jal preto

#Pula 7
	addi $9, $9, 28
	
#3 Pixels marrom escuro	
	jal marrom_esc
	jal marrom_esc
	jal marrom_esc

fim_pig:
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

marrom_esc:
	addi $10, $0, 0x663300 #cor: marrom
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

verde_claro:
	addi $10, $0, 0x66ff33 #cor: verde
	sw $10, 0($9) #print cor 
	addi $9, $9, 4 #proximo pixel
	jr $31	
	
azul_c:
	addi $10, $0, 0x87ceeb #cor: azul
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
