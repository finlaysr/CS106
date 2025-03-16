#Finlay Robb CES Year 1
# assume a word is given in $a0 and a bit position in $a1
.data
  word: .word 0xFA070010

.text 
Extract:
  bgt $a1 31 Error  #if position > 31 then error
  blt $a1 0  Error  #if position < 0  then error
  
  li $t0 1          #put 1 in LSB
  sllv $t0 $t0 $a1  #move to position in $a1
  and $a0 $a0 $t0   #get bit at that position
  
  jr $ra            #go back to main program
  
Error:
  break             #stop execution with error
