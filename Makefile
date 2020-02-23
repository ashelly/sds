# Specify the target file
OUTPUTFILE  = libsds.a
lib: $(OUTPUTFILE)

$CFLAGS += -Wall -pedantic

%.o: %.c
	$(CC) -MMD $(CFLAGS) -g -o $@ -c $<


# Build target lib from source objects
$(OUTPUTFILE): sds.o 
	ar r $@ $^
	ranlib $@

sds.o: sds.h sdsalloc.h


clean:
	rm -f $(OUTPUTFILE) *.o

.PHONY: clean all

all:
	lib

# main: main.c yaml.c deps/hash/hash.c
# 	$(CC) $^ $(CFLAGS) -g  -o $@
# 	./main



sds-test: sds.c sds.h testhelp.h
	$(CC) -o sds-test sds.c -Wall -std=c99 -pedantic -O2 -DSDS_TEST_MAIN
	@echo ">>> Type ./sds-test to run the sds.c unit tests."

