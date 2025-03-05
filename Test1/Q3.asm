.data
   Array: .half 0xFFFF, 0x1000, 0X3EEE, 0X0DCA, 0x0000, 0x0012
   Size: .byte 6
   newline: .asciiz "\n"
   
.text
la $s0 Array
lb $s1 Size #counter from 6 -> 0

Main:
  beqz $s1 End  #if done
  
  lh $a0 ($s0)   #A[i]
  #print in hex
  li $v0 34
  syscall
  
  andi $t1 $s1 1 #last bit of counter
  beqz $t1 Even  #if counter even
  
  #if odd
  srl $a0 $a0 1
  j Loop
  
Even:
  negu $a0 $a0
  
Loop:
  sh $a0 ($s0) #store new value
  
  #print in hex
  li $v0 34
  syscall
  #print newline
  li $v0 4
  la $a0 newline
  syscall
  
  addi $s0 $s0 2 #next array value
  subi $s1 $s1 1 #counter --
  j Main
  
End:
 

 
