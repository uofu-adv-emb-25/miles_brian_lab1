PICO_TOOLCHAIN_PATH?=~/.pico-sdk/toolchain/13_2_Rel1
CPP=/usr/bin/arm-none-eabi-cpp

hello.txt:
	echo "hello world!" > hello.txt

main.i: main.c
	$(CPP) main.c > main.i

clean:
	rm -f main.i hello.txt

.PHONY: clean