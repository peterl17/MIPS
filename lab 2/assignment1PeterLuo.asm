#Peter Luo 157004870 Assignment 1

.text
main: 

li $v0, 4 #asks for user to enter value of n
la $a0, str1
syscall

li $v0, 5 #reads n and moves it into register $t0
syscall
move $t0, $v0 

bltz $t0, negative # if n is negative branch to negative

add $t1, $zero, $t0 #$t1 is equal to n, $t1 will hold the sum
li $t2, 0

loop:
addi $t0, $t0, -1 #subtract 1 from n
slt $t2, $t0, $zero #if n is less than 0 go to display result
bne $zero, $t2, displayResult
add $t1, $t1, $t0
j loop

addi $v0, $zero, 10

displayResult:
li $v0, 4 #prints out sum
la $a0, displayInt
syscall
li $v0, 1
move $a0, $t1
syscall
li $v0, 10 #ends program
syscall

negative: 
li $v0 ,4 #prints message saying that n was negative
la $a0 , negativeOne
syscall
li $v0, 10 #ends program
syscall

.data

str1: .asciiz "Please enter the value of n: "
negativeOne: .asciiz "The number entered was a negative"
displayInt: .asciiz "The sum is: "