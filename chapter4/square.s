## PURPOSE
# compute 3^2 + 9^2 + 10^2
#
.section .data
.section .text
.globl square

_start:
    pushl $6
    call square
    addl $4, %esp # not necessary, good practice. Cleans the stack
    movl %eax, %ebx
    movl $1, %eax
    int $0x80

## PURPOSE
# compute the square of a number and return it
# VARIABLES
# %eax holds the number to be squared
# INPUT
# 1st argument - number to be squared
# OUTPUT
# returns the input value squared
.type square, @function
square:
    pushl %ebp
    movl %esp, %ebp
    movl 8(%ebp), %eax
    imull %eax, %eax
    movl %ebp, %esp
    popl %ebp
    ret 
