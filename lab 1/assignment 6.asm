
Loop: 
lw $v1, 0($a0) #read the next word
Add $v0, $v0, 1 #increase the counter
sw $v1, 0($a1) #store the word to the destination
add $a0, $a0, 4 #move the pointer to the next word
add $a1,$a1, 4 #move the pointer to the next word
bne $v1, $zero, Loop #if the word is not 0 repeat the loop