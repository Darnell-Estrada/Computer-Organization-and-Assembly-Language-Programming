# DARNELL JAMES V. ESTRADA
# CS 2430 SEC 01
# ASSIGNMENT 2
# Characters

	.data
CHAR:	.byte	'S'
	.byte	'C'
	.byte	' '
	.byte	'3'
	.byte	'0'
	.text
	.globl	main
main:	li	$v0,4
	la	$a0,CHAR
	syscall
	li	$v0,10
	syscall
