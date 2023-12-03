.globl _start
.data 
	size: .word 5
	array: .word 1, 4, 8, 6, 7
	max: .word 0
 
.text

_start:
	la t0, array # carico in t0 l'indirizzo base dell'array
	la t1, size # carichiamo in memoria l'indirizzo di size
	lw t2, 0(t1) # carichiamo in t2 il valore di size
	
	#inizializzo le variabili necessarie
	li t3, 0 # i
	li t4, 0 # max
	lw t5, 0(t0) # carico in t5 il primo valroe dell'array
	add t4, t4, t5 # mettiamo il primo valore nella variabile max
	addi t0, t0, 4 # avanziamo al valore successivo
	
loop:	
	lw t5, 0(t0) # carichiamo un valore dell'array alla volta
	
	bge t4, t5, skip # se max > valore attuale, salta in end, così non modifica il max.
	addi t4, t5, 0	# se invece max è più piccolo, allora lo sostituiamo con il valore dell'array
	
skip:	
   	addi t0, t0, 4 # avanziamo al valore successivo
	addi t3, t3, 1 # i++
	blt t3, t2, loop # condizione del for loop
	
save:
	la t6, max # carico in t6 l'indirizzo di max
	sw t4, 0(t6) # salvo in memoria ( dentro "max") il valore finale ottenuto
	
print:
	li a7, 1
	add a0, t4, zero
	ecall	
   
exit:
    li 	a7, 10  # call number 10 = exit
    ecall
