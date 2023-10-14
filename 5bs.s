.global _start

_start:	MOV X1, #0x4300
		LSR X0, X1, #1
		MOV X8, #93
		SVC 0
