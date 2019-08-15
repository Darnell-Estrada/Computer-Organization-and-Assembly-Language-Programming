# DARNELL JAMES V. ESTRADA
# CS 2430 SEC 01
# ASSIGNMENT 2
# Addition

	.text
	.globl	main
main:	li	$a0,3
	addi	$a0,$a0,11
	addi	$a0,$a0,19
	li	$v0,1
	syscall
	li	$v0,10
	syscall
