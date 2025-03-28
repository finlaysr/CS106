# --------------------------------
# CS106 Practical Assignment 6(a)
# Multiplication by shifting and adding
# --------------------------------

# sample input data

.data
A:    .half 99 101
.text
      la    $a0, A
      la    $a1, A+2

CodeToTest:                   # label for running tests
# ----------------------------------------------------------------
# Multiply the 16-bit numbers at the addresses in $a0 and $a1.
# Place the result in $v0.
# Do not use mul or div.
# ----------------------------------------------------------------
# YOUR CODE STARTS HERE
lh $t0 ($a0)   #M
lh $t1 ($a1)   #Q

li $v0 0       #A

Main:
  andi $t3 $t1 1 #LSB of Q
  beqz $t3 SkipIf

  addu $v0 $v0 $t0  #A = A + M

  SkipIf:
    sll $t0 $t0 1   #shift M left by 1
    srl $t1 $t1 1   #shift Q right by 1
  
  bnez $t1 Main
  
  
# YOUR CODE ENDS HERE
# ----------------------------------------------------------------

# UNCOMMENT THE FOLLOWING LINE TO TEST YOUR CODE
.include "Lab-6a-Tests.asm"
