#=========================================================#
# Description: This program is just an example of         #
# addition and subtraction.                               #
#                                                         #
# f = (g+h) – (i+j);                                      #
# g , h , i & j: regs. $s1, $s2 , $s3  & $s4 respect.1;   #
# f: register $s0                                         #
#                                                         #
# github.com/phrodriguesilva                              #
#=========================================================#

.data
str1: .ascii "Sum exemple " 
str2: .asciiz "and subtraction. Result: " # string ending in 0

varg: .word 10
varh: .word 20
vari: .word 30
varj: .word 40
varf: .word 0

.text
.globl main
.ent main
main:

# load of variables in registers
lw $s1, varg     
lw $s2, varh     
lw $s3, vari     
lw $s4, varj     

# additions and subtraction
add $t0, $s1, $s2   #$t0 contem g + h  
add $t1, $s3, $s4   #$t1 contem i + j  
sub $s0, $t0, $t1   #$s0: result
sw $s0, varf  	    # store result in f

la $a0, str1 	# string address not terminated with NULL
li $v0, 4 	# print string
syscall

li $v0, 1 	# prints int
lw $a0, varf	# value for int to print
syscall

li $v0, 10
syscall # done!

.end main
