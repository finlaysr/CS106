# --------------------------------
# CS106 Practical Assignment 3(a)
# Bitfields: Extracting data
# --------------------------------

# sample input data

.data

A:    .half 0x6573 0x7777 0x3EEF 0x7ACE 0x2BCD 0x1234

.text
CodeToTest:                   # label for running tests
# ----------------------------------------------------------------
# Data format (16 bits): JPGRYMMMMMMMMxxx
# MMMMMMMM is the magic number.
# Write code to extract the magic number from A[0] into $v0
# and the magic number from A[5] into $v1.
# ----------------------------------------------------------------
# YOUR CODE STARTS HERE
la $a0, A

lhu $v0, ($a0)
srl $v0, $v0, 3
andi $v0,  0xFF

lhu $v1, 10($a0)
srl $v1, $v1, 3
andi $v1, 0xFF


# YOUR CODE ENDS HERE
# ----------------------------------------------------------------

# UNCOMMENT THE FOLLOWING LINE TO TEST YOUR CODE
.include "Lab-3a-Tests.asm"
