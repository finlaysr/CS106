#string in $a0

.data
  newLine: .asciiz "\n"

.text

Println:
  li $v0, 4  #print string
  syscall
  
  la $a0, newLine  #print newine
  syscall
  
  j ReturnPrintln