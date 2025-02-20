.text
li $a0, 0
li $t0, 1 #$t0 = 0 (i)
li $t1, 3 #$t1 = 3 (n)

For:
  bgt $t0, $t1, End
  
  mul $t2, $t0, $t0
  add $a0, $a0, $t2
  
  addi $t0, $t0, 1
  
  j For
  
  
End:
  li $v0, 1
  syscall 