# DARNELL JAMES V. ESTRADA
# CS 2430 SEC 01
# ASSIGNMENT 2
# Integers

	.data
MONTH:	.asciiz	"April "
PUNCT:	.asciiz	", "
DAY:	.word	18
YEAR:	.word	2016
	.text
	.globl	main
main:	li	$v0,4
	la	$a0,MONTH
	syscall
	li	$v0,1
	lw	$a0,DAY
	syscall
	li	$v0,4
	la	$a0,PUNCT
	syscall
	li	$v0,1
	lw	$a0,YEAR
	syscall
	li	$v0,10
	syscall