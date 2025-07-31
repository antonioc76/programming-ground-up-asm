#PURPOSE: This program finds the maximum number of a
# set of data items.
#
#VARIABLES: The registers have the following uses:
#
# %edi - holds the index of the current value in the list
# %ebx - holds the maximum
# %eax - holds the currently examined item
#
# The following memory locations are used
# data_items - contains the item data. A 0 is used to terminate the data

.section .data
data_items:
    .long 3,67,34,222,45,75,54,34,44,33,22,11,66,224,0

.section .text

.globl _start
_start:
    movl $0, %edi # initialize the index to 0
    movl data_items(,%edi,4), %eax # load the first byte of data into %eax
    movl %eax, %ebx # assign the first number inspected to %ebx, since its the initial

start_loop:
    cmpl $0, %eax # if currently examined item is 0, exit
    je loop_exit # jump if equal to loop_exit
    incl %edi # increment index
    movl data_items(,%edi,4), %eax # load the byte of data at index %edi into %eax 
    cmpl %ebx, %eax # %eax - %ebx
    jle start_loop # if less than or equal 0, jump to the start_loop immediately

    movl %eax, %ebx # since %ebx - %eax was > 0, its the new maximum
    jmp start_loop

loop_exit:
    movl $1, %eax # sys call for exit
    int $0x80
