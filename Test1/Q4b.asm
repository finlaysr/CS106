.data 
  matrix: .word 0xFFFFFFFF, 0xEEEEEEEE, 0xDDDDDDDD, 0xCCCCCCCC, 0xBBBBBBBB, 0xAAAAAAAA, 0x99999999, 0x88888888, 0x77777777, 0x66666666, 0x55555555, 0x44444444, 0x33333333, 0x22222222, 0x11111111, 0x00000000,0xFFFFFFFF, 0xEEEEEEEE, 0xDDDDDDDD, 0xCCCCCCCC, 0xBBBBBBBB, 0xAAAAAAAA, 0x99999999, 0x88888888, 0x77777777, 0x66666666, 0x55555555, 0x44444444, 0x33333333, 0x22222222, 0x11111111, 0x00000000
  newline: .byte 0x0A

.text
la $s0 matrix
li $a1 0  #counter from 0 -> 31

Main:
  beq $a1 32 End
  
  lw $a0 ($s0) #0 = current value
  jal Extract
  jal Reverse
  
  #print binary number
  li $v0 35
  syscall
  
  #print new line
  li $v0 4
  la $a0 newline
  syscall
  
  addi $s0 $s0 4 #next matrix line
  addi $a1 $a1 1 #counter ++
  
  j Main
  
  
.include "Q4a.asm"


Reverse:
  #use $s2 -
  li $s2 0
  beqz $a0 ReverseReturn
  
  
  li $s3 0x80000000
  srlv $a0 $s3 $a1
  
  ReverseReturn:
    jr $ra
  

End:

