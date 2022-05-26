

.data
	pi : .float 3.14
	valpi: .asciiz "The value of pi is : "
.text 

	li $v0,4
	la $a0, valpi
	syscall

	l.s $f12, pi
	li $v0,2
	syscall
exit: 
	li $v0,10
	syscall


