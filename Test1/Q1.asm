.data
   A: .half 0xBEED, 0xFEED, 0X3E00, 0X0DCA, 0x0007, 0x0012, 0x8000, 0x1234 , 0x5678, 0x9999
   terminate: .asciiz "Done!"
   newline: .byte 0x0A
   
.text
  la $s0 A
  li $t1 0
  
  
  Main:
    li $v0 1
    lh $a0 ($s0)
    syscall
    
    #determine negative
    andi $t0 $a0 0x8000
    
    #newline
    li $v0 4
    la $a0 newline
    syscall
    
    #Branch if negative
    beq $t0 0x8000 Neg
    
    addi $s0 $s0 2
    j Main
  
  Neg:
    addi $t1 $t1 1
    beq $t1 3 End
    addi $s0 $s0 2
    j Main
    
    
  End:
    li $v0 4
    la $a0 terminate
    syscall
    
