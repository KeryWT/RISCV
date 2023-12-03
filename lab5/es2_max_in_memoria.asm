.globl _start
.data 
	v1: .word 1
	v2: .word 2
	v3: .word 3
	v4: .word 0
 
.text

_start:
	la t0, v1 # carico l'indirizzo di partenza
	lw t1, 0(t0) # copy the first word
	lw t2, 4(t0) # copy the second word
	lw t3, 8(t0) # copy the third word
	
	add t4, zero, t1 # metto in t4 il presunto valore più grande
	
	bge t4, t2, end1 # se t4 > t2 salta in end1, altrimenti fai l'add subito sotto
	add t4, zero, t2 # se t2 è più grande, metto il suo valore in t4
	
end1:
	bge t4, t3, end2 #se t4 (t1) è maggiore di t3, salta in end2
	add t4, zero, t3 # se t3 è più grande, allora metto il suo valore in t4	

end2:
	sw t4, 12(t0) #salvo il valore max in v4

exit:
    li 	a7, 10  # call number 10 = exit
    ecall
