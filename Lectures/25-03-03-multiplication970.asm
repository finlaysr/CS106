#25-03-03
#multiply by 42
#970 = 1000 - 54
#    = 1000 - 64  + 8   + 2
#    = 2^10 - 2^6 + 2^3 + 2^1
#    = 2^10 - (2^6 - 2^3 - 2^1)


li $v0 5
syscall
move $s0 $v0 #$s0 = x

sll $a0 $s0 10 #x*1024

sll $t1 $s0 6 #x*64
sll $t2 $s0 3 #x*8
sub $t1 $t1 $t2 #64-8

sll $t1 $s0 1
sub $t1 $t1 $t2 #64-10

sub $a0 $a0 $t1


li $v0 1
syscall