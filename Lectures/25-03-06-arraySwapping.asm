.data
str: .asciiz "I love CS106"

.text
#get length of string
li $a1 0
la $s0 str

Len:
  lb $s1 ($s0)
  beqz $s1 EndLen
  addi $a1 $a1 1
  addi $s0 $s0 1
  j Len
  
EndLen:
#String len in $a1


#Reverse characters of string
Main:
  la $a0 str     #pointer to str 
  move $v0 $a0   #save pointer
  add $a2 $a1 $a0 #pointer at end
  addi $a2 $a2 -1 #not null byte at end of string
  
Loop:
  lbu $t0 ($a0) #first char of dtring
  lbu $t1 ($a2) #last char of string
  sb $t0 ($a2)  #store 
  sb $t1 ($a0)
  
  addi $a0 $a0 1 #move forward
  addi $a2 $a2 -1 #move backward
  
  blt $a0 $a2 Loop #onto next characters
  
#print reversed string
Done:
  move $a0 $v0
  li $v0 4
  syscall
  
  
  