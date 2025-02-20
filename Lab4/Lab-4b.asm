# --------------------------------
# CS106 Practical Assignment 4(b)
# Making a string uppercase
# --------------------------------

# sample input data

.data
S:    .asciiz "Convert this string from lower to upper case!"
.text
      la    $a0, S

CodeToTest:                   # label for running tests
# ----------------------------------------------------------------
# The address of the first character of a null-terminated string
# will be in $a0. Convert the string to uppercase.
# ----------------------------------------------------------------
# YOUR CODE STARTS HERE
  
  loop:
  lbu  $t0, ($a0)      #$t0 =  new value
  beqz $t0, end        #if null then end
  
  bltu $t0, 97, next   #don't convert if already uppercase or symbol
  bgtu $t0, 122, next  #don't convert symbols at end
  
  subi $t0, $t0, 32    #convert to uppercase
  sb   $t0, ($a0)      #store converted character back in
  
  next:
    addi $a0, $a0, 1   #$a0 = new address
    j loop             #next character
    
  end:

# YOUR CODE ENDS HERE
# ----------------------------------------------------------------

# UNCOMMENT THE FOLLOWING LINE TO TEST YOUR CODE
.include "Lab-4b-Tests.asm"
