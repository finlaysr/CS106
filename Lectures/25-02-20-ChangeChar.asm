#$a0 = pointer to string
#$a1 = old char, $a2 = new char

ChangeChar:
  lbu $t0, ($a0)      #get char[i]
  beqz, $t0, End      #if null go to end
  bne $t0, $a1, Done  #does old == current
  sb $a2, ($a0)       #uopdate byte
  
Done:
  addi $a0, $a0, 1    #i ++
  j ChangeChar
  
End:
  move $v0, $a0       #hand back end
  j ReturnReplace
  
  
