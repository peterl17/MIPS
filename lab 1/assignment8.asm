#ex5.asm
.data 0x10000000
ask: .asciiz "\nEnter a number between 0 and 50000: "
ans: .asciiz "Answer: "
.text 0x00400000
.globl main
main:
li $v0,4
la $a0, ask # Loads the ask string
syscall # Display the ask string
li $v0, 5 # Read the input
syscall
move $t0, $v0 # n = $vo, Move the user input to t0
addi $t1, $0, 0 # i = 0
addi $t2, $t0, 0 # $t2 starts off with a copy of input
addi $t2, $t2, 1 # adds the odd number of 1
li $t3, 2 #we store two in $t3
loop:
sub $t0, $t0, 1 #decrement by 1
beq $t0, 1, END #if we reach 1 we stop
div $t0, $t3
mfhi $t1 #store the reminder to $t1
beq $t1, 1, ADD #if the reminder is 1 then we go to ADD
j loop # go back to loop
ADD: add $t2, $t2, $t0 #add the odd number to the $t2
 j loop #go back
END:
li $v0,4
la $a0, ans # Loads the ans string
syscall
move $a0, $t2 # Loads the answer
li $v0, 1
syscall
li $v0, 10
syscall