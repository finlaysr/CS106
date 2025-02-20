.data
in: .asciiz "Guess: "
ro: .asciiz "rock!"
pa: .asciiz "paper!"
sc: .asciiz "scissors!"

input: .space 10

.text

Main:
li $v0, 42
li $a1, 3      #number from  0-3
syscall
move $t0, $a0    #$t0 = Random Number

la $a0, in   #Input message
li $v0, 4
syscall

li $v0, 8      #Get input
la $a0, input
li $a1, 9
syscall


la $t3, ro
la $t4, input
beq $t3, $t4, Rock


Rock:
la $a0, ro   #Input message
li $v0, 4
syscall