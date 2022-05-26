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


