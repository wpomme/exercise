#!/bin/sh
file_name = sum-of-integers
target := $(addsuffix .cob, $(file_name))

all:
	cobc -x $(target)

clean:;
	@rm $(file_name)
