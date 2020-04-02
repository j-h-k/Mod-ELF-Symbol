CC=gcc
CFLAGS=-g -O0
SUPPRESS_WARN=-w
MES=mod-elf-symbol
SDIR=src
SYMBOL=foo

_OBJS = mod-elf-symbol.o util.o
OBJS = $(patsubst %,$(SDIR)/%,$(_OBJS))

$(SDIR)/%.o: $(SDIR)/%.c
	$(CC) $(CFLAGS) $(SUPPRESS_WARN) -c $< -o $@

default: $(OBJS)
	${CC} $(CFLAGS) -c main.c
	${CC} ${SDIR}/*.o -o ${MES}

readelf: main.o
	readelf -s main.o | grep ${SYMBOL}

run_append: default readelf
	./${MES} -o main.o -s ${SYMBOL} --singlestr=bar
	readelf -s main.o | grep ${SYMBOL}

run_replace: default readelf
	./${MES} -o main.o -c ${SYMBOL} --completestr=bar
	readelf -s main.o | grep bar

run_number: default readelf
	./${MES} -o main.o -k ${SYMBOL} --keepnumstr=__
	readelf -s main.o | grep ${SYMBOL}

.PHONY: clean

clean:
	rm -rf *.o ./src/*.o $(MES) a.out
