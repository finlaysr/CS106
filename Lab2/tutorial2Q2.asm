.data
	A: .byte 0xAA 0xBB 0xCC 0xDD
.text
	lhu $s1, A+2
	sw $s1, A
	sb $s1, A+3
	lbu $s1, A+1
	sh $s1, A
	lhu $s1, A+1
	