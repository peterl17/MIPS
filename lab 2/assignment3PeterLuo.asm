#Peter Luo 157004870 Assignment 3
.text
main:
li $v0, 4 #get n
la $a0, ask
syscall
li $v0, 5
syscall
move $s0, $v0 #$s0 stores the value of n

#check for out of bounds
li $t0, 1000
bgt $s0,$t0, error #greater than 1000
bltz $s0, error #less than 0
beqz $s0, error # n = 0

#get sum
li $t1, 0 #even sum
li $t2, 0 #odd sum
li $t3, 2 #used to divide
addi $s0, $s0, 1 # added one because the first line of loop is subtract one

loop:
addi $s0, $s0, -1
beq $s0, $zero, finish #leaves loop when it has reached zero
div $s0, $t3
mfhi $t4
beq $t4, $zero, even #if remainder is 0 it branches to even case, else it goes to next line which is odd case
add $t2, $t2, $s0#odd case
j loop
even:
add $t1, $s0, $t1 #adds the value onto the even register
j loop


finish:
#outputs even sum
li $v0, 4 
la $a0, evenOutput
syscall
li $v0, 1
move $a0, $t1
syscall

#outputs odd sum
li $v0, 4
la $a0, oddOutput
syscall
li $v0, 1
move $a0, $t2
syscall
#end program
li $v0, 10
syscall

error:
li $v0, 4
la $a0, errorOutput
syscall
li $v0, 10 #ends program
syscall 



.data

ask: .asciiz "Enter the value of n from 0 to 1000\n"
errorOutput: .asciiz "\nThe number entered is out of bounds"
evenOutput: .asciiz "\neven sum:"
oddOutput: .asciiz "\nodd sum:"