#Finlay Robb CES Year 1
.data
   Array: .half 0xFFFF, 0x1000, 0X3EEE, 0X0DCA, 0x0000, 0x0012
   Size: .byte 6
   newline: .byte 0x0A
   
.text
la $s0 Array   #get adress of Array
lb $s1 Size    #counter from 6 -> 0

Main:
  beqz $s1 End  #if every number checked
  
  lh $a0 ($s0)   #get A[i]
  
  #print unmodified in hex
  li $v0 34
  syscall
  
  andi $t1 $s1 1 #last bit of counter
  beqz $t1 Even  #if counter even
  
  #else if counter odd
  srl $a0 $a0 1  #divide by 2
  j Loop         #next value  
Even:
  not $a0 $a0   #apply negation to value
  
Loop:
  sh $a0 ($s0) #store modified value
  addi $s0 $s0 2 #next array position
  subi $s1 $s1 1 #counter -= 1
  
  #print modified value in hex
  li $v0 34
  syscall
  #print newline
  li $v0 4
  la $a0 newline
  syscall
  
  j Main  #next value
  
End:
 

 
