// Start of the program
.global _start

_start:
	// First 128-bit integer
	MOV X3, #0x0000000000000009
	MOV X4, #0x0000000000000005

	// Second 128-bit integer
	MOV X5, #0x0000000000000008
	MOV X6, #0x0000000000000002

	// Subtract first 64-bit.
	SUBS X1, X3, X5
	SBC X0, X4, X6

// Exit the program
	MOV X8, #93
	SVC #0
