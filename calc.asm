main:
	jal fxAjuda
	b start
	
start:
	addi $s0, $0, 0	# Inicia o $s0 com o valor 0
	
	jal fxDigiteNumero
	move $s0, $s3	# move valor lido para t0
	
	b calc
	
calc:
	jal fxDigiteOperador
	
	jal fxDigiteNumero
	move $s2, $s3	
	
	addi $t0, $0, 0x2b			# +
	beq $s1, $t0, somaC			# if ==
	
	addi $t0, $0, 0x2d			# -
	beq $s1, $t0, subC			# if ==
	
	addi $t0, $0, 0x2a			# *
	beq $s1, $t0, multiC		# if ==
	
	addi $t0, $0, 0x2f			# /
	beq $s1, $t0, divC			# if ==
	
	jal fxLabelOperadorInvalido
	
	b calc
	
#############################################################################
#						Funções da calculadora								#
#############################################################################
# Soma o valor anterior com o novo
somaC:
	add $s3, $s0, $s2
	b resultado

# Subtrai o valor anterior com o novo
subC:
	sub $s3, $s0, $s2
	b resultado

# Multiplica o valor anterior com o novo
multiC:
	mul $s3, $s0, $s2
	b resultado

# Divide o valor anterior com o novo
divC:
	beq	$s3, 0, calc	# Divisão por 0 = Erro, Previne o fim do programa
	div $s3, $s0, $s2
	b resultado
	


#############################################################################
#								Funções										#
#############################################################################
# Pede ao utilizador para digitar um numero e guarda o numero no s3
fxDigiteNumero:
	la $a0,szDigiteNumero
	li $v0, 4		#parametro de escrita string
	syscall 
	
	# Le numero
	li $v0, 5		#parametro de leitura int
	syscall	
	move $s3, $v0	# move valor lido para s3
	
	jr $ra			# Volta a execução
	
# Pede ao utilizador para digitar o operador e guarda no s1
fxDigiteOperador:
	la $a0, szDigiteOperador
	li $v0, 4			#parametro de escrita string
	syscall 
	
	li $v0, 12			#parametro de leitura char
	#la $a0, operador
	syscall 
	move $s1, $v0
	
	jr $ra
	

