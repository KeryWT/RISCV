.globl _start
.data 

 
.text

_start:

	li t0, 37 # numero da analizzare N
	li t1, 1 # maschera M
	li t2, 0 # risultato, R
	li t3, 64 # indice I
	
loop:
	and t4, t0, t1	# N&M
	add t2, t2, t4	# R = R + N&M
	srli t0, t0, 1  # N = N >> 1
	addi t3, t3, -1
	ble t3, zero, print
	j 	loop
	
print:
	li a7, 1
	add a0, t2, zero
	ecall 
	
exit:
    li a7, 10  # call number 10 = exit
    ecall