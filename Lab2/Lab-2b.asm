# --------------------------------
# CS106 Practical Assignment 2(b)
# Array indexing
# --------------------------------

# sample input data

.data
A:    .half     1    2   3  4 5
B:    .half 10000 1000 100 10 1
.text
      la    $a0, A
      la    $a1, B
      li    $a2, 5            # length of arrays

CodeToTest:                   # label for running tests
# ----------------------------------------------------------------
# Register $a0 contains the address of an array A of halfwords.
# Register $a1 contains the address of an array B of halfwords.
# Place B[A[1]] in $v0.
# ----------------------------------------------------------------
# YOUR CODE STARTS HERE
     lhu $t0, 2($a0)      # load A[1] into $t0
     mul $t0, $t0, 2      # mul  $t0 * 2
     add $t0, $t0, $a1    # $t0 = $t0 + $a0
     lhu $v0, ($t0)       # $v0 = ($t0)


# YOUR CODE ENDS HERE
# ----------------------------------------------------------------

# UNCOMMENT THE FOLLOWING LINE TO TEST YOUR CODE
.include "Lab-2b-Tests.asm"
