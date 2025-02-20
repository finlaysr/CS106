# --------------------------------
# CS106 Practical Assignment 1(b)
# ax^2 + bx + c
# --------------------------------

# sample input data

.data
A:    .word 100
B:    .word 10
C:    .word 1
.text
      li    $a0, 3

CodeToTest:                   # label for running tests
# ----------------------------------------------------------------
# Write code to evaluate ax^2 + bx + c.
# a, b and c are in memory addresses A, B and C.
# x is in register $a0.
# Place the result in $v0.
# ----------------------------------------------------------------
# YOUR CODE STARTS HERE
      lw    $t0, A            # t0 = a
      lw    $t1, B            # t1 = b
      lw    $t2, C            # t2 = C
      
      mul   $v1, $t1, $a0     # v1 = B * x
      add   $v0, $t2, $v1     # v0 = Bx + C
      mul   $a0, $a0, $a0     # a0 = a0 ^ 2
      mul   $v1, $a0, $t0     # v1 = a0 * A
      add   $v0, $v0, $v1     # v0 = (Bx + C) + A a0^2

# YOUR CODE ENDS HERE
# ----------------------------------------------------------------

# UNCOMMENT THE FOLLOWING LINE TO TEST YOUR CODE
.include "Lab-1b-Tests.asm"
