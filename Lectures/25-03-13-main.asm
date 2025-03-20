.data
  array: .byte 1,2,3,4,5,6,7,8,9,10
  char:  .asciiz "*"
  newLine: .asciiz "\n"

.text
  la $s0 array
  li $s1 10 #number of array elements to load

Main:
  lbu $a0 ($s0) #n for fib(n)
  jal Fib
  move $a1 $v0
  lbu $a0 char
  jal Repeat
  addi $s0 $s0 1
  addi $s1 $s1 -1
  
  
  li $v0 4
  la $a0 newLine
  syscall
  
  bnez $s1 Main
  
End:
  li $v0 10 
  syscall


.include "25-03-13-charRepeat.asm"
.include "25-03-13-fibinachi.asm"
