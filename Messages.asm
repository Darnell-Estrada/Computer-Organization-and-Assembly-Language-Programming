# DARNELL JAMES V. ESTRADA
# CS 2430 SEC 01
# ASSIGNMENT 1
# Messages

	.data
MSG1:	.ascii	"Hello class."
MSG2:	.ascii	"\nThis is another line"
MSG3:	.asciiz	" and this is the extention of the previous line.\n"
	.text
	.globl	main
main:	li	$v0,4
	la	$a0,MSG1
	syscall
	li	$v0,10
	syscall