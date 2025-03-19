# Finlay Robb CES
# --------------------------------
# CS106 Practical Assignment 8(b)
# Fibonacci numbers
# --------------------------------

.text

      j     Z_StartTests      # run tests

# ----------------------------------------------------------------
# fib
# Input:   a0: n
# Returns: v0: fib(n)
# Calls Counter subroutine.
# ----------------------------------------------------------------
# YOUR CODE STARTS HERE

fib:
  #store retun address and a0 in stack
  addi $sp $sp -12
  sw $ra ($sp)
  sw $a0 4($sp)
  
  jal Counter       #add 1 to counter
  
  lw $a0 4($sp)     #counter messes up a0 so load it back
  move $v0 $a0      #v0 = a0
  ble $a0 1 fibEnd  #if done then stop
  
  addi $a0 $a0 -1
  jal fib           #fib(n-1)
  sw $v0 8($sp)     #save result to stack
  
  lw $a0 4($sp)     #get original a0 back
  addi $a0 $a0 -2   
  jal fib           #fib(n-2)
  
  lw $t0 8($sp)     #retireve value of fib(n-1)
  add $v0 $t0 $v0   #fib(n-1) + fib(n-2)
  
  fibEnd:
    lw $ra ($sp)    #get return address back
    addi $sp $sp 12 #reset stack
    jr $ra

# YOUR CODE ENDS HERE
# ----------------------------------------------------------------
.include "Lab-8b-Tests.asm"
