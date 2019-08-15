# DARNELL JAMES V. ESTRADA
# CS 2430 SEC 01
# ASSIGNMENT 4
# Reverse

	.data
MSG:	.asciiz	"Enter integer "
PUNCT1:	.asciiz	": "
PUNCT2:	.byte	' '
	.text
	.globl	main
main:	li	$t0,1
STORE:	li	$v0,4
	la	$a0,MSG
	syscall
	li	$v0,1
	move	$a0,$t0
	syscall
	li	$v0,4
	la	$a0,PUNCT1
	syscall
	li	$v0,5
	syscall
	subi	$sp,$sp,4
	sw	$v0,0($sp)
	addi	$t0,$t0,1
	bne	$t0,6,STORE
LOAD:	lw	$a0,0($sp)
	addi	$sp,$sp,4
	subi	$t0,$t0,1
	li	$v0,1
	syscall
	li	$v0,11
	lb	$a0,PUNCT2
	syscall
	bne	$t0,1,LOAD
EXIT:	li	$v0,10
	syscall
