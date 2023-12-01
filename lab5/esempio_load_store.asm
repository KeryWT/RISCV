.globl _start
.data 
	v1: .word 8
	v2: .word 9
	v3: .word 0
 
.text

_start:

    #<assembler code here>
   

exit:
    addi x17, x0, 10  # call number 10 = exit
    ecall
