.data
gen:  .asciiz  "\n\nRandom Number from 1-100 Generated!\n"
in:   .asciiz  "Guess Number: "
low:  .asciiz  "Too low\n"        
high: .asciiz  "Too high\n"
cor:  .asciiz  "Correct!"

.text
Main:
la $a0, gen   #Number Generated message
li $v0, 4
syscall

li $v0, 42
li $a1, 100      #number from  0-100
syscall
move $t0, $a0    #$t0 = Random Number

NotCorrect:
la $a0, in   #Input message
li $v0, 4
syscall

li $v0, 5
syscall
move $t1, $v0    #$t1 = input

bgt $t1, $t0, tooHigh
blt $t1, $t0, tooLow


la $a0, cor #If correct
li $v0, 4
syscall
j Main #repeat game

tooHigh:
la $a0, high
li $v0, 4
syscall
j NotCorrect

tooLow:
la $a0, low
li $v0, 4
syscall
j NotCorrect
