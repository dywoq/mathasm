#include "textflag.h"

DATA ·one<>+0(SB)/8, $0x3ff0000000000000
GLOBL ·one<>(SB), RODATA, $8

// func Pow(x float64, n int) float64
// arg0: x float64
// arg8: n int
// ret:  float64
TEXT _mathasm·Pow(SB), NOSPLIT, $0-24
    MOVSD x+0(FP), X0
    MOVQ n+8(FP), AX
    MOVSD ·one<>(SB), X1
    TESTQ AX, AX
    JE loop_end
loop_start:
    CMPQ AX, $1
    JL loop_end
    MULSD X0, X1
    DECQ AX
    JMP loop_start
loop_end:
	MOVSD X1, ret+16(FP)
	RET
	