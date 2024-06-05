all:
	as -g main.s -o main.o
	ld main.o -o assembly -nostdlib -static
