# DARNELL JAMES V. ESTRADA
# CS 2430 SEC 01
# ASSIGNMENT 2
# Doubles

	.data
DUB1:	.double	9.9
DUB2:	.double	5.6
	.text
	.globl	main
main:	ldc1	$f0,DUB1
	ldc1	$f2,DUB2
	add.d	$f12,$f0,$f2
	li	$v0,3
	syscall
	li	$v0,10
	syscall