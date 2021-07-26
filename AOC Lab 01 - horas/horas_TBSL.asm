# variaveis do programa
.data
	entradahh: .asciiz "Entre com as horas: "
	invalidohh: .asciiz " Valor inválido para as horas. Esperado número entre 0 e 23."
	
	entradamm: .asciiz "Entre com os minutos: "
	invalidomm: .asciiz " Valor inválido para os minutos. Esperado número entre 0 e 59."
	
	entradass: .asciiz "Entre com os segundos: "
	invalidoss: .asciiz " Valor inválido para os segundos. Esperado número entre 0 e 59."
	
	
	doispontos: .asciiz ":"
	saida: .asciiz "Horário digitado: "
	
# instrucoes do programa
.text
	
	li $a1 23

	li $v0, 4 # imprimir string
	la $a0, entradahh # indicar endereco da string
	syscall # faça

	li $v0, 5 # ler inteiro
	syscall
	move $s0, $v0 # copiar valor
	
	whilehh:
		slt $t1, $s0, $zero
		slt $t2, $a1, $s0
	
		or $t3, $t1, $t2
		beq $t3, $zero, saidahh
	
		li $v0, 4
		la $a0, invalidohh
		syscall
		
		li $v0, 4
		la $a0, entradahh
		syscall
		
		li $v0, 5 
		syscall
		move $s0, $v0 
		
		j whilehh
	
	
	saidahh:
		
		move $s1, $s0		
		
		li $a1 59

		li $v0, 4 # imprimir string
		la $a0, entradamm # indicar endereco da string
		syscall # faça

		li $v0, 5 # ler inteiro
		syscall
		move $s0, $v0 # copiar valor
	
		whilemm:
			slt $t1, $s0, $zero
			slt $t2, $a1, $s0
	
			or $t3, $t1, $t2
			beq $t3, $zero, saidamm
	
			li $v0, 4
			la $a0, invalidomm
			syscall
		
			li $v0, 4
			la $a0, entradamm
			syscall
		
			li $v0, 5 
			syscall
			move $s0, $v0 
		
			j whilemm
	
	
		saidamm:
		
			move $s2, $s0
			
			li $a1 59

			li $v0, 4 # imprimir string
			la $a0, entradass # indicar endereco da string
			syscall # faça

			li $v0, 5 # ler inteiro
			syscall
			move $s0, $v0 # copiar valor
	
			whiless:
				slt $t1, $s0, $zero
				slt $t2, $a1, $s0
	
				or $t3, $t1, $t2
				beq $t3, $zero, saidass
	
				li $v0, 4
				la $a0, invalidoss
				syscall
		
				li $v0, 4
				la $a0, entradass
				syscall
			
				li $v0, 5 
				syscall
				move $s0, $v0 
		
				j whiless
	
	
			saidass:
		
				move $s3, $s0
				
				
				li $v0, 4 
				la $a0, saida
				syscall
				
				li $v0, 1
				la $a0, ($s1)
				syscall
				
				li $v0, 4 
				la $a0, doispontos
				syscall
				
				li $v0, 1
				la $a0, ($s2)
				syscall
				
				li $v0, 4 
				la $a0, doispontos
				syscall
				
				li $v0, 1
				la $a0, ($s3)
				syscall
				
				
				
				