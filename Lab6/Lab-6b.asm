# --------------------------------
# CS106 Practical Assignment 6(b)
# Vector dot product by shifting and adding
# --------------------------------

# sample input data

.data
A:    .half     1    2   3  4 5
B:    .half 10000 1000 100 10 1
.text
      la    $a0, A
      la    $a1, B
      li    $a2, 5

CodeToTest:                   # label for running tests
# ----------------------------------------------------------------
# Calculate the dot product of the halfword vectors at $a0 and $a1.
# The vector length is given in $a2.
# Place the result in $v0.
# Do not use mul or div.
# ----------------------------------------------------------------
# YOUR CODE STARTS HERE
li $a0 0 #answer
li $s1 0 #counter from 0 -> len
move $s2 $a2



Loop:
  
  lh $t0 ($a0) 
  lh $t1 ($a1) 
  li $v0 0
  
  jal Mult
  addu $s0 $s0 $v0 
  
  addi $a0 $a0 2    #next vecctor A value
  addi $a1 $a1 2    #next vecctor B value
  
  addi $s1 $s1 1    #counter ++
  bltu $s1 $s2 Loop
  
  move $v0 $s0
  
j End
  


Mult:
  andi $t2 $t1 1
  beqz $t2 SkipIf
  addu $v0 $v0 $t0
  SkipIf:
    sll $t0 $t0 1
    srl $t1 $t1 1
  
  bnez $t2 Mult
  jr $ra
  
End:
  
# YOUR CODE ENDS HERE
# ----------------------------------------------------------------

# UNCOMMENT THE FOLLOWING LINE TO TEST YOUR CODE
.include "Lab-6b-Tests.asm"
