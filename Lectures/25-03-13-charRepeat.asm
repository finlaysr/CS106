#repeat char in $a0 n times where n = $a1

.data
  repeateStore: .asciiz
  
.text
Repeat:
  la $t0 repeateStore
  move $t1 $t0
  beqz $a1 RepeatEnd
  
RepeatLoop:
  sb $a0 ($t1)
  sub  $a1 $a1 1
  beqz $a1 RepeatEnd
  addi $t1 $t1 1
  bnez $a1 RepeatLoop

RepeatEnd:
  addi $t1 $t1 1
  sb $zero ($t1)
  move $a0 $t0 
  li $v0 4
  syscall
  jr $ra