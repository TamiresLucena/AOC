# variaveis do programa
.data
	vetor: .space 400		# aloca 100 espaços de endereço
  	str: .space 10000		# aloca 100 palavras
		
	caracteres: .asciiz "Número total de caracteres: "
	palavras: .asciiz "Número total de palavras: "	
	repetidas: .asciiz "Palavras repetidas: "
	
	barran: .asciiz "\n"
	espaco: .asciiz " "
	
	texto: .space 10000
	
# instrucoes do programa	
.text
	la $s0, str			# str(0, ..., 900)
  	la $s1, vetor			# vetor(0, 32, 288)
	li $s2, 0	
	
	
	WHILE:
		mul   $s3, $s2, 100	# calcula posicao string
  		mul   $s4, $s2, 4	# calcula posicao vetor
  		add   $s3, $s0, $s3	# s3 = endereço string[s3]
  		add   $s4, $s1, $s4	# s4 = endereço vetor[s4]
		
		sw    $s3, 0($s4)	# salva endereço das posições iniciais de todas as string do vetor
	
		addi  $s2, $s2, 1	# contador
  		bne   $s2, 100, WHILE	# desvio se t0 != 3
	
		li $v0, 8
		la $a0, texto
		li $a1, 10000
		syscall
	
		move $t0, $a0
	
		la $s0, vetor		# endereço base vetor
		li $s1, 0    		# contador deslocamento vetor
		li $s5, 0		# contador deslocamento caracter
		lw $s2, 0($s0)		# carregar endereço da primeira string
	
	WHILECARAC:
		lb $t2, 0($t0)		# lendo a string em t0 bit a bit
		addi $t0, $t0, 1	# incrementa 1
		beqz $t2, ENDCARAC	# ve se acabou a string
		addi $t1, $t1, 1
		
		beq $t2, 10, PALAVRA
		beq $t2, 32, PALAVRA			
		
		add  $s3, $s2, $s5 	# calcula endereço
		sb   $t2, 0($s3)   	# salva caracter a caracter
		addi $s5, $s5, 1   	# proximo caracter
		
		j WHILECARAC
		
	ENDCARAC:
	
		addi $t1, $t1, -1
		move $s7, $t3	
				
		# imprimir string
		li $v0, 4 
		la $a0, caracteres
		syscall	
		
		li $v0, 1
		la $a0, ($t1)
		syscall
		
		# codigo para percorrer vetor de strigs
		la $s0, vetor		# base do vetor		
		addi $s1, $s1, 4	# s1 = ultima posicao do vetor
		li $s4, 0		# contador
		li $t8, 0 		#contador de palavras
		WHILEPALAVRA:
			add $s5, $s0, $s4		# s5 = base_vetor + s4
  			lw  $s5, 0($s5)
  			lb  $t1, 0($s5)
  			addi $s4, $s4, 4
  			
  			
  			sge $t2, $t1, 32
  			sle $t3, $t1, 64
  			
  			sge $t4,$t1, 91
  			sle $t5, $t1, 96
  			
  			and $t6, $t2, $t3
  			and $t7, $t4, $t5
  			
  			or $t7, $t6, $t7
  			
  			sge $t2, $t1, 123
  			sle $t3, $t1, 126
  			
  			and $t6, $t2, $t3
  			or $t7, $t6, $t7 	

  			bne $t7, $zero, CONTAPALAVRA
  			bne $s4, $s1, WHILEPALAVRA
  			
  			li $v0, 4 
			la $a0, barran
			syscall
			
  			# imprimir string
			li $v0, 4 
			la $a0, palavras
			syscall
		
			li $v0, 1
			move $a0, $s7
			syscall	
			
			
			# imprimir string
			li $v0, 4 
			la $a0, barran
			syscall
			
			li $v0, 4 
			la $a0, repetidas
			syscall

  			
  	
	li $s4, 0		# contador		
	
	
	
	WHILE2:	# pega primeira palavra
  		add  $s5, $s0, $s4		# s5 = base_vetor + s4
  		lw   $s5, 0($s5)		# carrega endereço da string
  		move  $s6, $s4
  		li $t3, 1
  		WHILE3: # pega palavra pra comparar
  			addi $s6, $s6, 4
  			add  $s7, $s0, $s6		# s5 = base_vetor + s6
  			lw   $s7, 0($s7)		# carrega endereço da string
  			li $t0, 0
  			WHILE4: # pega carac por carac das palavras pra comparar
  				add  $t1, $s5, $t0 
  				add  $t2, $s7, $t0
  				lb   $t1, 0($t1)
  				lb   $t2, 0($t2)
  				addi $t0, $t0, 1
  				bne  $t1, $t2, END5
  				bnez $t1, WHILE4 # se nao acabou palavra - compara prox carac
  				beqz $t3, END4
  				li $t3, 0
  				move $a0, $s5		        # string atual
  				syscall
  				la $a0, espaco		        # string atual
  				syscall		
  				END4:
  				sb $zero, 0($s7)
  		END5:
  		bne $s6, $s1, WHILE3
	addi $s4, $s4, 4		# s4 = s4 + 32
	bne  $s4, $s1, WHILE2
		
	# fim do codigo para percorrer string		
	j TERMINAR
		
	PALAVRA:
		li   $s5, 0       	# reseta contador de caracter
		addi $s1, $s1, 4	# s1 = s1 + 4
		add  $s3, $s0, $s1	# calcula endereço do vetor
		lw   $s2, 0($s3)	# carrega endereço de string
		addi $t3, $t3, 1 	# contador de palavras
		j WHILECARAC
	
		
	CONTAPALAVRA:
  		subi $s7, $s7, 1
  		j WHILEPALAVRA
		
		
	TERMINAR:
		# termina o programa
		li $v0, 10
		syscall
