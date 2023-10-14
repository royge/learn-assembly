//
// Assemble program to implement SELECT/CASE construct.
//
// SELECT number
//   CASE 1:
//        << statements if number is 1 >>
//   CASE 2
//        << statements if number is 2>>
//   CASE ELSE:
//        << statements if not any other case >>
// END SELECT 
//
// X0-X2 parameters to linux function services
// X1 is also address of byte we are writing
// X4 register to check
// X8 linux function number

.global _start

_start:
		MOV	X4, #2			// X4 is the number we are checking
		LDR X1, =message	// X1 is the address of the message
		ADD X1, X1, #10		// Point X1 to the last printable character of the message

		CMP X4, #1			// Check if X4 is 1
		B.GT case2			// If X4 is greater than or equal to 1, go to case2
		// case 1
		ADD W4, W4, #1		// Add 1 to X4
		B show				// Display case 1 message
case2:
		CMP X4, #2			// Check if X4 is 2
		B.GT else			// If X4 is greater than or equal to 2, go to case3
		LSL W4, W4, #3		// Multiply X4 by 8
		LSR W4, W4, #2		// Divide X4 by 4
		B show				// Display case 2 message
else:
		LSL W4, W4, #1		// Multiply X4 by 2
		B show
show:
		ADD W4, W4, #'0'	// Convert X4 to ASCII
		SUB X1, X1, #1		// Point X1 to the last printable character of the message
		STRB W4, [X1]		// Store the character in W4 to the address in X1

		MOV X0, #1			// write to stdout
		LDR X1, =message	// point to string with new values
		MOV X2, #19			// number of bytes to write
		MOV X8, #64			// linux write function
		SVC #0				// call linux function

		B end
end:
		MOV X0, #0			// exit status
		MOV X8, #93			// linux exit function
		SVC #0				// call linux function

.data
	message:	.ascii	"Results: #\n"
