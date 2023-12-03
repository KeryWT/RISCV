.globl _start
.data 
	size: .word 5
	array: .byte 1, 4, 8, 6, 7
	result: .word 0
 
.text

_start:
	la t0, array # carico in t0 l'indirizzo base dell'array
	la t1, size # carichiamo in memoria l'indirizzo di size
	lw t2, 0(t1) # carichiamo in t2 il valore di size
	li t3, 0 # i
	li t4, 0 # result
	li a0, 2 # mettiamo il divisore 2 nel registro a0
	
loop:	
	lb t5, 0(t0) # carichiamo un valore dell'array alla volta
	rem t5, t5, a0 # modulo di t5 / 2
	beq t5, zero, skip # se il resto è uguale a 0, salta a skip.
	addi t4, t4, 1 # incremento di uno il numero di dispari
	
skip:	
   	addi t0, t0, 1 # avanziamo al valore successivo
	addi t3, t3, 1 # i++
	blt t3, t2, loop # condizione del for loop
	
save:
	la t6, result # carico in t6 l'indirizzo di result
	sw t4, 0(t6) # salvo in memoria ( dentro "result") il valore finale ottenuto
	
print:
	li a7, 1
	add a0, t4, zero
	ecall	
   
exit:
    li 	a7, 10  # call number 10 = exit
    ecall
