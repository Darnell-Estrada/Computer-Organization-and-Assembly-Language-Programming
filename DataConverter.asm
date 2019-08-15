# DARNELL JAMES V. ESTRADA
# CS 2430 SEC 01
# ASSIGNMENT 9
# Data Converter

	.data
MSG1:	.asciiz	"Enter first character: "
MSG2:	.asciiz	"\nEnter second character: "
RES:	.asciiz	"\nInteger: "
	.text
	.globl	main
main:	li	$v0,4
	la	$a0,MSG1
	syscall
	li	$v0,12
	syscall
	move	$t0,$v0
	li	$v0,4
	la	$a0,MSG2
	syscall
	li	$v0,12
	syscall
	move	$t1,$v0
	subi	$t0,$t0,48
	subi	$t1,$t1,48
	mul	$t0,$t0,10
	add	$t0,$t0,$t1
	li	$v0,4
	la	$a0,RES
	syscall
	li	$v0,1
	move	$a0,$t0
	syscall
	li	$v0,10
	syscall