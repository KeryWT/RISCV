.data
	str: .string "my long string"
	char: .string "g"
.text

_start:
	la a0, str
	la t1, char
	lbu a1, 0(t1)
	jal ra, strrchr
	add s0, a0, zero	# salviamo in s0 l'indirizzo base della stringa
print:
  	 # print the result
        li    a7, 1
        ecall
exit:
        li    a7, 10         # call number 10 = exit
        ecall
        
strrchr:
	
strrchrloop:
	lbu t1, 0(a0)		# carichiamo in t1 il carattere delle stringa
	# beq t1, a1, endloop	# se troviamo il carattere desiderato, usciamo dal loop
	beqz t1, endloop	# se il char è uguale a 0, siamo a fine stringa, dobbiamo tornare indietro
	addi a0, a0, 1		# incrementiamo di 1 l'indirizzo così da passare al carattere successivo
	j strrchrloop		# rientriamo nel loop

endloop:
	addi a0, a0, -1 	# siamo a fine stringa, quindi decrementiamo per tornare indietro
	lbu t1, 0(a0)		# ricominciamo a leggere i caratteri
	beq t1, a1, success	# se str[i]==char, salta in success perché ho trovato il carattere desiderato
	beq t1, s0, error	# abbiamo raggiunto l'inizio della stringa senza trovare il carattere desiderato
	j endloop		# ritorniamo nel loop
	
success:
	ret # ritorniamo l'indirizzo del carattere corrente (l'indirizzo è in a0)
error:
	li a0, 0
	ret
        