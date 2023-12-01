.globl _start
.data 
	v1: .word 8
	v2: .word 9
	v3: .word 0
 
.text

_start:
	la t0, v1	# load address. Mi salvo l indirizzo base
	lw t1, 0(t0)	# copio / carico la prima parola (v1) in t1
	lw t2, 4(t0)	# copio / carico la seconda parola (v2) in t2
	
	add t3, t1, t2	# eseguo la somma sfruttando il registro t3
	
	sw t3, 8(t0)	# salvo il risultato in memoria appena dopo v2

exit:
    li a7, 10  # call number 10 = exit
    ecall
