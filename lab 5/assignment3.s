#Peter Luo
.data 0x10000000
    nextRow: .asciiz "\n"          # for making new line
    space: .asciiz ","	  # for space
.data 0x10000860
Vector_A: .word 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25
 .data 0x1000A000
Matrix_B: .word 26 27 28 29 30
 .data 0x1000A100
 .word 31 32 33 34 35
 .data 0x1000A200
 .word 36 37 38 39 40
 .data 0x1000A300
 .word 41 42 43 44 45
 .data 0x1000A400
 .word 46 47 48 49 50
 .data 0x1000B000
Vector_C: .word 0

 .text 0x00400000


 .globl main # main program starts in the next line
main:

la $a1, 0x10000860 # base address A
la $a2, 0x1000A000 # base address B
la $a3, 0x1000B000 # base address C
li $t0, 5 # value of 5
li $t1, 30 #counter - when it reaches 0 it's done
li $t5, 6 #column counter

loop:
# $t2 holds value of A
lw $t2, 0($a1) #first value of A

# $t2 holds value of B
lw $t3, 0($a2) #first value of B
mult $t2, $t3 #multiply A and B
mflo $t4 #move product into $t4
sw $t4, 0($a3) #store product into first value of C

addi $t1, $t1, -1 #decrement total counter
beq $t1, $zero, exit #if 25 values have been added, exit


addi $t5, $t5, -1 #decrement column counter
beq $zero, $t5, endRow  #if end of row
li $v0, 1
lw $a0, 0($a3)
syscall

li $v0, 4
la $a0, space
syscall

#increment to next word in each matrix
addi $a1, $a1, 4 
addi $a2, $a2, 4
addi $a3, $a3, 4
j loop

endRow: #end of row
#print new line \n
li $v0, 4
la $a0, nextRow #goes to next row
syscall

addi $t5, $t5, 6
addi $a2, $a2, -20 #go back 4 words
addi $a2, $a2, 256 #go to next row in matrix B
j loop

exit:
li $v0, 10
syscall











