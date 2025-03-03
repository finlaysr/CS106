# --------------------------------
# CS106 Practical Assignment 5(a)
# Unsigned overflow
# --------------------------------

.data
A:    .half 99 0xffffffff
.text
      la    $a0, A
      la    $a1, A+2

CodeToTest:                   # label for running tests
# ----------------------------------------------------------------
# Add the unsigned 16-bit numbers at the addresses in $a0 and $a1.
# If no overflow (as 16-bit unsigned integers) occurred, place their sum in $v0.
# If overflow did occur, place the minimum possible 32-bit signed value in $v0.
# ----------------------------------------------------------------
# YOUR CODE STARTS HERE
  
  
  not $t0, $a1       # t0 = ~a1 = UINT_MAX - a1
  sgtu $v0, $a0, $t0 # v0 set if a0 > UINT_MAX - a1
  
  beqz $v0 NoOverFlow
  li $v0 0xF0000000  #If overlow -> min signed value
  
NoOverFlow:
  addu $v0, $a0, $a1


# YOUR CODE ENDS HERE
# ----------------------------------------------------------------

# UNCOMMENT THE FOLLOWING LINE TO TEST YOUR CODE
.include "Lab-5a-Tests.asm"
