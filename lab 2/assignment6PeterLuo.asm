#Peter Luo 157004870 Assignment 6
# $t0 is array index counter
# $t1
# $t2
# $s1 = 16 (0xF)

.text
main:
 li $t0, 0               #$t0 is used as i

ILoop:
    sll $t2,$t0,2           # pos = i (scaled for word elements)
    addiu $t5,$t2,4         # j = i+1 (scaled for word elements)

JLoop:
    lw $t3, array($t2)      # array[pos]
    lw $t4, array($t5)      # array[j]
    ble $t3, $t4, JElse
    move $t2,$t5            # pos = j
JElse:
    addiu $t5,$t5,4
    blt $t5,20,JLoop        # 20 = array_length * sizeof(word)

    # if (pos != i) swap(array[pos], array[i])
    sll $t1,$t0,2
    beq $t2,$t1,SkipSwap    # skip if pos==i
    lw $t3, array($t2)      # $t3 = array[pos]
    lw $t4, array($t1)      # $t4 = array[i]
    sw $t4, array($t2)      # array[pos] = array[i]      
    sw $t3, array($t1)      # array[i] = array[pos]     
SkipSwap:

    addi $t0, $t0, 1
    blt $t0, 4, ILoop       # run ILoop while i<array_length-1



.data
array: .word 4, 5, 23, 5, 8, 3, 15, 67, 8, 9, 0xF
array2: .space 500
arraySize: .asciiz "\nEnter size of array: "
