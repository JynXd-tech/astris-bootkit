# astris-bootkit
Many people asks me how they can load iBSS and iBEC from DFU after device was demoted. This small documentation was written to explain how to do this and what's the problem. I hoped to make this as clear as possible. Happy reading and if you have any questions feel free to ask me on twitter (@exploit3dguy) =). I do not guarantee that I will answer but I will try to (sometimes I don't see your DMs). The method described here should work on any device meaning A9X and prototypes too.
# The problem
So let's say production devices and components doesn't go in pair with demotion. The low level bootloaders performs checks if device is demoted and if it is device may disable USB (this applies to A9 for example) or device will fail to validate any image4. 
# Developing the BootKit 
I shared the sample code in this repo. See src/boot.s
The code looks like that:

`.text`

`.pool`


`.set prepare_and_jump, 0x10000B014`

`.set JUMP_ADDR, 0x180380000`


`.global _main`

`_main:`

`MOV X0, #0x0`

`LDR X1, =JUMP_ADDR`

`MOV X2, X0`

`LDR X4, =0x100000790`

`BLR X4`

`LDR X4, =prepare_and_jump`

`BR X4`

Let's first say what those offsets stand for:

1. prepare_and_jump - function in iBoot/LLB/SecureROM which is responsible for booting iBoot/XNU/diags/SecureROM etc.

2. JUMP_ADDR - the address where we put our bootloader

3. 0x100000790 - the function that calls boot trampoline. Boot Trampoline's task is to zero all the registers before jumping to a new image.

