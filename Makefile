CC=$(PICO_TOOLCHAIN_PATH)/bin/arm-none-eabi-gcc
AS=$(PICO_TOOLCHAIN_PATH)/bin/arm-none-eabi-as
CPP=$(PICO_TOOLCHAIN_PATH)/bin/arm-none-eabi-cpp
LD=$(PICO_TOOLCHAIN_PATH)/bin/arm-none-eabi-ld

SRC=main.c second.c
OBJS=$(patsubst %.c,%.o,$(SRC))

all: firmware.elf

hello.txt:
	echo "hello world!" > hello.txt

%.i: %.c
	$(CPP) $< > $@

clean:
	rm -f hello.txt *.o

.PHONY: clean all

%.s: %.i
	$(CC) -S $<

%.o: %.s
	$(AS) $< -o $@

firmware.elf: $(OBJS)
	$(LD) -o $@ $^