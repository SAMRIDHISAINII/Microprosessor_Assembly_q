
.data
	arr:    .space 40 		# Declare array
	inpban:    .asciiz "Enter the numbers for array (10 ELEMENTS): "
	space:  .asciiz " , "
	
.text
	li $v0, 4 		# to print string inpban
	la $s0, arr
	la $a0, inpban
	syscall
	
	li $s1, 1
	li $s2, 0
	j loop

loop:	 			
	bgt $s1, 10, revprint
	li $v0, 5
	syscall
	
	sw $v0, arr($s2)
	add $s2, $s2, 4
	add $s1, $s1, 1
	j loop

revprint:
	sub $s2, $s2, 4
	sub $s1, $s1, 1
	beq $s1,0,exit
	li $v0, 1
	lw $t0,arr($s2)
	la $a0, ($t0)
	syscall
	bne $s1,0,sp
		
sp:	li $v0, 4
	la $a0 , space
	syscall
	j revprint
	
	
exit:	
	li $v0 10 		# syscall to terminate
	syscall
