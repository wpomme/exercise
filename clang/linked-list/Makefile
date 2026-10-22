CC	= gcc
CFLAGS	= -Wall --pedantic-errors
MAIN	= main
TEST	= test
SRCS	= list.c solution.c

$(MAIN): $(MAIN).c $(SRCS)
	$(CC) $(CFLAGS) -o $(MAIN).out $?

build_test: $(TEST).c $(SRCS)
	$(CC) $(CFLAGS) -o $(TEST).out $?

clean:; rm -rf *.o $(MAIN).out $(TEST).out

run:; ./$(MAIN).out

test: build_test
	./$(TEST).out

copy:; cat ./main.c | pbcopy

debug: $(MAIN).c $(SRCS)
	$(CC) $(CFLAGS) -g -o debug.out $@

lldb:; lldb ./debug.out
