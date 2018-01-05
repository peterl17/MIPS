#Exercise is used in assignment 3
.text 0x00400000
.align 2
.globl main
main:
lw $a0, Size # Load the size of array into $a0, using lw
li $a1, 0 # initialize index i
li $t2, 4 # t2 contains constant 4, initialize t2
li $s4, 1 # Initialize result to one
loop:
mul $t1, $a1, $t2 # t1 gets i*4
lw $a3, Array($t1) # a3 = Array[i]
mul $s4, $s4, $a3 # result = result * Array[i]
sw $s4, Array($t1) # store result in the Array2 in location i
add $t1, $t1, 1 # i = i + 1
blt $a0, $a1, END # go to END if finished
j loop
END:
 li $v0, 10
 syscall
.data 0x10000000
.align 2
Array: .word 2 5 6 7 12 16
Size: .word 6