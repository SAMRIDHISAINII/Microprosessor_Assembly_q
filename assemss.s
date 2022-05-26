
.data
	pi : .float 3.14
	valpi: .asciiz "The value of pi is : "
	valinp: .asciiz "\nEnter any floating-point number: "
	valout: .asciiz "\nThe user-entered floating-point number is: "
	addout: .asciiz "\nThe Addition result is "
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
	
	li $v0,4
	la $a0, addout
	syscall
	
	l.s $f3, pi
	add.s $f12, $f12, $f3
	li $v0, 2
	syscall
exit: 
	li $v0,10
	syscall


.data
	ft : .float 3.14
	secd: .float 2.56 
	firsflo: .asciiz "\nBefore Swapping, 1st value:  "
	secflo: .asciiz "\nBefore Swapping, 2nd value:  "
	swfirsflo: .asciiz "\nAfter Swapping, 1st value: "
	swsecflo: .asciiz "\nAfter Swapping, 2nd value: "
.text 
	l.s $f0, ft
	l.s $f1, secd
	li $v0,4
	la $a0, firsflo
	syscall

	mov.s $f12, $f0
	li $v0,2
	syscall
	
	li $v0,4
	la $a0, secflo
	syscall
	
	mov.s $f12, $f1
	li $v0,2
	syscall
	
	mov.s $f2,$f0
	mov.s $f0,$f1
	mov.s $f1,$f2
	li $v0,4
	la $a0, swfirsflo
	syscall

	mov.s $f12, $f0
	li $v0,2
	syscall
	
	li $v0,4
	la $a0, secflo
	syscall
	
	mov.s $f12, $f1 
	li $v0,2
	syscall
	
	
exit: 
	li $v0,10
	syscall
