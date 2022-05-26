.data
	arr:    .space 40 		# declare array
	start:    .asciiz "Enter the first number: "
	end: .asciiz "Enter the second numer: "
	sum: .asciiz "Sum is : "
	
.text
	li $v0, 4 		# to print string start
	la $s0, arr
	la $a0 start
	syscall
	
	li $v0, 5		# Get start range
	syscall
	
	sw $v0, ($s0)
	li $v0, 4 		
	la $a0 end		# to print string end
	syscall
	
	li $v0, 5		# Get end range
	syscall
	
	sw $v0, 4($s0)
	lw $s1, 0($s0)
	lw $s2, 4($s0)
	li $s3, 0
	j loop

loop:	 			
	bgt $s1, $s2, print
	add $s3, $s3, $s1  	# adding in series
	add $s1, $s1, 1
	j loop
print:
	sw $s3, 8($s0)
	li $v0, 4 		
	la $a0 sum
	syscall
	
	li $v0, 1
	la $a0, ($s3)
	syscall
	
	li $v0 10 		# syscall to terminate
	syscall





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




.data
	arr: .word 10, 60, 40, 70, 20, 30, 90, 100, 0, 80, 50
  	space: .asciiz " "
.text
.globl main

main:
  	lui $s0, 0x1001                   #arr[0]
  	li $t0, 0                         #i = 0
	li $t1, 0                         #j = 0
	li $s1, 11                        #n = 11
	li $s2, 11                        #n-i for inner loop
  	add $t2, $zero, $s0               #for iterating addr by i
  	add $t3, $zero, $s0               #for iterating addr by j

 	addi $s1, $s1, -1

outer_loop:
  	li  $t1, 0                        #j = 0
  	addi $s2, $s2, -1                 #decreasing size for inner_loop
  	add $t3, $zero, $s0               #resetting addr itr j

inner_loop:
    	lw $s3, 0($t3)                  #arr[j]
    	addi $t3, $t3, 4                #addr itr j += 4
    	lw $s4, 0($t3)                  #arr[j+1]
    	addi $t1, $t1, 1                #j++

    	slt $t4, $s3, $s4               #set $t4 = 1 if $s3 < $s4
    	bne $t4, $zero, cond
swap:
      	sw $s3, 0($t3)
      	sw $s4, -4($t3)
      	lw $s4, 0($t3)

cond:
	bne $t1, $s2, inner_loop      #j != n-i
	addi $t0, $t0, 1                  #i++
	bne $t0, $s1, outer_loop           #i != n
	li $t0, 0
	addi $s1, $s1, 1

print_loop:
	li $v0, 1
	lw $a0, 0($t2)
	syscall
	  
	li $v0, 4
	la $a0, space
	syscall

	addi $t2, $t2, 4                  #addr itr i += 4
	addi $t0, $t0, 1                  #i++
	bne $t0, $s1, print_loop          #i != n

exit:
  	li $v0, 10
  	syscall




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
