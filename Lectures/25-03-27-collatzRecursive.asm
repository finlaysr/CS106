#collatz 1 count = count
#colatz n count | even n    = collatz (n/2) (count + 1)
#               | otherwise = collatz (3n+1) (count + 1)

li $a0 1
li $a1 0   #count
jal collatz

move $a0 $v0
li $v0 1
syscall
li $v0 10

collatz:
  addi $sp $sp -4  #make space for return address
  sw $ra ($sp)     #save return address
  beq $a0 1 collatzEnd
  
  andi $a0 $a0 1
  beqz $t0 even
  #if not odd: 3n + 1
  mul $a0 $a0 3
  addi $a0 $a0 1
  
  j call
  
  even:
    srl $a0 $a0 1 #divide by 2
    
  call:
    addi $a1 $a1 1 #count += 1#
    jal collatz
  
  collatzEnd:
    move $v0 $a1  #return count
    lw $ra ($sp)
    addi $sp $sp 4
    jr $ra
