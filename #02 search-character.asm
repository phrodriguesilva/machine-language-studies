#=========================================================#
# Description: This program looks for the number of       #
# incidences of a character within a text.                #
#                                                         #
# github.com/phrodriguesilva                              #
#=========================================================#

.data
    S1: .asciiz "I like assembly"
    found: .asciiz "Found the character : "
    times: .asciiz " time(s)"
    not_found: .asciiz "Not found"

# remember that characters only occupy 1 byte in memory

.text
main:
    #read addresses from strings in memory
    la $a1, S1
 
    jal find_character
    
    beq $a2, $zero,no # test if not found
    la $a0, found
    li $v0, 4
    syscall
    
    #prints the number of incidences of the found character
    add $a0, $s0, $zero
    li $v0, 1
    syscall
    
    #print the text "time(s)"
    la $a0, times
    li $v0, 4
    syscall
    
    j done
no: la $a0, not_found
    li $v0, 4
    syscall
done: li $v0, 10
    syscall # done!
    
# procedure "find_character"
#1) S1's base address is in $a1
#2) $a2 will be 0 if it doesn't match the character, and 1 if it matches
#3) $s0 will count the number of hits of the character found

find_character:
        add $t0, $zero, $zero 		# i = 0
        add $a2, $zero, $zero 		# reset register $a2
    L1: add $t1, $a1, $t0 		#
        lb $t2, 0($t1)
        bne $t2, 97, else 		# if $t2 = 'a' (97d 0141octal 0x61h)
        add $s0, $s0, 1 		# if it finds the character add 0x03h to register $s0
        or $a2, $a2, 1 			# then set register $a2 to 1
else: beq $t2, $zero, out 	# if character is '\0' leave loop
        addi $t0, $t0, 1 # i = i + 1
        j L1 				# go back to the beginning of the loop
    out:
        jr $ra 				# ends procedure

.end main