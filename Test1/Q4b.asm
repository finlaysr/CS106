#Finlay Robb CES Year 1
.data 
  matrix: .word 0xFFFFFFFF, 0xEEEEEEEE, 0xDDDDDDDD, 0xCCCCCCCC, 0xBBBBBBBB, 0xAAAAAAAA, 0x99999999, 0x88888888, 0x77777777, 0x66666666, 0x55555555, 0x44444444, 0x33333333, 0x22222222, 0x11111111, 0x00000000,0xFFFFFFFF, 0xEEEEEEEE, 0xDDDDDDDD, 0xCCCCCCCC, 0xBBBBBBBB, 0xAAAAAAAA, 0x99999999, 0x88888888, 0x77777777, 0x66666666, 0x55555555, 0x44444444, 0x33333333, 0x22222222, 0x11111111, 0x00000000
  newline: .byte 0xA

.text
la $s0 matrix     #load address of matrix
li $a1 0          #counter from 0 -> 31

Main:
  beq $a1 32 End  #stop if done all values
  
  lw $a0 ($s0)    #0 = current value
  jal Extract     #extract value at position
  jal Reverse     #reverse binary number
  
  #print value in binary
  li $v0 35
  syscall
  
  #print new line
  li $v0 4
  la $a0 newline
  syscall
  
  addi $s0 $s0 4  #next matrix value
  addi $a1 $a1 1  #counter += 1
  
  j Main
  
.include "Q4a.asm"

Reverse:
  beqz $a0 ReverseReturn  #if all zeros don't reverse
  li $t0 0x80000000       #put one in MSB
  srlv $a0 $t0 $a1        #move MSB bit right to counter position to imitate reversing
  
  ReverseReturn:
    jr $ra                #go back to main

End: #stop nicely
  li $v0 10
  syscall