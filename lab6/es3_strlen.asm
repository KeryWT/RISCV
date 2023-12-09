.globl _start
.data
	src: .string "This is the source string."
.text

_start:

	# call strlen
	la a0, src
	jal strlen
	
	# print size, ret in a0
	li a7, 1
	ecall

exit:
    li 	a7, 10  # call number 10 = exit
    ecall

#############################
#PROCEDURE STRLEN
#
#
#############################
strlen:
	addi t0, t0, 0 # inizializziamo i = 0

for_strlen:
	add t1, t0, a0		# Aggiungiamo i byte di offset all'indirizzo base della stringa
	lbu t1, 0(t1) 		# carichiamo il primo byte di a0 (ogni volta passeremo al successivo)
	beqz t1, skip_strlen 	# se è finita la stringa, usciamo dal for (i == 0)
	addi t0, t0, 1 		# i++
	j for_strlen		# facciamo ripartire il loop

skip_strlen:
	mv a0, t0 # spostiamo il risultato di strlen in a0 per poterlo stampare
	ret
#############################