.data
   Array: .half 0xBEED, 0xFEED, 0X3E00, 0X0DCA, 0x0035, 0x0012
   i: .byte 4
.text

Main:
  la $s0 Array
  la $s1 i
  lb $s1 ($s1)
  mul $t0 $s1 2
  add $s2 $s0 $t0  #s2 = (A[i])
  lh $a0 ($s2)     #a0 = A[i] = x
  
  andi $a1 $a0 1   #last bit of x
  beqz $a1 IsEven
  blt $a0 10 Under10
  
  #Else
  addi $s2 $s2 2  #i+1
  sll $a0 $a0 1   #x*2
  sh $a0 ($s2)    #store
  j End
  
  IsEven:
   sub $a2 $a0 1 #x-1
   sh $a2 ($s2)  #A[i] = x -1
   j End
  
  Under10:
    li $a2 0
    sh $a2 ($s2)
   
End:
  
 
