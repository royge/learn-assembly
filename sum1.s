.global _start

_start:
	MOV	 X0, #2 // First argument
	MOV	 X1, #3 // Second argument

	BL sum // Call the function

	ADD X0, X0, #48 // Convert the sum to ASCII

	LDR	 X3, =result // Load the address of the result
	STRB W0, [X3], #1 // Store the result in the result array
	MOV	 W0, #10 // Store the newline character
	STRB W0, [X3], #1 // Store the newline character

	MOV X0, #1 // File descriptor for stdout
	LDR X1, =result // Address of the result
	MOV X2, #3 // Length of result

	MOV X8, #64 // syscall number for exit
	SVC #0 // Call the kernel

	MOV X0, #0 // Exit code
	MOV X8, #93 // syscall number for exit
	SVC #0 // Call the kernel

.data
	result: .fill 3, 4, 0
