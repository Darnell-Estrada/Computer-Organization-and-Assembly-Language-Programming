# DARNELL JAMES V. ESTRADA
# CS 2430 SEC 01
# ASSIGNMENT 10
# 2D Array
# Assignment: Have the user enter 24 integers and store them in a 2D array.
# After that, when the user enters a row number and a column number,
# the program will display the contents of that position in the array.
# A display of the 2D array is provided afterwards to varify the location
# with its contents.

	.data
	.align	2
ARR:	.space	96
MSG1:	.ascii	"Enter 24 integers into a 2D array."
MSG2:	.ascii	"\nNOTE: Use similar significant figures"
MSG3:	.asciiz	"\nto minimize disfigurement in the table.\n"
MSG4:	.asciiz	"Enter integer: "
MSG5:	.ascii	"Find an integer by typing its positon."
MSG6:	.asciiz	"\nEnter a row between 1 and 6: "
MSG7:	.asciiz	"Enter a column between 1 and 4: "
MSG8:	.asciiz	"Value at ROW "
MSG9:	.asciiz	", COLUMN "
MSG10:	.asciiz	": "
MSG11:	.asciiz	"\n"
MSG12:	.byte	' '
	.text
	.globl	main
main:	li	$t0,0
	la	$t1,ARR
	li	$v0,4
	la	$a0,MSG1
	syscall
ENT:	li	$v0,4
	la	$a0,MSG4
	syscall
	li	$v0,5
	syscall
	sw	$v0,ARR($t0)
	addi	$t0,$t0,4
	bne	$t0,96,ENT
	li	$v0,4
	la	$a0,MSG5
	syscall
	li	$v0,5
	syscall
	subiu	$t0,$v0,1
	li	$v0,4
	la	$a0,MSG7
	syscall
	li	$v0,5
	syscall
	subiu	$t2,$v0,1
	li	$v0,4
	la	$a0,MSG8
	syscall
	li	$v0,1
	addiu	$a0,$t0,1
	syscall
	li	$v0,4
	la	$a0,MSG9
	syscall
	li	$v0,1
	addiu	$a0,$t2,1
	syscall
	li	$v0,4
	la	$a0,MSG10
	syscall
	addu	$t3,$t0,$t2
	beqz	$t3,ZERO
	sll	$t3,$t0,4
	sll	$t4,$t0,3
	addu	$t0,$t3,$t4
	sll	$t2,$t2,2
	add	$t0,$t0,$t2
	lw	$t0,ARR($t0)
	b	LOC
ZERO:	lw	$t0,ARR
LOC:	li	$v0,1
	move	$a0,$t0
	syscall
	li	$t0,0
YLOOP:	li	$t1,0
XLOOP:	li	$v0,1
	lw	$a0,ARR($t0)
	syscall
	li	$v0,11
	la	$a0,MSG12
	syscall
	addi	$t0,$t0,4
	bne	$t0,96,XLOOP
	li	$v0,4
	la	$a0,MSG11
	syscall
	addi	$t1,$t1,4
	bne	$t1,96,YLOOP
EXIT:	li	$v0,10
	syscall
