#Finlay Robb CES Year 1
.data
   A: .half 0xBEED, 0xFEED, 0X3E00, 0X0DCA, 0x0007, 0x0012, 0x8000, 0x1234 , 0x5678, 0x9999
   terminate: .asciiz "Done!"
   newline: .byte 0x0A
   
.text
  la $s0 A         #load address of A
  li $t1 0         #amount of negaive numbers passed
  
  Main:
    lh $a0 ($s0)   #load first value into $a0
    addi $s0 $s0 2 #address of next value
    
    li $v0 1       #syscall to print int
    syscall        #print first value
    
    andi $t0 $a0 0x8000  #get most significant bit of value
    
    #print newline
    li $v0 4
    la $a0 newline
    syscall
    
    #Branch if negative
    beq $t0 0x8000 Neg  #if MSB is 1 then negative
    
    j Main  #next value
  
  Neg:
    addi $t1 $t1 1  #add one to negative count
    beq $t1 3 End   #stop if 3 negatives passed
    j Main          #else go to nex number
    
  End:
    #print termination string
    li $v0 4       
    la $a0 terminate
    syscall