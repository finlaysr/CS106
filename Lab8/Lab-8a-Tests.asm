# --------------------------------
# CS106 Practical 8(a) Test Data
# Integer partitions
# --------------------------------

.data

.eqv	NUMTESTS	5	# number of tests
.eqv	NUMMEMARGS	0	# number of arguments in memory
.eqv	MEMARGLOC	0	# location of arguments in memory
.eqv	MEMARGSIZE	0	# size of memory argument
.eqv	NUMREGARGS	2	# number of arguments in $aN registers
.eqv	NUMREGRES	1	# number of results in $vN registers (0: result in memory)
.eqv	ARGFORMAT	1	# decimal integer
.eqv	RESFORMAT	1	# decimal integer
.eqv	FUNTEST	1	# testing subroutine? (-1 for counter in $v1)
.eqv	CodeToTest	power

Z_Buffer:	.word		0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0

Z_TestStr0:	.asciiz 	"Evaluating power("
Z_TestStr1:	.asciiz	","
Z_TestStr2:	.asciiz	") ...\n"
Z_TestStrs:	.word 	Z_TestStr0 Z_TestStr1 Z_TestStr2


Z_TestData:			# arguments followed by results

	.word 3 4 81
	.word -777777777 0 1
	.word 1 888 1
	.word 2 29 536870912
	.word -9 9 -387420489


.include "RunTest.asm"
