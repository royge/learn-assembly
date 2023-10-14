.global _start

// First 192-bit
_start:	MOV X4, #0xFFFFFFFFFFFFFFFF
		MOV X5, #0x0000000000000001
		MOV X6, #0x0000000000000004
// Second 192-bit
		MOV X7, #0x0000000000000002
		MOV X9, #0x0000000000000008
		MOV X10, #0x0000000000000003
// Add first 64-bit
		ADDS X2, X4, X7
// Add second 64-bit
		ADCS X1, X5, X9
// Add third 64-bit
		ADC X0, X6, X10

// Exit
		MOV X8, #93
		SVC #0
