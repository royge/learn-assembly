.global _start

_start:
	MOV X1, #0x4300
	LSR X0, X1, #1 // 0x4300 >> 1 = 0x2180
	MOV X8, #93 // syscall number for write
	SVC 0 // make syscall
