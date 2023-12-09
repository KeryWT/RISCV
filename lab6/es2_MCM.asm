.globl _start
.data 

.text

_start:
	li a0, 12 # a
	li a1, 9 # b
	
   	jal MCM # richiamo il minimo comune multiplo
   	
print:
	addi a0, a0, 0 # print the result stored in a0
        li    a7, 1
        ecall
        
exit:
    li 	a7, 10  # call number 10 = exit
    ecall


######## PROCEDURA MCD ########	
MCD:
	
loop_mcd:
	beq a0, a1, endloop_mcd
	
	ble a0, a1, else_mcd
	sub a0, a0, a1
	j   loop_mcd
	
else_mcd:
	sub a1, a1, a0 # b = b - a
	j loop_mcd
	
endloop_mcd:
	jr ra
################################

######## PROCEDURA MCM ########	
MCM:

	addi sp, sp -16
	sd ra, 0(sp)
	sd s1, 8(sp)
	# addi s11, ra, 0 # salviamo il ra per tornare al main

	mul s1, a0, a1 # s1 = a * b
	jal MCD
	div a0, s1, a0 # MCM = (a*b) / MCD(a,b) risultato salvato nel registro a0

	# addi ra, s11, 0 # ripristiniamo il ra per tornare al main
	ld ra, 0(sp)
	ld s1, 8(sp)
	addi sp, sp, 16
	ret # uguale a jr ra
################################