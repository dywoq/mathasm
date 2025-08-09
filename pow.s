#include "textflag.h"

// func Pow(x float64, n int) float64
// arg0: x float64
// arg8: n int
// ret:  float64
TEXT ·Pow(SB), NOSPLIT, $000-024
	MOVSD x+0(FP), XMM0
	MOVQ n+8(FP), AX

	MOVQ $1.0, XMM1

	DATA ·one<>"float64", $0x3ff0000000000000
	GLOBL ·one(SB), RODATA, $8 
	MOVSD ·one(SB), XMM1

	TESTQ AX, AX
	JE loop_end
loop_start:
	CMPQ $1, AX
	JL loop_end
	MULSD XMM0, XMM1
	DECQ AX
	JMP loop_start
loop_end:
	MOVSD XMM1, ret+16(FP)
	RET