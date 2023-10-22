.global _start

_start:
	LDR X2, =input
	LDR X3, =result
loop:
	LDRB W4, [X2], #1
	CMP W4, #'Z'
	B.GT cont

	CMP W4, #'A'
	B.LT cont

	ADD W4, W4, #('a'-'A')
cont:
	STRB W4, [X3], #1

	CMP W4, #0
	B.NE loop

	MOV X0, #1
	LDR X1, =result
	SUB X2, X3, X1
	MOV X8, #64
	SVC #0

	MOV X0, X5 // Exit.
	MOV X8, #93 // Linux exit function.
	SVC #0 // Make linux system call.

.data
	input:	.asciz "The quick brown fox!\n"
	result:	.fill 255, 1, 0
