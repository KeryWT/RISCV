.globl _start

.data
  MemVett: .dword -12, 2, 1, 3, 5, 1, 7, 1, -1, 4 # vettore / array
.text

_start:
	la t2, MemVett # carichiamo in t2 l'indirizzo di base del vettore
	addi t0, t0, 0 # inizializziamo t0 a zero
	addi t1, t1, 0 # questa è la i
	addi t3, zero, 10 # limite del loop
	
CICLO:
	ld t4, 0(t2)	# carico il valore del vettore
	add t0, t0, t4	# aggiungiamo in t0 il valore appena caricato in t4	
	addi t2, t2, 8	# essendo double, aggiungiamo 8 byte per passare al valore successivo.
	addi t1, t1, 1	# facciamo i++
	blt t1, t3, CICLO # questa è la condizione del loop. Se i < 10, ripeti, altrimenti esci.
  
exit:
    li 	a7, 10  # call number 10 = exit
    ecall

# questo programma fa la somma dei valori del vettore e lo salva in t0