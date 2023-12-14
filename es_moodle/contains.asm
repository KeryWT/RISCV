.globl _start
.section
.data
    buffer: .string  "-----0"
    low:    .byte  '0'
    high:   .byte  '9'

.text
_start:
    # call contains
    la   a0, buffer
    la   a1, low
    la   a2, high
    lbu  a1, 0(a1)
    lbu  a2, 0(a2)
    jal  ra, contains

    # exit
    li   a7, 10
    ecall

#******************************************
# completare la funzione nel campo di sotto

#####################CONTAINS######################
contains:
loop_contains:
	lbu t1, 0(a0)	# carichiamo in t1 un carattere per volta
	addi a0, a0, 1	# aggiungiamo l'offset all'indirizzo della stringa
	lbu t1, 0(a0)	# carichiamo in t1 un carattere per volta
	beqz t1, end_contains	# se siamo a fine stringa, usciamo
	blt t1, a1, loop_contains	# ripartiamo con il loop, il carattere non va bene
	bgt t1, a2, loop_contains	# ripartiamo con il loop, il carattere non va bene
	
	li a0, 1	# risultato = 1
	ret
end_contains:
	li a0, 0	# risultato = 1
	ret
	
###################################################