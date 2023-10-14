//
// Assembler program to print a register in hex
// to stdout.
//
// X0-X2 parameters to linux function services
// X1 is also address of byte we are writing
// X4 register to print
// W5 loop index
// W6 current character
// X8 linux function number
//

.global _start

// To be printed: 0x1234FEDC4F5D6E3A

_start:	MOV		X4, #0x6E3A
		MOVK	X4, #0x4F5D, LSL #16
		MOVK	X4, #0xFEDC, LSL #32
		MOVK	X4, #0x1234, LSL #48

		LDR	X1, =hexstr		// point to string
		ADD	X1, X1, #17		// point to end of string

		MOV W5, #16			// loop 16 times (i.e. 16 hex digits)
loop:	AND W6, W4, #0xf	// get low 4 bits of X4 (i.e. mask off all low 4 bits)
		CMP W6, #10			// check if W6 is 0-9 or A-F
		B.GE letter			// if W6 >= 10, then it is a letter
		ADD W6, W6, #'0'	// convert to ASCII
		B cont
letter:
		ADD W6, W6, #'A'-10	// convert to letter
cont:
		STRB W6, [X1]		// store character
		SUB X1, X1, #1		// decrement pointer to point to next character

		LSR X4, X4, #4		// shift X4 right 4 bits

		SUBS W5, W5, #1		// decrement loop counter
		B.NE loop			// if not equal to zero/done, loop

		MOV X0, #1			// write to stdout
		LDR X1, =hexstr		// point to string with new values
		MOV X2, #19			// number of bytes to write
		MOV X8, #64			// linux write function
		SVC #0				// call linux function

		MOV X0, #0			// exit status
		MOV X8, #93			// linux exit function
		SVC #0				// call linux function
.data
hexstr:	.ascii	"0x123456789ABCDEFG\n" 
