//
// Assemble program to implement DO WHILE construct.
//
// DO
//   << statements in the loop >>
// UNTIL (condition)
//
// X0-X2 parameters to linux function services
// X1 is also address of byte we are writing
// X4 register to check
// X8 linux function number

.global _start

_start:	LDR X3, =input
		MOV X5, #0 // Clear X5.
do:		LDRB W4, [X3], #1 // Load a character.

		CMP X4, #43 // Compare if +
		B.EQ end

		SUB X4, X4, #48 // Convert ASCII to binary.

		ADD X5, X5, X4 // Add to sum.

		B do

		// end
end:	LDR X1, =output
		ADD X1, X1, #12 // Point to output place holder.

		ADD W5, W5, #'0' // Convert binary to ASCII.
		STRB W5, [X1] // Store the sum.

		MOV X0, #1 // Write to stdout.
		LDR X1, =output
		MOV X2, #14 // Write 14 byte.
		MOV X8, #64 // Linux write function.
		SVC #0 // Make linux system call.

		MOV X0, X5 // Exit.
		MOV X8, #93 // Linux exit function.
		SVC #0 // Make linux system call.
.data
	input:	.asciz "124+"
	output:	.ascii "The sum is: #\n"
