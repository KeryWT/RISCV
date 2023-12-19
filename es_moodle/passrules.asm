.globl _start
.data
      buffer: .string  "BADPass"
.text
_start:
    # call passrules
    la   a0, buffer
    jal  ra, passrules

    #exit
    li   a7, 10
    ecall

#****************************************************
# completare la funzione passrules nel campo di sotto
passrules:

	addi sp, sp, -16
	sd a0, 0(sp)
	sd ra, 8(sp)
	# sd s0, 16(sp)
	
uppercase:
	li a1, 65 # A
	li a2, 90 # Z
	jal contains
	ld ra, 8(sp)
	
	beqz a0, case0


numbers:
	li a1, 48 # 0
	li a2, 57 # 9
	
	ld a0, 0(sp)	
	jal contains
	ld ra, 8(sp)
	beqz a0, case0
	li a0, 1
	addi sp, sp, 16
	ret
case0:
	li a0, 0
	ld ra, 8(sp)
	addi sp, sp, 16
	ret

#####################CONTAINS######################
contains:
loop_contains:
	lbu t1, 0(a0)	# carichiamo in t1 un carattere per volta
	addi a0, a0, 1	# aggiungiamo l'offset all'indirizzo della stringa
	lbu t1, 0(a0)	# carichiamo in t1 un carattere per volta
	beqz t1, end_contains	# se siamo a fine stringa, usciamo
	blt t1, a1, loop_contains	# ripartiamo con il loop, il carattere non va bene
	bgt t1, a2, loop_contains	# ripartiamo con il loop, il carattere non va bene
	
	li a0, 1	# risultato = 1
	ret
end_contains:
	li a0, 0	# risultato = 1
	ret
	
###################################################