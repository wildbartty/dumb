	.file	"dumb.c"
	.text
	.section	.rodata
.LC0:
	.string	"%lu\n"
	.align 8
.LC1:
	.string	"Time taken %d seconds %d milliseconds"
	.text
	.globl	main
	.type	main, @function
main:
.LFB0:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	call	clock@PLT
	movq	%rax, -16(%rbp)
	movq	$0, -24(%rbp)
	jmp	.L2
.L4:
	movq	-24(%rbp), %rcx
	movabsq	$4835703278458516699, %rdx
	movq	%rcx, %rax
	mulq	%rdx
	movq	%rdx, %rax
	shrq	$18, %rax
	imulq	$1000000, %rax, %rax
	subq	%rax, %rcx
	movq	%rcx, %rax
	testq	%rax, %rax
	jne	.L3
	movq	-24(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC0(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
.L3:
	addq	$1, -24(%rbp)
.L2:
	movl	$4294967295, %eax
	cmpq	%rax, -24(%rbp)
	jbe	.L4
	call	clock@PLT
	subq	-16(%rbp), %rax
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rcx
	movabsq	$2361183241434822607, %rdx
	movq	%rcx, %rax
	imulq	%rdx
	sarq	$7, %rdx
	movq	%rcx, %rax
	sarq	$63, %rax
	subq	%rax, %rdx
	movq	%rdx, %rax
	movl	%eax, -28(%rbp)
	movl	-28(%rbp), %esi
	movl	$274877907, %edx
	movl	%esi, %eax
	imull	%edx
	sarl	$6, %edx
	movl	%esi, %eax
	sarl	$31, %eax
	movl	%edx, %ecx
	subl	%eax, %ecx
	imull	$1000, %ecx, %eax
	subl	%eax, %esi
	movl	%esi, %ecx
	movl	-28(%rbp), %esi
	movl	$274877907, %edx
	movl	%esi, %eax
	imull	%edx
	sarl	$6, %edx
	movl	%esi, %eax
	sarl	$31, %eax
	subl	%eax, %edx
	movl	%edx, %eax
	movl	%ecx, %edx
	movl	%eax, %esi
	leaq	.LC1(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	movl	$0, %eax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	main, .-main
	.ident	"GCC: (GNU) 8.2.0"
	.section	.note.GNU-stack,"",@progbits
