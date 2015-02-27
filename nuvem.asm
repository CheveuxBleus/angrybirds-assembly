main:	lui $9, 0x1004
	#18 linhas
	#30 colunas
	
print_cloud:
	
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
	
fim:	addi $2, $0, 10
	syscall

branco:
	addi $10, $0, 0xffffff #cor: branco
	sw $10, 0($9) #print cor 
	addi $9, $9, 4 #proximo pixel
	jr $31
