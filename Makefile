TARGET=so-cpp
CC=gcc
CFLAGS=-g -Wall

.PHONY: default all clean

default: $(TARGET)
all: default

OBJECTS=$(patsubst %.c, %.o, $(wildcard *.c))
HEADERS=$(wildcard *.h)

%.o: %.c $(HEADERS)
	$(CC) $(CFLAGS) -c $< -o $@

$(TARGET): $(OBJECTS)
	$(CC) $(OBJECTS) -Wall -o $@

clean:
	rm -rf *.o
	rm -f $(TARGET)
