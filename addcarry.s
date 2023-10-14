.global _start

// First 64 bits
_start:	MOV	X2, #0x0000000000000003
	MOV	X3, #0xFFFFFFFFFFFFFFFF

// Seconds 64 bits
	MOV	X4, #0x0000000000000005
	MOV	X5, #0x0000000000000001

	ADDS	X1, X3, X5	// Lower order 64 bits
	ADC 	X0, X2, X4	// High order 64 bits

// Setup for termination
	MOV	X8, #93
	SVC	0
