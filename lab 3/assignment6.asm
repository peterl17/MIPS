main:
#10 objects in array
# $t1 = counter
#asks for float, stores it in $f1

li $t1, 0 #counter
li $s2, 10 #max
li.s $f5, 0.0 #sum

li $v0, 4
la $a0, ask1
syscall

li $v0, 6
syscall
mov.s $f1, $f0

#load address of Array into $s0
la $s0, Array
#use $s1 as 4
li $s1, 4

loop:
mul $t0, $s1, $t1 #4*counter into $t0 
add $t0, $t0, $s0
l.s $f2, 0($t0) #loads float from array into $f2
c.lt.s $f1,$f2 #true if user input <= array
bc1f skip #skip adding to sum if greater than array

#add to sums
add.s $f5, $f5, $f2
skip:
addi $t1,1
slt $t2,$t1,$s2 #$t2 = 1 if counter < 10 
bne $t2, $zero, loop

#end
li $v0, 2
mov.s $f12,$f5
syscall

li $v0, 10
syscall

.data
Array: .float 1.35, 2.67, 3.566, 4.56, 5.98, 9.43, 12.34, 15.54, 23.87, 34.33
ask1: .asciiz "Enter the float \n"