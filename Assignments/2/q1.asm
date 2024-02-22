# Assumption: Since the case 1 is not properly defined in the question, case 1 is assigned the same procedure as case2
# We just replicate the process given in the C snippet by initially inputting a number, and based on that number, modify A's values
# and print them afterwards. We can create an exit function to take care of the break statements and execute a epilogue
# sort of procedure

.data
A: .word -2, -2
prompt: .asciiz "Enter a number: "
str1: .asciiz "i="
str2: .asciiz "\nA[0]="
str3: .asciiz "\nA[1]="

.text
.globl main
main:
    li $v0, 4
    la $a0, prompt
    syscall

    li $v0, 5
    syscall
    move $t0, $v0
    beq $t0, 0, case0
    beq $t0, 1, case1and2
    beq $t0, 2, case1and2
    j default

case0:
    sw $zero, A
    j exit

case1and2:
    li $t1, 1
    sw $t1, A+4
    j exit

default:
    li $t1, -1
    sw $t1, A
    j exit

exit:
    la $a0, str1
    li $v0, 4
    syscall

    move $a0, $t0
    li $v0, 1
    syscall

    la $a0, str2
    li $v0, 4
    syscall

    lw $a0, A
    li $v0, 1
    syscall

     la $a0, str3
     li $v0, 4 
     syscall

     lw $a0, A+4 
     li $v0, 1 
     syscall 

     li $v0, 10 
     syscall 

