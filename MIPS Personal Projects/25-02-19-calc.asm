.data
num1_print:  .asciiz  "\n\nEnter First Number: "
oper_print:  .asciiz  "Enter Operator (+, -, x, /, ^): "
num2_print:  .asciiz  "Enter Second Number: "
ans_print:   .asciiz  "Answer: "
input:       .space   10


.text
Main:
  #Get first input
  la $a0, num1_print    #print message
  li $v0, 4
  syscall
  
  li $v0 5
  syscall
  move $t0, $v0         #$t0 == num 1
  
  #Get operator
  la $a0, oper_print    #print message
  li $v0, 4
  syscall
  
  li $v0, 8
  la $a0, input
  li $a1, 9
  syscall
  lb $t1, input         #$t1 == operator
  
  #Get second input
  la $a0, num2_print    #print message
  li $v0, 4
  syscall
  
  li $v0 5
  syscall
  move $t2, $v0         #$t2 == num 2
  
  
  move $t3, $t0         #used as base for power
  #Find what operator
  beq $t1, 0x2b, plus    # +
  beq $t1, 0x2d, minus   # -
  beq $t1, 0x78, times   # x
  beq $t1, 0x2a, times   # *
  beq $t1, 0x2f, divide  # /
  beq $t1, 0x5e, power   # ^
  j Main                 # invalid
  
  
plus:
  add $t3, $t0, $t2
  j answer

minus:
  sub $t3, $t0, $t2
  j answer
 
times:
  mul $t3, $t0, $t2
  j answer
  
divide:
  div $t3, $t0, $t2
  j answer
  
power:
  ble $t2, 1, answer
  mul $t3, $t3, $t0
  sub $t2, $t2, 1
  j power
  
  
#show answer
answer:
  la $a0, ans_print     #print message
  li $v0, 4
  syscall
  
  li $v0, 1             #print answer
  move $a0, $t3
  syscall
  
  j Main               #restart
