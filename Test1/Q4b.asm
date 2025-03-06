.data 
  matrix: .word 0xFFFFFFFF, 0xEEEEEEEE, 0xDDDDDDDD, 0xCCCCCCCC, 0xBBBBBBBB, 0xAAAAAAAA, 0x99999999, 0x88888888, 0x77777777, 0x66666666, 0x55555555, 0x44444444, 0x33333333, 0x22222222, 0x11111111, 0x00000000,0xFFFFFFFF, 0xEEEEEEEE, 0xDDDDDDDD, 0xCCCCCCCC, 0xBBBBBBBB, 0xAAAAAAAA, 0x99999999, 0x88888888, 0x77777777, 0x66666666, 0x55555555, 0x44444444, 0x33333333, 0x22222222, 0x11111111, 0x00000000
  newline: .byte 0x0A

.text
la $s0 matrix
li $a1 0  #counter from 31 -> 0

Main:
  beq $a1 32 End
  
  lw $a0 ($s0)
  j extract
  extractReturn:
  
  #print binary number
  li $v0 35
  syscall
  
  #print new line
  li $v0 4
  la $a0 newline
  syscall
  
  addi $s0 $s0 4
  addi $a1 $a1 1
  j Main
  
  
.include "Q4a.asm"

Reverse:
  


End: