.global _start

_start:
	LDR X1, =arr1 // Load the address of arr1 into X1.

	LDR W2, [X1, #(0 * 2)]
	AND W2, W2, #0x0000FFFF		// Mask the high 16 bits.

	LDR W3, [X1, #(1 * 2)]
	AND W3, W3, #0x0000FFFF		// Mask the high 16 bits.

	LDR W4, [X1, #(2 * 2)]
	AND W4, W4, #0x0000FFFF		// Mask the high 16 bits.

	// Using register as offset.
	MOV X5, #2
	LDR W6, [X1, X5]
	AND W6, W6, #0x0000FFFF		// Mask the high 16 bits.

	MOV X8, #93 // Linux exit function.
	SVC #0 // Make linux system call.
.data
	arr1:	.short 0x1048, 0xb165, 0x006c
