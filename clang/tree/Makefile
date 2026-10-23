CC	= gcc
CFLAGS	= -Wall --pedantic-errors
MAIN	= main
TEST	= test
SRC	= tree.c

$(MAIN): $(MAIN).c $(SRC)
	$(CC) $(CFLAGS) -o $(MAIN).out $?

build_test: $(TEST).c $(SRC)
	$(CC) $(CFLAGS) -o $(TEST).out $?

clean:; rm -rf *.o $(MAIN).out $(TEST).out

run:; ./$(MAIN).out

test: build_test
	./$(TEST).out

copy:; cat ./main.c | pbcopy

debug: $(MAIN).c $(SRC)
	$(CC) $(CFLAGS) -g -o debug.out $@

lldb:; lldb ./debug.out
