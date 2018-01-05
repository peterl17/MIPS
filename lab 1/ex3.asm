# Used in assignment 4
# Registers used: $t0 - used to hold the first number.
# $t1 - used to hold the second number.
# $t2 - used to hold the difference of the $t1 and $t0.
# $v0 - syscall parameter and return value.
# $a0 - syscall parameter.
.text
main: 
li $v0,8 #read string
la $a0, theString
move $a1, $v0 #moves name to $a1

## Get first number from user, put into $t0.

li $v0, 4
la $a0, str #asks for user to enter a number
syscall

li $v0, 5 # load syscall read_int into $v0.
syscall # make the syscall.
move $t0, $v0 # move the number read into $t0.

## Get second number from user, put into $t1.
li $v0, 4
la $a0, str #asks for user to enter a number
syscall

li $v0, 5 # load syscall read_int into $v0.
syscall # make the syscall.
move $t1, $v0 # move the number read into $t1.


li $v0, 4
la $a0, 0($a0) #prints out name

li $v0, 10 #exits
syscall

.data
theString: .space 20
str: .asciiz "Enter A Number: "
str2: asciiz "Enter your name: "