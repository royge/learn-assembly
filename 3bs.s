.global _start

_start:
	MOV X1, #0x23 // X1 = 0x23
	LSL X0, X1, #3 // X0 = X1 << 3
	MOV X8, #93 // syscall number for exit
	SVC 0 // exit(0)
