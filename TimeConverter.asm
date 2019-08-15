# DARNELL JAMES V. ESTRADA
# CS 2430 SEC 01
# ASSIGNMENT 8
# Time Converter

	.data
MSG:	.asciiz	"Enter an integer amount in seconds: "
DAY:	.asciiz	"Days: "
HR:	.asciiz	"\nHours: "
MIN:	.asciiz	"\nMinutes: "
SEC:	.asciiz	"\nSeconds: "
	.text
	.globl	main
main:	li	$v0,4
	la	$a0,MSG
	syscall
	li	$v0,5
	syscall
	move	$a1,$v0
	li	$a2,86400
	li	$v0,4
	la	$a0,DAY
	syscall
	jal	DIV
	move	$a0,$v0
	li	$v0,1
	syscall
	move	$a1,$v1
	li	$a2,3600
	li	$v0,4
	la	$a0,HR
	syscall
	jal	DIV
	move	$a0,$v0
	li	$v0,1
	syscall
	move	$a1,$v1
	li	$a2,60
	li	$v0,4
	la	$a0,MIN
	syscall
	jal	DIV
	move	$a0,$v0
	li	$v0,1
	syscall
	li	$v0,4
	la	$a0,SEC
	syscall
	move	$a0,$v1
	li	$v0,1
	syscall
	li	$v0,10
	syscall
DIV:	div	$a1,$a2
	mflo	$v0
	mfhi	$v1
	jr	$ra