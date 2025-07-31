maximum: maximum.o
	ld -m elf_i386 maximum.o -o maximum

maximum.o: maximum.s
	as --32 maximum.s -o maximum.o

use_outside_square: use_outside_square.o square.o
	ld -m elf_i386 use_outside_square.o square.o -o use_outside_square

use_outside_square.o: use_outside_square.s square.s
	as --32 use_outside_square.s -o use_outside_square.o

square: square.o
	ld -m elf_i386 square.o -o square

square.o: square.s
	as --32 square.s -o square.o

factorial: factorial.o
	ld -m elf_i386 factorial.o -o factorial

factorial.o: factorial.s
	as --32 factorial.s -o factorial.o

power: power.o
	ld -m elf_i386 power.o -o power

power.o: power.s
	as --32 power.s -o power.o