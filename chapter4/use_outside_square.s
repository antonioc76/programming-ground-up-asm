## PURPOSE
# to test the use of the square function out of the source file that it is defined in
# The test: call square to help compute 3^3 + 2^2 + 5^2 = 9 + 4 + 25 = 38
.section .data
.section .text

.globl _start

_start:
    pushl $3
    call square
    addl $4, %esp
    pushl %eax
    pushl $2
    call square
    addl $4, %esp
    pushl %eax
    pushl $5
    call square
    addl $4, %esp
    popl %ebx
    addl %ebx, %eax
    popl %ebx
    addl %ebx, %eax
    movl %eax, %ebx
    movl $1, %eax
    int $0x80
