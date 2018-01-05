.data 0x10000800
	OrinRow_0: .word 1 2 3 4 5 6
	OrinRow_1: .word 7 8 9 10 11 12
	OrinRow_2: .word 13 14 15 16 17 18
	OrinRow_3: .word 19 20 21 22 23 24
	OrinRow_4: .word 25 26 27 28 29 30
	OrinRow_5: .word 31 32 33 34 35 36
.data 0x10001000
	TransRow_0: .word 0 0 0 0 0 0
	TransRow_1: .word 0 0 0 0 0 0
	TransRow_2: .word 0 0 0 0 0 0
	TransRow_3: .word 0 0 0 0 0 0
	TransRow_4: .word 0 0 0 0 0 0
	TransRow_5: .word 0 0 0 0 0 0

.data
    new_row: .asciiz "\n"
    space: .asciiz " "
	
.text 0x00400000

main:
	#store base address for each row of original Row
	la $t0, OrinRow_0
	la $t1, OrinRow_1
	la $t2, OrinRow_2
	la $t3, OrinRow_3
	la $t4, OrinRow_4
	la $t5, OrinRow_5
	#store base address for each row of new Row
	la $s0, TransRow_0
	la $s1, TransRow_1
	la $s2, TransRow_2
	la $s3, TransRow_3
	la $s4, TransRow_4
	la $s5, TransRow_5
	#Rows Left 
	addi $t6, $zero, 6
Loop:
	#load the first value in Orin and store it as last value, 5th word, in TransRow using $t8
	#repeat for each row
	lw $t8, 0($t0)
	sw $t8, 0($s3) #store starting at the 4th row 
	lw $t8, 0($t1)
	sw $t8, 0($s4) #store 5th row
	lw $t8, 0($t2)
	sw $t8, 0($s5) #store 6th row
	lw $t8, 0($t3)
	sw $t8, 0($s0) #store 1st row
	lw $t8, 0($t4)
	sw $t8, 0($s1) #store 2nd row
	lw $t8, 0($t5)
	sw $t8, 0($s2) #store 3rd row

	addi $t6, $t6, -1 #decrement rows left

#decrement one column for output matrix
	addi $s0, $s0, -4
	addi $s1, $s1, -4
	addi $s2, $s2, -4
	addi $s3, $s3, -4
	addi $s4, $s4, -4
	addi $s5, $s5, -4
#increment one column for original matrix
	addi $t0, $t0, 4
	addi $t1, $t1, 4
	addi $t2, $t2, 4
	addi $t3, $t3, 4
	addi $t4, $t4, 4
	addi $t5, $t5, 4

	beq $t6, $zero, Loop2
	j Loop

Loop2:
	addi $s0, $s0, 4
	addi $s1, $s1, 4
	addi $s2, $s2, 4
	addi $s3, $s3, 4
	addi $s4, $s4, 4
	addi $s5, $s5, 4
	addi $t6, $zero, 6

 row0:

	lw $t8, 0($s0)
	li $v0, 1
	move $a0, $t8
	syscall

	li $v0, 4
	la $a0, space
	syscall

	addi $s0, $s0, 4	
	addi $t6, $t6, -1

	bne $t6, $zero,  row0

	li $v0, 4
	la $a0, new_row
	syscall

	addi $t6, $zero, 6

 row1:

	lw $t8, 0($s1)
	li $v0, 1
	move $a0, $t8
	syscall

	addi $s1, $s1, 4	
	addi $t6, $t6, -1

	li $v0, 4
	la $a0, space
	syscall

	bne $t6, $zero,  row1

	li $v0, 4
	la $a0, new_row
	syscall

	addi $t6, $zero, 6

 row2:

	lw $t8, 0($s2)
	li $v0, 1
	move $a0, $t8
	syscall

	addi $s2, $s2, 4	
	addi $t6, $t6, -1

	li $v0, 4
	la $a0, space
	syscall

	bne $t6, $zero,  row2

	li $v0, 4
	la $a0, new_row
	syscall

	addi $t6, $zero, 6

 row3:

	lw $t8, 0($s3)
	li $v0, 1
	move $a0, $t8
	syscall

	addi $s3, $s3, 4	
	addi $t6, $t6, -1

	li $v0, 4
	la $a0, space
	syscall

	bne $t6, $zero,  row3

	li $v0, 4
	la $a0, new_row
	syscall

	addi $t6, $zero, 6

 row4:

	lw $t8, 0($s4)
	li $v0, 1
	move $a0, $t8
	syscall

	addi $s4, $s4, 4	
	addi $t6, $t6, -1

	li $v0, 4
	la $a0, space
	syscall

	bne $t6, $zero,  row4

	li $v0, 4
	la $a0, new_row
	syscall

	addi $t6, $zero, 6

 row5:

	lw $t8, 0($s5)
	li $v0, 1
	move $a0, $t8
	syscall
	addi $s5, $s5, 4	
	addi $t6, $t6, -1
	li $v0, 4
	la $a0, space
	syscall
	bne $t6, $zero,  row5
	li $v0, 4
	la $a0, new_row
	syscall

	addi $t6, $zero, 6
Exit:

	li $v0, 10
	syscall
	
