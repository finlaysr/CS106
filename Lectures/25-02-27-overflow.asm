

  li $a0 0x80000000
  li $a1 0x80000000
  
  add $v0, $a0, $a1    #sign of output
  addi $t0, $a0, 0x80000000  #sign of a0
  addi $t1, $a1, 0x80000000  #sign of a1
  bne $t0, $t1, Done  #sign not same so no overflow
  
  #check for overflow
  andi $t2, $v0, 0x80000000
  beq $t2, $t0, Done
  
  
  



Done