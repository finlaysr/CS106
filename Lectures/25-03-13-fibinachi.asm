.data

.text
Fib:
  li $t0 0 
  li $t1 1
  li $t2 0
  
FibLoop:
  beqz $a0 FibEnd
  sub $a0 $a0 1
  move $t2 $t0
  move $t0 $t1
  
  add $t1 $t1 $t2
  j FibLoop
  
FibEnd:
  move $v0 $t0 
  jr $ra