# We can use a loop to iterate over each bit of the number. 
# In each iteration, we can shift the number left by the loop counter, then shifts it right by 31 and print. 
# By shifting the number left by the loop counter and then shifting it right by 31, 
# we effectively move the desired bit into the rightmost position where it can be easily printed.

.data
prompt: .asciiz "Enter num: "

.text
.globl main
main:
    # Getting Inputs
    li $v0, 4
    la $a0, prompt
    syscall

    li $v0, 5
    syscall
    move $t2, $v0

    li $t1, 0

getting_rep:
    sllv $t0, $t2, $t1
    srl $t0, $t0, 31
    addi $v0, $zero, 1
    move $a0, $t0
    syscall

    addi $t1, $t1, 1
    blt $t1, 32, getting_rep

exit:
    li $v0, 10
    syscall
