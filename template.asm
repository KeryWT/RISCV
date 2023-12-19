.globl _start
.data 

 
.text

_start:

and t0, t0, t1
beq t0, t1, end 
andi t0, zero, 0
end: 
andi t0, zero, 1
   

exit:
    li 	a7, 10  # call number 10 = exit
    ecall
