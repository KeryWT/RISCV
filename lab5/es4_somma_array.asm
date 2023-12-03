# sum the elements of an array (without considering overflow)
.globl _start
.data 
	size: .word 6
	array: .word 1, 4, 5, 6, 8, 10
	result: .word 0
 
.text

_start:
	la t0, array # carico in t0 l'indirizzo base dell'array
	la t1, size # carichiamo in memoria l'indirizzo di size
	lw t2, 0(t1) # carichiamo in memoria il valore di size
	
	li t3, 0 # inizializzo la i a 0
	li t4, 0 # inizializzo la variabile R per il risultato
	
loop:	
	lw t5, 0(t0) # carichiamo il valore dell'array
	add t4, t4, t5 # aggiungiamo il valore alla variabile del risultato
	addi t0, t0, 4 # passiamo al valore successivo all'interno dell'array

	addi t3, t3, 1 # i++
	blt t3, t2, loop # condizione del for loop
	
	la t6, result # carico l'indirizzo della variabile result
	sw t4, 0(t6) # salvo in memoria (dentro "result") il risultato della somma totale
	
print:
	li a7, 1
	add a0, t4, zero
	ecall	
   
exit:
    li 	a7, 10  # call number 10 = exit
    ecall
