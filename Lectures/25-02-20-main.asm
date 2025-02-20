  la $a0, films #$a0 = films[0]
  li $s2, 0     #i=0
  li $s3, 4     #size = 4
  
Main:
  beq $s2, $s3, Terminate  #if i == size, done
  lbu $a1, old             #top char replace
  lbu $a2, new             #replace with
  move $s0, $a0            #save pointer
  
  j ChangeChar

ReturnReplace:            #come back from ChangeChar
  move $s1, $v0
  move $a0, $s0           #get start of string
  
  j Println

ReturnPrintLn:
  move $a0, $s1
  addi $a0, $a0, 1
  addi $s2, $s2, 1
  
  j Main



Terminate:
  li $v0, 10
  syscall
  
  
.include "25-02-20-data.asm"
.include "25-02-20-ChangeChar.asm"