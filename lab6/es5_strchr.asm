.globl _start

.data
	str: .string "my long string"
	char: .string "g"
.text

_start:
	la a0, str
	la t1, char
	lbu a1, 0(t1)
	jal strchr
print:
  	 # print the result
        li    a7, 1
        ecall
exit:
        li    a7, 10         # call number 10 = exit
        ecall
        
strchr:
	
strchrloop:
	lbu t1, 0(a0)		# carichiamo in t1 il carattere delle stringa
	beq t1, a1, endloop	# se troviamo il carattere desiderato, usciamo dal loop
	beqz t1, error		# se il char è uguale a 0, errore, ritorna 0	
	addi a0, a0, 1		# incrementiamo di 1 l'indirizzo così da passare al carattere successivo
	j strchrloop		# rientriamo nel loop

endloop:
	ret
error:
	li a0, 0
	ret
