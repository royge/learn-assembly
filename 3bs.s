.global _start

_start:
	MOV X1, #0x23
	LSL X0, X1, #3
	MOV X8, #93
	SVC 0
