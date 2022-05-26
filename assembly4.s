

.data
	myArray: .word 100:3  		# Declaring an array in RAM having 3 elements each initialized
	newline : .asciiz "\n"
.text
main:
	 li $t0, 0
while:
	 beq $t0, 12, exit
	 lw $t6, myArray($t0)  		# Extracting from array
	 add $t0, $t0, 4
	 li $v0, 1
	 move $a0, $t6
	 syscall
	
	 li $v0, 4
	 la $a0, newline		#Print a new line
	 syscall
	 j while
exit:
	 li $v0, 10
	 syscall 
