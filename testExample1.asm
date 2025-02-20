#We want to flip X 

# x+3| x+2| x+1| x+0
# BB | CC | DD | FF

# We want
# Ff | DD | CC | BB

.data
  X: .word 0xBBCCDDFF
  
.text
  lbu $t0, X   # $t0 == FF
  lbu $t1, X+3 # $t1 = BB
  sb  $t0, X+3 # X = FFCCDDFF
  sb  $t1, X   # X = BBCCDDFF
    
  lbu $t0, X+1 # $t0 = DD
  lbu $t1, X+2 # $t1 = CC 
  sb  $t0, X+2 # X = FFDDDDFF
  sb  $t1, X+1 # X = FFDDCCFF

  lw $a0, X
  li $v0, 34
  syscall 