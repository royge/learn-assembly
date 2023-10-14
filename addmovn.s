// Examples of the ADD/MOVN instructions
.global _start	// Program starting address.

// Multiply 2 by -1 by usaing MOVN and then add 1.
_start:	MOVN	W0, #2
	ADD	W0, W0, #1

// Setup the paramters to exit the program and then call linux to do it.
// W0 is the return code and and where the result of calculation is.
	MOV	X8, #93	// Terminate
	SVC	0	// Call linux service to terminate
