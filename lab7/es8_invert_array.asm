# Invert an array in memory using swap
.globl _start

.data
      size:   .word 16
      array:  .word 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15

.text
_start:
      la    s1, size	# carico in s1 l'indirizzo di size

      la    a0, array	# stampa array iniziale
      jal   ra, print

      la    a0, array	
      lw    a1, 0(s1)
      jal   ra, invert	# invoca invert

      la    a0, array
      lw    a1, 0(s1)
      jal   ra, print	# stampa array invertito

exit:
      li    a7, 10 #call number 10 = exit
      ecall

################################################################################
# Procedure swap(v, x, y)
# a0  -> address of v
# a1 -> index x
# a2 -> index y
# does not return anything
# swap is a leaf procedure that can be implemented with only temp registers
################################################################################
swap:
	# calcoliamo gli indirizzi di v[x] e v[y]
	slli a1, a1, 2	# calcoliamo offset di x (passiamo da decimale a bit)
	slli a2, a2, 2	# calcoliamo offset di y (passiamo da decimale a bit)
	add t0, a0, a1	# calcoliamo l'indirizzo del valore in posizione x
	add t1, a0, a2	# calcoliamo l'indirizzo del valore in posizione y
      
	# scambiamo i valori
	lw t2, 0(t0)	# salviamo il valore di x
	lw t3, 0(t1)	# salviamo il valore di y
      
	sw t2, 0(t1)	# salviamo la x al posto della y
	sw t3, 0(t0)	# salviamo la y al posto della x
      
      ret                 # return

################################################################################
# Procedure invert(v)
# a0 -> v address
# a1 -> v size
################################################################################
invert:
	addi sp, sp -32	# facciamo spazio nello stack
	sd ra, 0(sp)	# savliamo return address
	sd a0, 8(sp)	# salviamo a0 (indirizzo base array)
	sd s1, 16(sp)	# salviamo s1 (indirizzo di size)
	sd s2, 24(sp)	# salviamo s2 
	
	li s1, 0	# inizializziamo i = 0 ( sare
	addi s2, a1, -1	# inizializziamo indice finale a size-1
	
loop_invert:
	blt s2, s1, end_invert	# se s2 < s1 (ho finito gli elementi) esco dal loop
	
	ld a0, 8(sp)		# mettiamo in a0 l'indirizzo dell'array
	add a1, s1, zero	# mettiamo in a1 l'indice i che corrisponde all'indice x dell'array
	add a2, s2, zero	# mettiamo in a1 l'indice size-1 che corrisponde all'indice y dell'array
	
	jal ra, swap

	addi s1, s1, 1		# incremento i (anche x indirettamente)
	addi s2, s2, -1		# incremento size-1 (anche y indirettamente)
	
	j loop_invert
end_invert:
	# ripristiniamo i valori salvati nello stack
	ld s2, 24(sp)
	ld s1, 16(sp)
	ld ra, 0(sp)		
	addi sp, sp, 32
	
      ret

################################################################################
# Procedure print(v)
# a0 -> v address
# a1 -> v size
################################################################################
print:			# stampa 
      addi  sp, sp, -32
      sd    s1, 0(sp)
      sd    a0, 8(sp)
      sd    a1, 16(sp)
      sd    ra, 24(sp)

      li    s1, 0               # index
LOOP_print:
      beq   s1, a1, EXIT_print

      slli  t1, s1, 2           # calculates offset in the array
      add   t1, t1, a0          # t1 has the address of the element
      lw    t0, 0(t1)           # t0 has the number to print

      addi  a0, t0, 0           # print a number
      li    a7, 1
      ecall

      addi  a0, zero, 0x20      # print space
      li    a7, 11
      ecall

      ld    a0, 8(sp)           # recover the value of a0
      ld    a1, 16(sp)          # recover the value of a1
      addi  s1, s1, 1           # move to the next word
      j     LOOP_print
EXIT_print:

      addi  a0, zero, 0x0A      # print new line
      li    a7, 11
      ecall

      ld    s1, 0(sp)
      ld    ra, 24(sp)
      addi  sp, sp, 32
      ret
################################################################################
