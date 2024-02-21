.global tolower

tolower:
	MOV X4, X1 // Keep the address of the output string
loop:
	LDRB W5, [X0], #1 // Load the character from the input string and increment the pointer
	CMP W5, #'Z' // Check if the character is a capital letter
	B.GT cont // If not, continue

	CMP W5, #'A' // Check if the character is a capital letter
	B.LT cont // If not, continue

	ADD W5, W5, #('a' - 'A') // Convert the character to lowercase
cont:
	STRB W5, [X4], #1 // Store the character in the output string and increment the pointer

	CMP W5, #0 // Check if the character is the null terminator
	B.NE loop // If not, continue to next character

	SUB X0, X4, X1 // Calculate the length of the output string by subtracting pointers

	RET
