.global _start

_start:
	LDR X2, =input
	LDR X3, =output
loop:
	LDRB W4, [X2], #1

	CMP W4, #'A' // Before 'A' are not alphabets.
	B.LT space

	CMP W4, #'z' // After 'z' are not alphabets.
	B.GT space

	SUBS W6, W4, #'a' // Between 'Z' and 'a' are not alphabets.
	B.PL cont

	SUBS W6, W4, #'Z' // Between 'Z' and 'a' are not alphabets.
	B.MI cont
space:
	CMP W4, #0 // Null is 0.
	B.EQ cont

	CMP W4, 0xa // Newline is 0xa.
	B.EQ cont

	MOV W4, 0x20 // Space is 0x20.
cont:
	STRB W4, [X3], #1

	CMP W4, #0 // Loop until null.
	B.NE loop

	STRB W4, [X3], #1

	MOV X0, #1
	LDR X1, =output
	SUB X2, X3, X1
	MOV X8, #64
	SVC #0

	MOV X0, X5 // Exit.
	MOV X8, #93 // Linux exit function.
	SVC #0 // Make linux system call.

.data
	input: .asciz "2023 is the year we'll finally launch project @Success123!\n"
	output: .fill 255, 1, 0
