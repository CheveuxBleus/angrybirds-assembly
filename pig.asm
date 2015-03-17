main:	lui $9, 0x1004
	#tamanho da lateral (colunas) = 26
	#tamanho vertical (linhas) = 27
	
print_pig:

linha1: 
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

linha2:
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
	
linha3:
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

linha4:
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
		
linha5:
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

linha6:
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

linha7:
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
	
linha8:
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

linha9:
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
	
linha10:
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

linha11:
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

linha12:
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
	
linha13:
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

linha14:
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
	
linha15:
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
		
linha16:
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
	
linha17:
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

linha18:
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
	
linha19:
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

linha20:
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

linha21:
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

linha22:
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

linha23:
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
	
linha24:
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
	
linha25:
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
	
linha26:
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
	
linha27:
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
		
fim:
	addi $2, $0, 10
	syscall

preto:
	addi $10, $0, 0x0 #cor: preto
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
	
marrom_esc:
	addi $10, $0, 0x663300 #cor: marrom
	sw $10, 0($9) #print cor 
	addi $9, $9, 4 #proximo pixel
	jr $31