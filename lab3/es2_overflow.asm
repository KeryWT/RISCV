.globl _start
.data 

 
.text

_start: # \ questo è il main
	li	x5, 0x8000000000000000
	li	x6, 0xD000000000000000
	
	# add x30, x5, x6
	# sub 	x30, x5, x6
	add x30, x5, x6
        add x30, x30, x5
        #<assembler code here>
   

exit:
    addi x17, x0, 10  # call number 10 = exit
    ecall