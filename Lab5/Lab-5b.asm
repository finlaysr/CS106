# --------------------------------
# CS106 Practical Assignment 5(b)
# Signed overflow
# --------------------------------

.data
A:    .half 99 101
.text
      la    $a0, A
      la    $a1, A+2

CodeToTest:                   # label for running tests
# ----------------------------------------------------------------
# Add the signed 16-bit numbers at the addresses in $a0 and $a1.
# If no overflow (as 16-bit signed integers) occurred, place their sum in $v0.
# If overflow did occur, place the minimum possible 32-bit signed value in $v0.
# ----------------------------------------------------------------
# YOUR CODE STARTS HERE



# YOUR CODE ENDS HERE
# ----------------------------------------------------------------

# UNCOMMENT THE FOLLOWING LINE TO TEST YOUR CODE
#.include "Lab-5b-Tests.asm"
