#25-03-03
#multiply by 42
#42 = 32   + 8   + 2
#   = 2^5  + 2^3 + 2^1  

li $v0 5
syscall
move $s0 $v0

sll $t0 $s0 5   #x*32
add $a0 $a0 $t0

sll $t0 $s0 3   #x^8
add $a0 $a0 $t0

sll $t0 $s0 1   #x^2
add $a0 $a0 $t0

li $v0 1
syscall