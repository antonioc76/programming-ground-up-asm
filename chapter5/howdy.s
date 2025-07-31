#PURPOSE
#to print "Howdy y'all." to a file called howdy.txt

.section .data
###CONSTANTS###
.equ SYS_WRITE, 4
.equ SYS_OPEN, 5
.equ SYS_CLOSE, 6
.equ SYS_EXIT, 1
.equ O_CREAT_WRONLY_TRUNC, 03101
.equ DEFAULT_FLAGS, 0666
filename:
    .string "howdy.txt"
msg:
    .ascii "Howdy y'all."
###STACK POSITIONS###
.equ ST_SIZE_RESERVE, 4
.equ ST_FD_OUT, -4
.section .text
.globl _start

_start:
    movl %esp, %ebp
    subl $ST_SIZE_RESERVE, %esp # room for a local variable to store the file descriptor 

open_file:    
    movl $SYS_OPEN, %eax
    movl $filename, %ebx
    movl $O_CREAT_WRONLY_TRUNC, %ecx
    movl $DEFAULT_FLAGS, %edx
    int $0x80
    movl %eax, ST_FD_OUT(%ebp) # store fd

write_to_file:
    movl $SYS_WRITE, %eax
    movl ST_FD_OUT(%ebp), %ebx # retrieve fd
    movl $msg, %ecx
    int $0x80

close_file:
    movl $SYS_CLOSE, %eax
    movl ST_FD_OUT(%ebp), %ebx
    int $0x80

exit:
    movl $SYS_EXIT, %eax
    movl $0, %ebx
    int $0x80

