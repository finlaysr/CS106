.data
  myString: .asciiz "this is a string"
  
.text
  li $a0, 0          #len = 0
  la $s0, myString   #pointer to myString

FindLength:
  lbu $t0, ($s0)     #First character
  beqz $t0, End      #If null byte then end
  
  addi $a0, $a0, 1   #Total += 1
  addi $s0, $s0, 1   #Address 
  
  j FindLength
  
End:
  li $v0, 1
  syscall
  