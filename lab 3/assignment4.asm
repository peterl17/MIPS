main:
#$f1 holds x+1

#sets epsilon in $f3
li.s $f3, 0.00001

#sets  $f6 as 2
li.s $f6, 2.0

#sets $f10 as 3
li.s $f10, 3.0

#set $f1 as initial guess
li.s $f1, 1.0
li.s $f2, 1.0

#asks for positive number
li $v0, 4
la $a0, ask1
syscall

#stores positive float
li $v0, 6
syscall
mov.s $f9, $f0

#loop label
loop:

#f5 = 2*xi
mul.s $f5, $f1, $f6

# $f7 = x^2
mul.s $f7, $f1, $f1

# $f7 = $f9 / $f7
div.s $f7, $f9, $f7

#add 2xi + N/x^2
add.s $f8, $f5, $f7

#divide $f8 by 3 to equal x+1
div.s $f8, $f8, $f10

#move x+1 into $f2
mov.s $f2, $f8

#check to see if less than $s0
sub.s $f4, $f2, $f1
abs.s $f4, $f4

#li $v0, 2
#mov.s $f12, $f4
#syscall

c.lt.s $f4, $f3
bc1t endprogram

#move x+1 to x for next loop
mov.s $f1, $f2

j loop


endprogram:
#prints out the answer
li $v0, 4
la $a0, answer
syscall

li $v0, 2
mov.s $f12, $f2
syscall

li $v0, 10
syscall

.data
ask1: .asciiz "What is the positive number N? \n"
answer: .asciiz "your cube root of the number is : "