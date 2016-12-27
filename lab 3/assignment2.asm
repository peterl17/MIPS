# $s2 holds product
main:
# ask for first integer and moves to $s0 - multiplicand
la $a0, ask1
li $v0, 4
syscall
li $v0, 5
syscall
move $s0, $v0

# ask for second integer and moves to $s1 -multiplier
la $a0, ask2
li $v0, 4
syscall
li $v0, 5
syscall
move $s1, $v0

link:

#checks if multiplier0 is 1
li $t0, 1
and $t1, $t0, $s1
# if multiplier0 = 0, skip the part where it's added to the product
beq $zero, $t1, skip
#if multiplier0=1, product = product + multiplicand
add $s2, $s2, $s0

skip:
#shift multiplicand left 1
sll $s0, $s0, 1
#shift multiplier right 1
srl $s1, $s1, 1

#goes back to link if multiplier is bigger than 0
bgt $s1, $zero, link



#multiplier is zero, returns the product
li $v0, 4
la $a0, answer
syscall

move $a0, $s2
li $v0, 1
syscall

#end
li $v0, 10
syscall



.data
ask1: .asciiz "Enter the first integer \n"
ask2: .asciiz "Enter the second integer \n"
answer: .asciiz "Your Product is: "