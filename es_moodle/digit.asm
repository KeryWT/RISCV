.globl _start
.data
    d: .byte '1'
.text
_start:
    # call digit
    la   a0, d
    lbu  a0, 0(a0)
    jal  ra, digit

    #exit
    li   a7, 10
    ecall

#****************************************************
# completare la funzione digit nel campo di sotto
#**********************DIGIT*************************

digit:
	li t0, 48
	li t1, 57
	
	blt a0, t0, digit_0
	bgt a0, t1, digit_0
	li a0, 1
	ret
digit_0:
	li a0, 0
	ret