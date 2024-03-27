.global sum

	.EQU VAR1,	0 // Offset for first argument (4-bytes)
	.EQU VAR2,	4 // Offset for second argument (4-bytes)
	.EQU SUM,	8 // Offset for result (4-bytes)

sum:
	STP LR, FP, [SP, #-16]! // Save LR and FP
	SUB FP, SP, #16 // Set up new frame pointer and allocate 16 bytes space for local variables
	SUB SP, SP, #16 // Allocate 16 bytes space for local variables

	STR W0, [FP, #VAR1] // Store first argument
	STR W1, [FP, #VAR2] // Store second argument

	LDR W4, [FP, #VAR1] // Load first argument
	LDR W5, [FP, #VAR2] // Load second argument

	ADD W6, W4, W5 // Add the two arguments
	STR W6, [FP, #SUM] // Store the result

	LDR W0, [FP, #SUM] // Load the result
	ADD SP, FP, #16 // Deallocate 16 bytes space for local variables
	LDP LR, FP, [SP], #16 // Restore LR and FP
	RET // Return
