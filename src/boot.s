.text

.pool


.set prepare_and_jump, 0x10000B014
.set JUMP_ADDR, 0x180380000

.global _main

_main:
MOV X0, #0
LDR X1, =JUMP_ADDR
MOV X2, X0
LDR X4, =0x100000790
BLR X4
LDR X4, =prepare_and_jump
BR X4