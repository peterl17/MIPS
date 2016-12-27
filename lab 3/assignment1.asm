main:
#asks and gets first number. Moves it into $s1
la $a0, ask1
li $v0, 4
syscall
li $v0, 5
syscall

move $s1, $v0

#asks and gets second number. Moves it into $s2
la $a0, ask2
li $v0, 4
syscall

li $v0, 5
syscall

move $s2, $v0

#asks and gets third number. Moves it into $s3
la $a0, ask3
li $v0, 4
syscall

li $v0, 5
syscall

move $s3, $v0

#$t1 = A or C
or $t1, $s1, $s3 

# $t1 = NOT $t1
not $t1, $t1

#$t2 = B AND C
and $t2, $s2, $s3

#t2 = NOT $t2
not $t2, $t2

#$t3 = $t2 and $t1
and $t3, $t2, $t1

#return output
la $a0, outputF
li $v0, 4
syscall

li $v0, 1
move $a0, $t3
syscall

#end
li $v0, 10
syscall



.data

ask1: .asciiz "Enter first number \n"
ask2: .asciiz "Enter second number \n"
ask3: .asciiz "Enter third number \n"
outputF: .asciiz "\n Output F is "