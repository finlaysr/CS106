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



# YOUR CODE ENDS HERE
# ----------------------------------------------------------------

# UNCOMMENT THE FOLLOWING LINE TO TEST YOUR CODE
#.include "Lab-6a-Tests.asm"
