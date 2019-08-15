# DARNELL JAMES V. ESTRADA
# CS 2430 SEC 01
# ASSIGNMENT 3
# Input

	.data
MSG1:	.asciiz	"Enter the first integer: "
MSG2:	.asciiz	"Enter the second integer: "
MSG3:	.asciiz	"First integer entered: "
MSG4:	.asciiz	"\nSecond integer entered: "
RES:	.asciiz	"\nSum of two integers: "
	.text
	.globl	main
main:	li	$v0,4
	la	$a0,MSG1
	syscall
	li	$v0,5
	syscall
	move	$t0,$v0
	li	$v0,4
	la	$a0,MSG2
	syscall
	li	$v0,5
	syscall
	move	$t1,$v0
	li	$v0,4
	la	$a0,MSG3
	syscall
	li	$v0,1
	move	$a0,$t0
	syscall
	li	$v0,4
	la	$a0,MSG4
	syscall
	li	$v0,1
	move	$a0,$t1
	syscall
	li	$v0,4
	la	$a0,RES
	syscall
	add	$t0,$t0,$t1
	li	$v0,1
	move	$a0,$t0
	syscall
	li	$v0,10
	syscall
