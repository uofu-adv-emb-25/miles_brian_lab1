PICO_TOOLCHAIN_PATH?=~/.pico-sdk/toolchain/13_2_Rel1
CPP=/usr/bin/arm-none-eabi-cpp

hello.txt:
	echo "hello world!" > hello.txt

%.i: %.c
	$(CPP) $< > $@

clean:
	rm -f main.i hello.txt

.PHONY: clean

CC=/usr/bin/arm-none-eabi-gcc
AS=/usr/bin/arm-none-eabi-as

%.s: %.i
	$(CC) -S $<

%.o: %.s
	$(AS) $< -o $@