.globl _start
.data
	str1: .string "first."
	str2: .string "second."
.text

_start:
	# call strcmp
	la a0, str1
	la a1, str2
	jal ra, strcmp
print:
  	 # print the result
        li    a7, 1
        ecall
exit:
        li    a7, 10         # call number 10 = exit
        ecall
        
####### STR CMP #################
strcmp:
	
strcmp_loop:
	lbu t1, 0(a0)
	lbu t2, 0(a1)
	
	bne t1, t2, endloop #se sono diversi salta nell'endloop e mette il risultato a 1
	bne t1, zero, loop2  #se sono uguali e non è fine stringa
	addi a0, zero, 0 #mette il risultato a 0
	ret
loop2: 
	addi a0, a0, 1 #incremento in entrambe le stringhe
	addi a1, a1, 1
	j strcmp_loop 
endloop:
	addi a0, zero, 1
	ret
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
