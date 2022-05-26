.data
	pi : .float 3.14
	valpi: .asciiz "The value of pi is : "
	valinp: .asciiz "\nEnter any floating-point number: "
	valout: .asciiz "\nThe user-entered floating-point number is: "
.text 

	li $v0,4
	la $a0, valpi
	syscall

	l.s $f12, pi
	li $v0,2
	syscall
	
	li $v0,4
	la $a0, valinp
	syscall
	
	li $v0,6
	syscall
	
	li $v0,4
	la $a0, valout
	syscall
	
	mov.s $f12 ,$f0
	li $v0, 2
	syscall
exit: 
	li $v0,10
	syscall
