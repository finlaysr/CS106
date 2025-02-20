# --------------------------------
# CS106 Practical Assignment 1(a)
# a + 2b + 3c
# --------------------------------

# sample input data

.data
A:    .word 100
B:    .word 10
C:    .word 1

.text
CodeToTest:                   # label for running tests
# ----------------------------------------------------------------
# Write code to evaluate a + 2b + 3c.
# a, b and c are in memory addresses A, B and C.
# Place the result in $v0.
# ----------------------------------------------------------------
# YOUR CODE STARTS HERE

      # Sample code: This computes a + b
      lw    $t0, A            # t0 = a
      lw    $t1, B            # t1 = b
      lw    $t2, C            # t2 = C
      
      mul   $v1, $t1, 2       # v1 = 2b
      add   $v0, $t0, $v1     # v0 = a + 2b
      mul   $v1, $t2, 3       # v1 = 3c
      add   $v0, $v0, $v1     # v0 = (a + 2b) + 3c


# YOUR CODE ENDS HERE
# ----------------------------------------------------------------

# UNCOMMENT THE FOLLOWING LINE TO TEST YOUR CODE
.include "Lab-1a-Tests.asm"
