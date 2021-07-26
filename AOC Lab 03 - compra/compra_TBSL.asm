# variaveis do programa
.data
	produto_print: .asciiz "Digite o nome do produto: "
	valor_print: .asciiz "Insira o valor unitário deste produto: "	
	quantidade_print: .asciiz "Insira a quantidade desejada deste produto: "
	
	continuar_print: .asciiz "Deseja comprar algo a mais? Se sim, digite 1. Caso contrário, digite 0. Resposta: "
	
	pedido_print: .asciiz "Pedido:"
	unitario_print: .asciiz "Valor unitário: R$ "
	totalproduto_print: .asciiz "Valor total do produto: R$ "
	totalpedido_print: .asciiz "Valor total do pedido: R$ "
	
	xis_print: .asciiz "x "
	barran_print: .asciiz "\n"
	
	produto1: .space 100
	produto2: .space 100	
	produto3: .space 100	
	produto4: .space 100
	produto5: .space 100
	
	zero: .float 0.0
	
# instrucoes do programa
.text

	lwc1 $f6, zero # 0.0
	li $t5, 100 # pra converter
	li $s7, 0 # contador
	

	li $v0, 4 # imprimir string 
	la $a0, produto_print 
	syscall 
	
	li, $v0, 8
	la, $a0, produto1
	la, $a1, 100
	syscall
	
	li $v0, 4 
	la $a0, valor_print 
	syscall 
	
	li, $v0, 6
	syscall
	
	add.s $f1, $f6, $f0
	
	li $v0, 4 
	la $a0, quantidade_print 
	syscall
	
	li, $v0, 5
	syscall
	move $s1, $v0
	
	
	li $v0, 4
	la $a0, barran_print
	syscall 
	
	li $v0, 4
	la $a0, continuar_print
	syscall 
	
	li, $v0, 5
	syscall
	move $s0, $v0
	
	li $v0, 4
	la $a0, barran_print
	syscall 
	
	addi  $s7, $s7, 1
	
	
	beq $s0, $zero, SAIDA
	
	li $v0, 4 # imprimir string
	la $a0, produto_print 
	syscall 
	
	li, $v0, 8
	la, $a0, produto2
	la, $a1, 100
	syscall
	
	li $v0, 4 
	la $a0, valor_print 
	syscall 
	
	li, $v0, 6
	syscall
	
	
	add.s $f2, $f6, $f0
	
	li $v0, 4 
	la $a0, quantidade_print 
	syscall
	
	li, $v0, 5
	syscall
	move $s2, $v0
	
	
	li $v0, 4
	la $a0, barran_print
	syscall 
	
	li $v0, 4
	la $a0, continuar_print
	syscall 
	
	li, $v0, 5
	syscall
	move $s0, $v0
	
	li $v0, 4
	la $a0, barran_print
	syscall 
	
	addi  $s7, $s7, 1
	
	beq $s0, $zero, SAIDA
	
	li $v0, 4 # imprimir string
	la $a0, produto_print 
	syscall 
	
	li, $v0, 8
	la, $a0, produto3
	la, $a1, 100
	syscall
	
	li $v0, 4 
	la $a0, valor_print 
	syscall 
	
	li, $v0, 6
	syscall
	
	
	add.s $f3, $f6, $f0
	
	li $v0, 4 
	la $a0, quantidade_print 
	syscall
	
	li, $v0, 5
	syscall
	move $s3, $v0
	
	
	li $v0, 4
	la $a0, barran_print
	syscall 
	
	li $v0, 4
	la $a0, continuar_print
	syscall 
	
	li, $v0, 5
	syscall
	move $s0, $v0
	
	li $v0, 4
	la $a0, barran_print
	syscall 
	
	addi  $s7, $s7, 1
	
	beq $s0, $zero, SAIDA
	
	li $v0, 4 # imprimir string
	la $a0, produto_print 
	syscall 
	
	li, $v0, 8
	la, $a0, produto4
	la, $a1, 100
	syscall
	
	li $v0, 4 
	la $a0, valor_print 
	syscall 
	
	li, $v0, 6
	syscall
	
	
	add.s $f4, $f6, $f0
	
	li $v0, 4 
	la $a0, quantidade_print 
	syscall
	
	li, $v0, 5
	syscall
	move $s4, $v0
	
	
	li $v0, 4
	la $a0, barran_print
	syscall 
	
	li $v0, 4
	la $a0, continuar_print
	syscall 
	
	li, $v0, 5
	syscall
	move $s0, $v0
	
	li $v0, 4
	la $a0, barran_print
	syscall 
	
	addi  $s7, $s7, 1
	
	beq $s0, $zero, SAIDA
	
	li $v0, 4 # imprimir string
	la $a0, produto_print 
	syscall 
	
	li, $v0, 8
	la, $a0, produto5
	la, $a1, 100
	syscall
	
	li $v0, 4 
	la $a0, valor_print 
	syscall 
	
	li, $v0, 6
	syscall
	
	
	add.s $f5, $f6, $f0
	
	li $v0, 4 
	la $a0, quantidade_print 
	syscall
	
	li, $v0, 5
	syscall
	move $s5, $v0
	
	
	li $v0, 4
	la $a0, barran_print
	syscall 
	
	addi  $s7, $s7, 1
	

	
	SAIDA:
	
		li $v0, 4 
		la $a0, pedido_print
		syscall	
	
		li $v0, 4
		la $a0, barran_print
		syscall 
	
		li $v0, 4
		la $a0, barran_print
		syscall 
	
		li $v0, 1
		la $a0, ($s1)
		syscall
	
		li $v0, 4 
		la $a0, xis_print
		syscall	
	
		li $v0, 4 
		la $a0, produto1 
		syscall 
	
	
		li $v0, 4 
		la $a0, unitario_print
		syscall	
	
		add.s $f12, $f1, $f6
		li $v0, 2
		syscall 
	
		li $v0, 4
		la $a0, barran_print
		syscall 
	
	
		mtc1 $s1, $f11
  		cvt.s.w $f11, $f11
  		
  		
  		
  	
  		mul.s $f11, $f12, $f11
  	
  		                            
		mtc1 $t5,$f7                 
		cvt.s.w $f7,$f7 
		
  		mul.s $f11, $f11, $f7
  		round.w.s $f11, $f11
  		cvt.s.w $f11,$f11
  		div.s $f12,$f11,$f7
  	 
		li $v0, 4 
		la $a0, totalproduto_print
		syscall	
	
		li $v0, 2
		syscall 
		
		
		add.s $f30, $f12, $f30
		
		

		subi  $s7, $s7, 1
		
	
	
	
	#-------------------------------------------
	
	
		beq $s7, $0, TERMINAR
	
		li $v0, 4
		la $a0, barran_print
		syscall 
	
		li $v0, 4
		la $a0, barran_print
		syscall 
	
		li $v0, 1
		la $a0, ($s2)
		syscall
	
		li $v0, 4 
		la $a0, xis_print
		syscall	
	
		li $v0, 4 
		la $a0, produto2 
		syscall 
	
	
		li $v0, 4 
		la $a0, unitario_print
		syscall	
	
		add.s $f12, $f2, $f6
		li $v0, 2
		syscall 
	
		li $v0, 4
		la $a0, barran_print
		syscall 
	
	
		mtc1 $s2, $f11
  		cvt.s.w $f11, $f11
  	
  		mul.s $f11, $f12, $f11
  	                           
		mtc1 $t5,$f7                       
		cvt.s.w $f7,$f7 
		
  		mul.s $f11, $f11, $f7
  		round.w.s $f11, $f11
  		cvt.s.w $f11,$f11
  		div.s $f12,$f11,$f7
  	 
		li $v0, 4 
		la $a0, totalproduto_print
		syscall	
	
		li $v0, 2
		syscall 
		
		add.s $f30, $f12, $f30
	
	
		subi  $s7, $s7, 1
		
	
	
	
	#-------------------------------------------
	
	
		beq $s7, $0, TERMINAR
	
	
	
		li $v0, 4
		la $a0, barran_print
		syscall 
	
		li $v0, 4
		la $a0, barran_print
		syscall 
	
		li $v0, 1
		la $a0, ($s3)
		syscall
	
		li $v0, 4 
		la $a0, xis_print
		syscall	
	
		li $v0, 4 
		la $a0, produto3 
		syscall 
	
	
		li $v0, 4 
		la $a0, unitario_print
		syscall	
	
		add.s $f12, $f3, $f6
		li $v0, 2
		syscall 
	
		li $v0, 4
		la $a0, barran_print
		syscall 
	
	
		mtc1 $s3, $f11
  		cvt.s.w $f11, $f11
  	
  		mul.s $f11, $f12, $f11
  	                           
		mtc1 $t5,$f7                     
		cvt.s.w $f7,$f7
		
  		mul.s $f11, $f11, $f7
  		round.w.s $f11, $f11
  		cvt.s.w $f11,$f11
  		div.s $f12,$f11,$f7
  	 
		li $v0, 4 
		la $a0, totalproduto_print
		syscall	
	
		li $v0, 2
		syscall 
		
		add.s $f30, $f12, $f30
		
		subi  $s7, $s7, 1
		
	
	
	
	#-------------------------------------------
	
	
		beq $s7, $0, TERMINAR
	
	
	
		li $v0, 4
		la $a0, barran_print
		syscall 
	
		li $v0, 4
		la $a0, barran_print
		syscall 
	
		li $v0, 1
		la $a0, ($s4)
		syscall
	
		li $v0, 4 
		la $a0, xis_print
		syscall	
	
		li $v0, 4 
		la $a0, produto4
		syscall 
	
	
		li $v0, 4 
		la $a0, unitario_print
		syscall	
	
		add.s $f12, $f4, $f6
		li $v0, 2
		syscall 
	
		li $v0, 4
		la $a0, barran_print
		syscall 
	
	
		mtc1 $s4, $f11
  		cvt.s.w $f11, $f11
  	
  		mul.s $f11, $f12, $f11
  	
                            
		mtc1 $t5,$f7                           
		cvt.s.w $f7,$f7
		
  		mul.s $f11, $f11, $f7
  		round.w.s $f11, $f11
  		cvt.s.w $f11,$f11
  		div.s $f12,$f11,$f7
  	 
		li $v0, 4 
		la $a0, totalproduto_print
		syscall	
	
		li $v0, 2
		syscall 
		
		
		add.s $f30, $f12, $f30
	
	
		subi  $s7, $s7, 1
		
	
	
	
	#-------------------------------------------
	
	
		beq $s7, $0, TERMINAR
	
	
	
		li $v0, 4
		la $a0, barran_print
		syscall 
	
		li $v0, 4
		la $a0, barran_print
		syscall 
	
		li $v0, 1
		la $a0, ($s5)
		syscall
	
		li $v0, 4 
		la $a0, xis_print
		syscall	
	
		li $v0, 4 
		la $a0, produto5
		syscall 
	
	
		li $v0, 4 
		la $a0, unitario_print
		syscall	
	
		add.s $f12, $f5, $f6
		li $v0, 2
		syscall 
	
		li $v0, 4
		la $a0, barran_print
		syscall 
	
	
		mtc1 $s5, $f11
  		cvt.s.w $f11, $f11
  	
  		mul.s $f11, $f12, $f11
  		
  	                           
		mtc1 $t5,$f7                           
		cvt.s.w $f7,$f7
		
  		mul.s $f11, $f11, $f7
  		round.w.s $f11, $f11
  		cvt.s.w $f11,$f11
  		div.s $f12,$f11,$f7
  	 
		li $v0, 4 
		la $a0, totalproduto_print
		syscall	
	
		li $v0, 2
		syscall 
		
		li $v0, 4
		la $a0, barran_print
		syscall
		
		
		add.s $f30, $f12, $f30	
		
		
		
		
		
	TERMINAR:
	
		li $v0, 4
		la $a0, barran_print
		syscall
		
		li $v0, 4
		la $a0, barran_print
		syscall
	
		li $v0, 4 
		la $a0, totalpedido_print
		syscall	
		
		add.s $f12, $f30, $f6
		li $v0, 2
		syscall
		
		li $v0, 4
		la $a0, barran_print
		syscall
	
		# termina o programa
		li $v0, 10
		syscall
		
		
	
	
	
	
	
	
				
				
				
