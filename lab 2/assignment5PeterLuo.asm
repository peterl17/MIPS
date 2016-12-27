#Peter Luo 157004870 Assignment 5
# $s0 stores address of password
# $s7 stores attempts used
# $s6 is max amount = 2
# $s5 stores address of re-entered password

.text
main:
li $s7, 1
li $s6, 2

#ask for password
ask:

li $v0, 4
la $a0, prompt1
syscall
li $v0, 8
la $a0, password1
syscall
add $s0,$zero,$a0 #stores address of input password at $t0


#check requirements

getLength:
lb $t0, 0($s0) #loads byte at $s0 into $t0
beq $zero, $t0, check #check if it's the end

#make sure it's a letter a-Z
#li $s3, 65 #ascii a
#blt $t0, $s3, displayError
#li $s4, 122 #ascii Z
#bgt $t0, $s4, displayError

addi $s0, $s0, 1 #else, increment byte
addi $t1, $t1, 1 #increment the counter
j getLength



check:
addi $s0, $s0, -1 #goes back from the 0 after the last letter to the last letter
addi $t1, $t1, -1 #makes sure the above isn't counted in counter
li $s1, 8 #lower bound
blt $t1, $s1, displayError #if counter < 8, branches to error
li $s2, 12 #higher bound
bgt $t1, $s2, displayError #if counter > 12, branches to error
#li $s3, 65 #lower bound
#at this point, it has passed requirements

#asks for re-entered password
li $v0, 4
la $a0, prompt2
syscall
li $v0, 8
la $a0, password2
syscall
add $s5,$zero,$a0 #stores address of re-entered password at $t0
#successful terminate 
li $v0, 4
la $a0, successfulTerminate1
syscall
li $v0, 10
syscall


displayError:
#if attempts = 2, goes to terminate case
beq $s6, $s7 terminate
#else, asks for another attempt
li $v0, 4 
la $a0, errorTryAgain
syscall
#add one to attempt counter $s7
addi $s7, $s7, 1
#jumps back to beginning, where it asks for password
j ask


terminate:
#displays message that program will terminate
li $v0, 4
la $a0, terminateMessage
#terminates program
li $v0, 10
syscall



.data
terminateMessage: .asciiz "\nProgram will termiante unsuccessfully."
password1: .space 20
password2: .space 20
prompt1: .asciiz "\nSet up your password\n"
prompt2: .asciiz "\nRe-Enter your password\n"
errorTryAgain: .asciiz "\nError. Try again. Enter a password with the size of 8 to 12\n"
successfulTerminate1: .asciiz "\nPassword is set up\n"