.data 0x10000000
str: "Please enter X1"
str2: "Please enter Y1"
str3: "Please enter X2"
str4: "Please enter Y2"

.text 0x00400000
.globl main
main:
li $v0, 8 #x1
la $a0, str
syscall
li $v0, 5
syscall
move $t1, $v0

li $v0, 8 #y1
la $a0, str1
syscall
li $v0, 5
syscall
move $t2, $v0

li $v0, 8 #x2
la $a0, str2
syscall
li $v0, 5
syscall
move $t3, $v0

li $v0, 8 #y2
la $a0, str1
syscall
li $v0, 5
syscall
move $t4, $v0


sub $s1, $t1, $t3 # $s1 = x value
abs $s1, $s1


sub $s2, $t2, $t4 # $s2 = y value
abs $s2, $s2

li $v0, 1
la $a0, 0($s1) #prints x and y coordinates
syscall
la $a0, 0($s2)

li $v0, 10 #exit
syscall
