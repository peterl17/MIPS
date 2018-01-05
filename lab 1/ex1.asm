# Exercise1 is used in assignments 1 and 2
.text 0x00400000 #text segment starts at this address
 .globl main #assembler "global" tells that label "main" is accessable outside the file
main:
lw $10, Number1($0) #loads word from address of $0 plus the value of Number1 into register $10
ori $11, $0, 1 #or immediate or with the register 0 and 1. stores result in register $11. $11 = 1
ori $9, $0, 1 #or immediate or with the register 0 and 1. stores result in register $11
#compute the factorial of Number ($10)!
factloop: #declares loop
bge $11, $10, factexit #if branch $11 greater than or equal to $10, then goes to factexit.
mul $9, $10, $9 #returns the product of $10 and $9 into $9
sub $10, $10, 1 #subtracts one from the value stored in $10
j factloop # jumps back to beginning of factloop
factexit:#declares factexit for when the loop is exited by the bge
#the computation of the factorial is over
#Is the result in $9 correct? The result in $9 is in
#hexadecimal form
 li $2, 10 #sets the value of $v0 as 10 to exit
 syscall
 .data 0x10000000
 .align 2
Number1: .word 18 #Number1 is data with value 18 that can be used


#loads the word and then uses $11 to check if it is lower or equal to 1.
#then stores the sum in $9 while using $10 to keep track of where in the factorial we are at.
#the loop ends when it becomes 1 and stores the value.

