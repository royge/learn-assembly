.global _start

_start:
	LDR X0, =input	// Start address of input string
	LDR X1, =result	// Address of result string

	BL tolower // Call tolower function
	
	MOV X2, X0	// Return code is the length of the string
	
	MOV X0, #1 // Stdout
	LDR X1, =result // Address of result string to be printed
	MOV X8, #64 // Write sytem call
	SVC #0 // Call kernel to output the result string
	
	MOV X0, #0 // Exit.
	MOV X8, #93 // Linux exit function.
	SVC #0 // Make linux system call.

.data
	input:	.asciz "The quick brown fox JUMPS OVER THE LAZY DOG!\n"
	result:	.fill 255, 1, 0
