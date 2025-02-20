# --------------------------------
# CS106 Practical Assignment 2(a)
# Pointers
# --------------------------------

# sample input data

.data
P:    .word 99
Q:    .word 101
.text
      la    $a0, P
      la    $a1, Q

CodeToTest:                   # label for running tests
# ----------------------------------------------------------------
# Registers $a0 and $a1 will contain pointers to words in memory.
# Read the words at memory locations $a0 and $a1, and place their
# product back into memory location $a0.
# ----------------------------------------------------------------
# YOUR CODE STARTS HERE
      lw    $t0, ($a0)   # $t0 = (P)
      lw    $t1, ($a1)   # $t1 = (Q)
      
      mul  $t2, $t0, $t1 # $t2 = (P)*(Q)
      sw   $t2, ($a0)    # store $t2 in (P)

# YOUR CODE ENDS HERE
# ----------------------------------------------------------------

# UNCOMMENT THE FOLLOWING LINE TO TEST YOUR CODE
.include "Lab-2a-Tests.asm"
