#Assignemnt 4 Peter Luo MIPS
.data
array1: .word 2 -4 4 7 11 8
.text
.global main
main:
la $a1, array1 #stores address of array1 into $a1
move $a1, $a2 # address for indexing through
loop1:#while not at end of array size n, use counter $t1
#set $t5 to 0
loop2:#run n-1 times, use counter $t2. doesn't need nth time because compare checks address+4.
#compare
lw $t3, 0($a2) #$t3 holds array value previous
lw $t4, 4($a2)#$t4 holds the array value next
slt $t6,$t3,$t4 #set $t6 to 1 if previous is less than next
bne $t6,$zero,next #skip switching by branching to next:
switch: #switches bubble 
move $t3, $t0
sw $t0, 4($a2)
sw $t4,($a2)  
next:
addi $a2, $a2,4 #increment counter address by 4 bytes for word
addi $t2, $t2,1 # add one to counter
#
slti $t6,$t2,5 #set $t6 to 1 if counter $t1 less than n-1
bne $zerp, $t6, loop2 #inner loop
move $a1,$a2 #reset address counter back to beginning of array
addi $t1,$t1,1 #add one to outer loop counter
slti $t6,$t1,6 #set $t6 to 1 if counter $t2 less than n
bne $zerp, $t6, loop1 #outer loop
#end of array for bubble sort, here if both counters are done

