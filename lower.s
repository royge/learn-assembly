.global _start

_start:
	LDR X2, =input // Load the address of the input string.
	LDR X3, =result // Load the address of the result string.
loop:
	LDRB W4, [X2], #1 // Load a byte from the input string.
	CMP W4, #'Z' // Check if the byte is a capital letter.
	B.GT cont // If not, continue to the next byte.

	CMP W4, #'A' // Check if the byte is a capital letter.
	B.LT cont // If not, continue to the next byte.

	ADD W4, W4, #('a'-'A') // Convert the capital letter to a small letter.
cont:
	STRB W4, [X3], #1 // Store the byte in the result string.

	CMP W4, #0 // Check if the byte is the null terminator.
	B.NE loop // If not, continue to the next byte.

	MOV X0, #1 // Write.
	LDR X1, =result // Load the address of the result string.
	SUB X2, X3, X1 // Calculate the length of the result string.
	MOV X8, #64 // Linux write function.
	SVC #0 // Make linux system call.

	MOV X0, X5 // Exit.
	MOV X8, #93 // Linux exit function.
	SVC #0 // Make linux system call.

.data
	input:	.asciz "The quick brown fox!\n"
	result:	.fill 255, 1, 0
