# --------------------------------
# CS106 Practical Assignment 4(a)
# Making a character uppercase
# --------------------------------

# sample input data

.data
S:    .asciiz "z"

.text
      la    $a0, S

CodeToTest:                   # label for running tests
# ----------------------------------------------------------------
# The address of an ASCII character will be in $a0. If the
# character is a lower case letter, replace it (in memory) with
# its upper case version. Otherwise don't change it.
# ----------------------------------------------------------------
# YOUR CODE STARTS HERE
  lbu $t0, ($a0)
  bltu $t0, 97, end    #dont' convert if already uppercase
  bgtu $t0, 122, end   #dont' convert symbols at end
  
  #Conversion
  subi $t0, $t0, 32    #convert to uppercase
  sb $t0, ($a0)        #store uppercase letter back in
  
  end:


# YOUR CODE ENDS HERE
# ----------------------------------------------------------------

# UNCOMMENT THE FOLLOWING LINE TO TEST YOUR CODE
.include "Lab-4a-Tests.asm"
