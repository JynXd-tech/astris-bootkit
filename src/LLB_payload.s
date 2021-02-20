.text

.pool


.set prepare_and_jump, 0x18039863C
.set JUMP_ADDR, 0x800000000


.global _main

_main:
MOV X0, #0
LDR X1, =JUMP_ADDR
MOV X2, X0
LDR X4, =prepare_and_jump
BR X4