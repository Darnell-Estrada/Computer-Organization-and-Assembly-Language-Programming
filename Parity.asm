# DARNELL JAMES V. ESTRADA
# CS 2430 SEC 01
# ASSIGNMENT 5
# Parity

	.data
MSG1:	.asciiz	"Enter an integer: "
MSG2:	.asciiz	"Your integer is "
MSG3:	.asciiz	"even."
MSG4:	.asciiz	"odd."
	.text
	.globl	main
main:	li	$v0,4
	la	$a0,MSG1
	syscall
	li	$v0,5
	syscall
	andi	$t0,$v0,1
	li	$v0,4
	la	$a0,MSG2
	syscall
	beqz	$t0,EVEN
	li	$v0,4
	la	$a0,MSG4
	syscall
	b	EXIT
EVEN:	li	$v0,4
	la	$a0,MSG3
	syscall
EXIT:	li	$v0,10
	syscall
