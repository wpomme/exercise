CC	= gcc
CFLAGS	= -Wall --pedantic-errors
PROGRAM	= main
DEBUG	= debug

$(PROGRAM): main.o
	$(CC) $(CFLAGS) -o main.out main.o

main.o: main.c
	$(CC) $(CFLAGS) -c main.c

clean:; rm -rf *.o $(PROGRAM)

run:; ./main.out

test:; ./main.out < test.txt

copy:; cat ./main.c | pbcopy

debug: debug.out
	$(CC) $(CFLAGS) -g -o debug.out main.c

lldb:; lldb ./debug.out
