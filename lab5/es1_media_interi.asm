.globl _start
.data 		# mettiamo i 4 numeri in memoria
	v1: .word 1
	v2: .word 4
	v3: .word 10
	v4: .word 7
	v5: .word 0

 
.text

_start:
	la t0, v1 # carico indirizzo base
	lw t1, 0(t0)
	lw t2, 4(t0)
	lw t3, 8(t0)
	lw t4, 12(t0)
			# calcolo la somma dei numeri
	add t5, t1, t2
	add t5, t5, t3
	add t5, t5, t4
			
	srli t5, t5, 2 # faccio lo shift a dx di 2 ( perché 2^2 = 4)
	
	sw t5, 16(t0) # salvo il risultato in memoria nella etichetta v5.




exit:
    li 	a7, 10  # call number 10 = exit
    ecall
