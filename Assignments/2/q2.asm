# In this question, we can replicate the C code by creating a function to modify a and return to main and print 'y'

.data
x: .word 5
y: .word 0
str1: .asciiz "y="
str2: .asciiz "\n"

.text
.globl main
main:
    la $a0, x
    lw $a0, 0($a0)
    jal q2

    la $a1, y
    sw $v0, 0($a1)

    la $a0, str1
    li $v0, 4
    syscall

    la $a0, y
    lw $a0, 0($a0)
    li $v0, 1
    syscall

    la $a0, str2
    li $v0, 4
    syscall

    li $v0, 10
    syscall

q2:
    li $t0, 3
    mul $t0, $t0, $a0
    addi $v0, $t0, 5
    jr $ra
