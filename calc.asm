	.file	"calc.c"
	.text
	.section	.rodata
	.align 8
.LC0:
	.string	"Calculadora Assembly!\n Escolha uma operacao "
	.align 8
.LC1:
	.string	"Soma(+)\n Subtracao(-)\n Multiplicacao(*)\n Divisao(/):"
.LC2:
	.string	"%c"
.LC3:
	.string	"Digite o primeiro numero: "
.LC4:
	.string	"%d"
.LC5:
	.string	"Digite o segundo numero: "
.LC6:
	.string	"A soma = %d"
.LC7:
	.string	"A subtracao = %d"
.LC8:
	.string	"A multiplicacao = %d"
.LC9:
	.string	"A divisao = %d"
	.align 8
.LC10:
	.string	"Nenhum nummero pode ser dividido por zero!\n"
.LC11:
	.string	"Operacao invalida!\n"
	.text
	.globl	main
	.type	main, @function
main:
.LFB0:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	leaq	.LC0(%rip), %rdi
	call	puts@PLT
	leaq	.LC1(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	leaq	-17(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC2(%rip), %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
	leaq	.LC3(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	leaq	-16(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC4(%rip), %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
	leaq	.LC5(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	leaq	-12(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC4(%rip), %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
	movzbl	-17(%rbp), %eax
	movsbl	%al, %eax
	cmpl	$47, %eax
	je	.L2
	cmpl	$47, %eax
	jg	.L3
	cmpl	$45, %eax
	je	.L4
	cmpl	$45, %eax
	jg	.L3
	cmpl	$42, %eax
	je	.L5
	cmpl	$43, %eax
	jne	.L3
	movl	-16(%rbp), %edx
	movl	-12(%rbp), %eax
	addl	%edx, %eax
	movl	%eax, %esi
	leaq	.LC6(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	jmp	.L6
.L4:
	movl	-16(%rbp), %edx
	movl	-12(%rbp), %eax
	subl	%eax, %edx
	movl	%edx, %eax
	movl	%eax, %esi
	leaq	.LC7(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	jmp	.L6
.L5:
	movl	-16(%rbp), %edx
	movl	-12(%rbp), %eax
	imull	%edx, %eax
	movl	%eax, %esi
	leaq	.LC8(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	jmp	.L6
.L2:
	movl	-12(%rbp), %eax
	testl	%eax, %eax
	je	.L7
	movl	-16(%rbp), %eax
	movl	-12(%rbp), %ecx
	cltd
	idivl	%ecx
	movl	%eax, %esi
	leaq	.LC9(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	jmp	.L6
.L7:
	leaq	.LC10(%rip), %rdi
	call	puts@PLT
	jmp	.L6
.L3:
	leaq	.LC11(%rip), %rdi
	call	puts@PLT
	nop
.L6:
	movl	$0, %eax
	movq	-8(%rbp), %rcx
	xorq	%fs:40, %rcx
	je	.L10
	call	__stack_chk_fail@PLT
.L10:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	main, .-main
	.ident	"GCC: (Ubuntu 9.3.0-17ubuntu1~20.04) 9.3.0"
	.section	.note.GNU-stack,"",@progbits
	.section	.note.gnu.property,"a"
	.align 8
	.long	 1f - 0f
	.long	 4f - 1f
	.long	 5
0:
	.string	 "GNU"
1:
	.align 8
	.long	 0xc0000002
	.long	 3f - 2f
2:
	.long	 0x3
3:
	.align 8
4:
