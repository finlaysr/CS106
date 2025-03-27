#recursive length checking

.data
  str: .asciiz "123456789"
  
.text

la $a0 str
la $a1 0

jal Len
j End


Len:
  lbu $t0 ($a0)    #load next char
  beqz $t0 EndLen  #if ar end
  addi $a0 $a0 1   #next char
  addi $a1 $a1 1   #len ++
  
  addi $sp $sp -4  #make space in stack for return address
  sw $ra ($sp)     #store return address
  
  jal Len          #go to next char
  
  lw $ra ($sp)     #load back in return adress
  addi $sp $sp 4   #clear stack
    
  EndLen:
    move $v0 $a1   #return len value
    jr $ra         #go back to previous

End:   #print len
  move $a0 $v0 
  li $v0 1
  syscall
