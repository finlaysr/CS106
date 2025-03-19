#Finlay Robb CES
# --------------------------------
# CS106 Practical Assignment 8(a)
# Exponentiation
# --------------------------------

.text

      j     Z_StartTests      # run tests

# ----------------------------------------------------------------
# power
# Input:   a0: x        e.g. 3
#          a1: y        e.g. 4
# Returns: v0: x^y      e.g. 81
# ----------------------------------------------------------------
# YOUR CODE STARTS HERE
power:
  addi $sp $sp -4   #set space in stack for return address
  sw $ra ($sp)      #save return address to stack
  
  li $v0 1
  beqz $a1 endPower #if done then stop
  
  addi $a1 $a1 -1   #y-1
  jal power         #power(x, y-1)
  
  mul $v0 $a0 $v0   #x * power(x, y-1)
  
  endPower:
    lw $ra ($sp)    #load return address back
    addi $sp $sp 4  #reset stack
    jr $ra  


# YOUR CODE ENDS HERE
# ----------------------------------------------------------------

.include "Lab-8a-Tests.asm"
