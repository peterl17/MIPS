main:
li.s $f3, 0.3333333
li.s $f4, 3.14159

#get height into $f1
li $v0, 4
la $a0, askHeight
syscall

li $v0, 6
syscall
mov.s $f1,$f0

#get radius into $f2
li $v0, 4
la $a0, askRadius
syscall

li $v0, 6
syscall
mov.s $f2,$f0


mul.s $f2, $f2, $f2 #square radius 
mul.s $f5, $f3, $f4 # get 1/3   * pi into $f5
mul.s $f5, $f5, $f2 # multiply by radius^2
mul.s $f5, $f5, $f1 # multiply by height

li $v0, 2
mov.s $f12, $f5
syscall

li $v0, 10
syscall

.data
askHeight: .asciiz "What's the height \n"
askRadius: .asciiz "What's the radius \n"