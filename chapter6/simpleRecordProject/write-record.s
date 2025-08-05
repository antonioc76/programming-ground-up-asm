.include "linux.s"
.include "edu-record.s"
# PURPOSE
# provide a function to write edu-records

.section .data
.section .text

.type write-record, @function
.globl write-record

# PARAMETERS
.equ ST_RECORD_NAME, 8
.equ ST_RECORD_DATA, 12
.equ ST_RECORD_SZ, 16

write-record:
    pushl %ebp
    movl %esp, %ebp
    # open the file for writing, create if it doesnt exist already
    movl $5, %eax
    movl ST_RECORD_NAME(%ebp), %ebx
    movl $O_CREAT_WRONLY_TRUNC, %ecx
    movl $0666, %edx
    int $LINUX_SYSCALL

    # write to the file just opened/ created
    movl %eax, %ebx
    movl ST_RECORD_DATA(%ebp), %ecx
    movl ST_RECORD_SZ(%ebp), %edx
    movl $SYS_WRITE, %eax
    int $LINUX_SYSCALL

    

    
