#Peter Luo 157004870 Assignment 2

.text

main:
li $v0, 4
la $a0, ask
syscall
li $v0, 5
syscall
move $s0, $v0 #$s0 stores the value of n

#check for out of bounds
li $t0, 100
bgt $s0,$t0, error #greater than 100
bltz $s0, error #less than 0
beqz $s0, error # n = 0

#finding the closest prime number
addi $s0, $s0, 1 # adds one because the loop starts with subtract 1

loop: #checks decremented number
addi $s0, $s0, -1
li $t1, 2 #counter set to 2 each time it checks a new n value

loop1: #divides n by numbers 2 till n-1
beq $t1, $s0, found #if the counter reaches n value without finding a number that n can be divided by, it reaches success exit case
div $s0, $t1 #divide by counter which increments until it reaches n-1
mfhi $t2 #remainder is stored in $t2
bne $zero, $t2,loop # if it can be divided by a number(remainder != 0) it goes to loop
addi $t1, $t1,1 #else it increments the counter
j loop1

found:
li $v0, 4
la $a0, foundOutput
syscall
li $v0, 1
move $a0, $s0
syscall
li $v0, 10 #ends program
syscall 

error:
li $v0, 4
la $a0, errorOutput
syscall
li $v0, 10 #ends program
syscall 

.data

ask: .asciiz "Enter the value of n:"
errorOutput: .asciiz "The number entered is out of bounds"
foundOutput: .asciiz "The first prime number under N is: "