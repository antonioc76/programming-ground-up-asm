# PURPOSE
# find the maximum number in a list of longs of known length

# VARIABLES
# %edi holds the current index
# %eax holds the currently examined item
# %ebx holds the current maximum

# the following memory locations are used by the program
.section .data
data_items:
    .long 1,2,3,15,23,55,2,13,30,23,51,23,56

length:
    .long 12

.section .text

.globl _start

_start:
    movl $0, %edi # start at index 0
    movl data_items(, %edi, 4), %eax # examine the first item of the list
    movl %eax, %ebx # the first item is the initial maximum
    decl length # since we are 0-indexed, length should be reduced by one

main_loop:
    cmpl length, %edi # compare the value stored in length to the index
    je loop_exit
    incl %edi
    movl data_items(,%edi,4), %eax # examine the next value
    cmpl %eax, %ebx # max - inspected
    jge main_loop # if max - inspected >= 0, inspected not greater than max

    movl %eax, %ebx # if inspected > max, replace max with inspected
    jmp main_loop 

loop_exit:
    movl $1, %eax
    int $0x80
