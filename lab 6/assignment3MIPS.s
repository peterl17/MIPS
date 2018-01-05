# Peter Luo assignment 3 MIPS
.text
.globl main
main:
li $v0, 4
la $a0, askN
syscall #asks for N
li $v0,5
syscall #reads input
move $v0, $s0 #move input N into $s0
li $t1,1 #counter k for loop
li $t2, 0 #value of series
li $t3, 1 #set $t3 to 1
li $t6, 0 #mflo register
loop:
slt $t0,$s0,$t1 #set $t0 to 1 if  $s0 is less than $t1
bne $zero,$t0, exit #if $s0 less than $t1
li $t4, 2 #set $t4 to value of 2
move $t1, $t5 #copy of counter k to $t5

exponent:
blt $t5, $t3, skip #exponent loop goes until k<1
mul $t4, $t4,$t4#2^k
addi $t5, $t5, -1 #decrement copy of counter 
j exponent #go back to exponent
skip:

div $t1,$t4 #divide 1 by 2^k
mflo $t6 #move value of each series into $t6
add $t2, $t2, $t6 #add the value to series sum $t2
addi, $t1,$t1, 1 #increment counter
exit:
li $v0, 4
la $a0, outputResult
syscall
li $v0,1
la $a0,$t2 #print out result
syscall

li $v0, 10
syscall

.data
askN: .asciiz "Enter value of N \n"
outputResult: .asciiz "Result: "