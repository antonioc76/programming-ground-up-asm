maximum: maximum.o
	ld maximum.o -o maximum

maximum.o: maximum.s
	as maximum.s -o maximum.o

minimum: minimum.o
	ld minimum.o -o minimum

minimum.o: minimum.s
	as minimum.s -o minimum.o

max_sa: max_sa.o
	ld max_sa.o -o max_sa

max_sa.o: max_sa.s
	as max_sa.s -o max_sa.o

exit: exit.o
	ld exit.o -o exit

exit.o: exit.s
	as exit.s -o exit.o

test: test1
	echo "test0"

test1: test2
	echo "test1"

test2:
	echo "test2"

clean:
	rm -rf maximum.o maximum