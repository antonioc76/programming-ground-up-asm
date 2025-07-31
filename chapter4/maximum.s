## PURPOSE compute the maximum of a 0 terminated list of longs using a function

.section .data
data_items:
    .long 10,2,3,50,4,100,2,14,93,21,0

.section .text
.globl maximum

_start:
    pushl $3
    pushl $data_items
    call maximum
    addl $8, %esp # clear parameters from maximum call
    movl %eax, %ebx # put return value from function in return value of sys exit
    movl $1, %eax
    int $0x80

## PURPOSE
# compute the maximum of a 0 terminated list
#
## VARIABLES
# %eax holds the maximum
# %ebx holds the currently examined item
# %ecx holds the HEAD of the list
# %edi holds the current index
## INPUT
# a pointer to the HEAD of the list
#
## OUTPUT
# the maximum value in the list

.type maximum, @function
maximum:
    pushl %ebp
    movl %esp, %ebp
    
    movl $0, %edi
    movl 8(%ebp), %ecx # store head of list in %ecx
    movl (%ecx, %edi, 4), %ebx # examine the first item
    movl %ebx, %eax # first item is the initial maximum

loop_start:
    cmpl $0, %ebx # if currently examined item is zero, exit the loop
    je loop_exit
    incl %edi
    movl (%ecx,%edi,4), %ebx # examine the next item
    cmpl %ebx, %eax # max - current, if result < 0, current > max
    jge loop_start # result >= 0, current < max

    movl %ebx, %eax
    jmp loop_start

loop_exit:
    movl %ebp, %esp # restore old stack frame
    popl %ebp # restore the old base pointer and remove its copy from the stack
    ret
