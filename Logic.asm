# DARNELL JAMES V. ESTRADA
# CS 2430 SEC 01
# ASSIGNMENT 6
# Logic

	.data
ID:	.asciiz	"$t0 = "
NEWL:	.asciiz	"\n"
	.text
	.globl	main
main:	li	$t0,0x12345678
	li	$v0,4
	la	$a0,ID
	syscall
	li	$v0,1
	move	$a0,$t0
	syscall
	lui	$t0,0x1234
	ori	$t0,$t0,0x5678
	li	$v0,4
	la	$a0,NEWL
	syscall
	li	$v0,4
	la	$a0,ID
	syscall
	li	$v0,1
	move	$a0,$t0
	syscall
	li	$v0,10
	syscall