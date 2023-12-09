.globl _start
.data 

.text

_start:
	# carico le costanti all'interno di registri usati per il passaggio di parametri
	li a0, 24 # a
	li a1, 30 # b
	
	jal MCD # salto alla procedura MCD
        mv    t0, a0 # libero il registro a0 perché potrebbe essere eventualmente utilizzato da altre procedure
        
print:
        addi  a0, t0, 0    	 # print the result
        li    a7, 1
        ecall
        
exit:
    li 	a7, 10  # call number 10 = exit
    ecall

######## PROCEDURA MCD ########	
MCD:
	
loop:
	beq a0, a1, endloop
	
	ble a0, a1, else
	sub a0, a0, a1
	j   loop
	
else:
	sub a1, a1, a0 # b = b - a
	j loop
	
endloop:
	ret
################################
