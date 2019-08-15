# DARNELL JAMES V. ESTRADA
# CS 2430 SEC 01
# ASSIGNMENT 7
# Divide

	.data
MSG:	.asciiz	"Enter an integer: "
QUOT:	.asciiz	"Quotient: "
RMDR:	.asciiz	"\nRemainder: "
	.text
	.globl	main
main:	jal	INPUT
	move	$t0,$v0
	jal	INPUT
	move	$t1,$v0
	div	$t0,$t1
	jal	DISP
	li	$v0,10
	syscall
INPUT:	li	$v0,4
	la	$a0,MSG
	syscall
	li	$v0,5
	syscall
	jr	$ra
DISP:	li	$v0,4
	la	$a0,QUOT
	syscall
	li	$v0,1
	mflo	$a0
	syscall
	li	$v0,4
	la	$a0,RMDR
	syscall
	li	$v0,1
	mfhi	$a0
	syscall
	jr	$ra