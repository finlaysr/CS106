# fac n = n * (fac n-1)
# fac 1 = 1
.data
  enterNum: .asciiz "Enter number: "

.text

Main:
  jal getInput
  jal RecFac
  move $a0 $v0
  li $v0 1
  syscall
 
  
  RecFac:
  addi $sp $sp -8 #make space for 2 words on stack
  sw $a0 ($sp)
  sw $ra 4($sp)
  
  bgt $a0 1 Large  #if not base case
  
  li $v0 1         #base case
  j End
  
  Large:
    addi $a0 $a0 -1
    jal RecFac
    lw $a0 ($sp)
    mul $v0 $v0 $a0
    
  lw $ra 4($sp)  
  addi $sp $sp 8  #return stack to original state
  jr $ra
  
  
  j RecFac



getInput:
  li $v0 4
  la $a0 enterNum
  syscall
  li $v0 5
  syscall
  move $a0 $v0
  jr $ra

End: