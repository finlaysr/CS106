# W |null| X |null|null|  Y | Z 
#A+6| A+5|A+4| A+3| A+2| A+1| A 

.data 

  A: .word 0x0000CAFE, 0x00F100FE

.text
  
  li $v0 5
  syscall
  
  li $v0 41
  syscall
  #lbu $t0, $a0
  syscall
  #lbu $t0, $a0
  syscall
  #lbu $t0, $a0

  
  lbu $t0, A
  lbu $t1, A+1
  lbu $t2, A+4
  lbu $t3, A+6
  
  mul $a0, $t3, 4
  add $a0, $a0, $t2
  mul $t1, $t1, $t0
  sub $a0, $a0, $t1
  li $v0, 34
  syscall
  
  