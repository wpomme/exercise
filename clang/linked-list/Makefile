CC	= gcc
CFLAGS	= -Wall --pedantic-errors
test_src_files = $(wildcard test_*.c)
test_exe_files = $(patsubst %.c,%.out,$(test_src_files))
SRC	= list.c

test: $(test_exe_files)
	./$<

all:;

%.out: %.c $(SRC)
	$(CC) $(CFLAGS) -o $@ $?

clean:; rm -rf *.out

.PHONY: test
