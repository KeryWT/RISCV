.globl _start
.data
	size:  .word 16
 	array: .word 2, 1, 7, 1, 2, 2, 2, 1, 12, 1, 7, 1, 2, 2, 2, 1
    
.text
_start:
    # chiama sumarray
    la   a0, array
    la   a1, size
    lw   a1, 0(a1)
    jal  ra, sumarray
    
    #exit
    li   a7, 10
    ecall

#****************************************************
# completare la funzione sumarray nel campo di sotto
# a0 = indirizzo array
# a1 = size array
#*********************sumarray***********************
sumarray:
	addi sp, sp, -8
	sd ra, 0(sp)
	li t0, 0	# inizializzo somma finale a 0
	
sumarray_loop:
	blez a1, fine # if size == 0 --> fine
	lw t1, 0(a0)	# carico in t2 il valore dell array
	add t0, t0, t1	# sommo il  nuovo valore ai valori precedenti
	
	addi a1, a1, -1 # size - 1
	addi a0, a0, 4	# incremento indirizzo di una word
	jal sumarray_loop
	
fine:
	mv a0, t0
	ld ra, 0(sp)
	addi sp,sp, 8
	ret