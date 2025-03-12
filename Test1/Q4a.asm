# assume a word is given in $a0 and a bit position in $a1
.data
  word: .word 0xFA070010

.text 
#lw $a0 word
#li $a1 4

Extract:
  bgt $a1 31 Error
  blt $a1 0  Error
  
  li $t7 1
  sllv $t7 $t7 $a1
  and $a0 $a0 $t7
  
  jr $ra 
  
Error:
  break 

