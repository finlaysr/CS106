.data
arrayByte: .byte 9, 10, 11, 12
arrayHalf: .half 5, 6, 7, 8
arrayWord: .word 1, 2, 3, 4

.text
la $t0, arrayWord    # $t0 points to arrayWord
li $s0, 0,           # $s0 = index (i)
li $v0, 34           # syscall instruction 

# First pass
sll $t1, $s0, 2      # $t1 = i*4
add $t1, $t1, $t0    # $t1 = location of array[i]
lw $a0, ($t1)        # $a0 = array[i]
syscall
addi $t0, $s0, 1     #i++

#second
sll $t1, $s0, 2      # $t1 = i*4
add $t1, $t1, $t0    # $t1 = location of array[i]
lw $a0, ($t1)        # $a0 = array[i]
syscall
#addi $t0, $s0, 1     #i++

li $v0, 10
syscall

#li $a0, 0xFFFFFFFF
#andi $t0, $a0, 0x07C03F00


