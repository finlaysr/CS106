#the bits in each letter of a string have been mixed up! Instead of 
# x8 x7 x6 x5 | x4 x3 x2 x1 they have been stored as 
# x4 x3 x2 x1 | x8 x7 x6 x5. Unscramble the code to reveal the message

.data 
  flow1: .asciiz "rÖ7ö''âGr7æöGöWÂdV'FâvWV77rÖ¦W7GæöGW7VFGö'Wæææv'öWæF7öævÖÆÆæGVÖFFÆVöfGVævG&Væv67VF&¶ÆÆV''ö&öG7â"
  
.text 
  la $s0 flow1    #s0 = adress

Main:
  lbu $t0, ($s0)   #t0 = full value
  beqz $t0, Print   #if done go to end
  
  sll $a0, $t0, 4     #move right bits to left
  srl $a1, $t0, 4     #move left bits to right
  or $a0, $a0, $a1    #combine back together
  
  sb $a0, ($s0)   #store back
  addi $s0, $s0, 1 #next character
  j Main
  

Print:
  la $a0 flow1    #s0 = adress
  li $v0 4        #code for print
  syscall         #print string