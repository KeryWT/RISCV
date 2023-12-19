.globl _start
.data
    array: .word 4, 2, 2, 4, 4, 5, 4, 3, 3, 3
    len:   .word 10
.text
_start:
    # chiama occurs
    la   a0, array
    la   t0, len
    lw   a1, 0(t0)
    li   a2, 3	# valore n
    jal  ra, occurs
    # exit
    li   a7, 10
    ecall
#*************************************************
#PROCEDURA OCCURS
# a0 --> indirizzo in memoria di un array di parole
# a1 --> lunghezza dell array (intero positivo)
# a2 --> intero positivo r
#################################################
occurs:

	li t0, 0 # i = 0
	li t1, 0 # counter
occurs_loop:
	lw t2, 0(a0) # carico valore da array
	bge t0, a1, occurs_end	# se ho finito l array, esco
	bne t2, a2, occurs_skip
	addi t1, t1, 1 # counter++
occurs_skip:
	addi t0, t0, 1 # i++
	addi a0, a0, 4 # incremento indirizzo del valore in array
	j occurs_loop
	
occurs_end:
	mv a0, t1 # sposto in a0 il risultato
	ret
	