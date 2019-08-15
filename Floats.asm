# DARNELL JAMES V. ESTRADA
# CS 2430 SEC 01
# ASSIGNMENT 2
# Floats

	.data
ID:	.asciiz	"pi = "
PI:	.float	3.14
	.text
	.globl	main
main:	li	$v0,4
	la	$a0,ID
	syscall
	li	$v0,2
	lwc1	$f12,PI
	syscall
	li	$v0,10
	syscall