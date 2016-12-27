#Peter Luo 157004870 Assignment 4

.text 0x00400000
main:
# $t0 holds address of first string
# $t1 holds address of second string
# $t2 holds the byte from first string
# $t3 holds the byte from the second string
# $t4 holds the address for the stack pointer
# $s0 holds whether it's the first time inputing or the second-chance input


start:
li $t2,0	
li $t3,0
#add $t4, $sp, -1 #$t4 is equal to inital $sp
la $t4, mismatch #loads address into mismatch
move $t5, $t4 #makes copy of address
#prompt for first string
li $v0, 4
la $a0, prompt1
syscall
#read first string
li $v0, 8
la $a0, str1
#li $a1,20 #allocates byte space for string
move $t0, $a0 #$t holds the address where first string is stored
syscall
#print back string 1
la $a0, str1#reload byte space to primary address
move $a0,$t0 # primary address = t0 address (load pointer)
li $v0,4 # print string
syscall

#prompt for second string
li $v0, 4
la $a0, prompt2
syscall

#read second string
li $v0, 8
la $a0, str2
li $a1,20 #allocates byte space for string
move $t1, $a0 #$t1 holds the address where second string is stored
syscall
#print back string 2
la $a0, str2 #reload byte space to primary address
move $a0,$t1 # primary address = t0 address (load pointer)
li $v0,4 # print string
syscall

###compare the bytes one by one
#load bytes
compare:
lb $t2, 0($t0) #load byte into $t2
lb $t3, 0($t1) #load byte into $t3
beq $t3, $zero, exit #when string 2 has no more characters left, branches to exit
bne $t2, $t3, storeByte #if string 1 byte and string 2 byte are not equal, store the byte in mismatch
returnToCompare:
addi $t0, $t0, 1 #increment byte address of string 1
addi $t1, $t1, 1 #increment byte address of string 2
j compare #loop back to compare


storeByte:
sb $t3, 0($t4)
addi $t4, $t4, 1
j returnToCompare #returns to where storeByte was called

exit:
bne $t4, $t5, notEqual
li $v0,4
la $a0, successfulExit
syscall
li $v0, 10
syscall


notEqual:
li $a1, 20
move $a0, $t5
li $v0, 4
syscall
#addi $sp, $sp, 1

#go to start again
j start



.data 0x10000000
prompt1: .asciiz "Please enter the first string\n"
prompt2: .asciiz "Please enter the second string\n"
successfulExit: .asciiz "\n Successful Exit"
str1: .space 20
str2: .space 20
mismatch: .space 20
byteSpace: .space 1
