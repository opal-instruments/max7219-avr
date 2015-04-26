CC=avr-gcc
LDFLAGS= -I/usr/local/lib:/usr/lib
LIBS=-static
TARGET_OBJS=$(wildcard bin/build/*.o)
TEST_TARGET_OBJS=$(wildcard bin/build/*.o)

all: 
	mkdir -p bin/build
	$(CC) -c src/max7219.c $(LDFLAGS) $(LIBS) -o bin/build/max7219.o

install: all
	ar -cvq bin/libtiny-max7219.a $(TARGET_OBJS)
	sudo cp bin/libtiny-max7219.a /usr/lib

clean: 
	rm -rf bin
