all: firmware.elf

PICO_TOOLCHAIN_PATH?=~/.pico-sdk/toolchain/13_2_Rel1
CPP=/usr/bin/arm-none-eabi-cpp

hello.txt:
	echo "hello world!" > hello.txt

%.i: %.c
	$(CPP) $< > $@

clean:
	rm -f hello.txt *.o

.PHONY: clean all

CC=/usr/bin/arm-none-eabi-gcc
AS=/usr/bin/arm-none-eabi-as

%.s: %.i
	$(CC) -S $<

%.o: %.s
	$(AS) $< -o $@

LD=/usr/bin/arm-none-eabi-ld
SRC=main.c second.c
OBJS=$(patsubst %.c,%.o,$(SRC))
firmware.elf: $(OBJS)
	$(LD) -o $@ $^