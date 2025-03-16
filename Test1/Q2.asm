#Finlay Robb CES Year 1
.data
   Array: .half 0xBEED, 0xFEED, 0X3E00, 0X0DCA, 0x0035, 0x0012
   i: .byte 4
.text
la $s0 Array     #load Array location
lb $s1 i         #load value of i

Main:
  mul $t0 $s1 2       #get offset of i
  add $s2 $s0 $t0     #get location of Array[i] in memory
  lh $a0 ($s2)        #load value at Array[i]
  
  andi $t0 $a0 1      #LSB of x
  beqz $t0 IsEven     #if value is even go to IsEven
  blt $a0 10 Under10  #if value < 10 go to Under10 
  
  #Else
  sll $a0 $a0 1    #multiply value by 2
  addi $s2 $s2 2   #next halfword locaion in memory
  sh $a0 ($s2)     #store value at i+1 location 
  j End
  
  IsEven:
   subi $a1 $a0 1  #value -= 1
   sh $a1 ($s2)    #store value
   j End
  
  Under10:
    li $a1 0       #value = 0
    sh $a1 ($s2)   #store value

End: #stop nicely
  li $v0 10
  syscall
