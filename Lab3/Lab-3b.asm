# --------------------------------
# CS106 Practical Assignment 3(b)
# Bitfields: Modifying data
# --------------------------------

# sample input data

.data
A:    .half 0x5555 0x7777 0x3EEF 0x7ACE 0x2BCD 0x1234

.text
CodeToTest:                   # label for running tests
# ----------------------------------------------------------------
# Data format (16 bits): JPGRYMMMMMMMMxxx
# MMMMMMMM is the magic number.
# Write code to load A[1] and change its magic number to PG0YPG1Y.
# Place the modified A[1] in $v0.
# ----------------------------------------------------------------
# YOUR CODE STARTS HERE
lhu  $v0, A+2            #$v0 = A[1]
andi $v0, $v0, 0xF807    #remove middle

andi $t0, $v0, 0x6800    #get PG-Y
ori  $t1, $t0, 0x1000    #to  PG0Y
srl  $t0, $t0, 4         #move right by 4

srl  $t1, $t1, 8         #move right by 8

or   $v0, $v0, $t0        #put into main
or   $v0, $v0, $t1        #put into main


# YOUR CODE ENDS HERE
# ----------------------------------------------------------------

# UNCOMMENT THE FOLLOWING LINE TO TEST YOUR CODE
.include "Lab-3b-Tests.asm"