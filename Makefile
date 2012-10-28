all: build test

build:
	asl 8080EX1.MAC
	p2bin -r 0x-0x 8080EX1.p

prepare-master:
	dd if=./master/8080EX1.COM of=8080EX1.COM.master \
	bs=1 count=`stat -f "%z" 8080EX1.bin`

test: prepare-master
	diff 8080EX1.bin 8080EX1.COM.master

diff:
	xxd 8080EX1.bin >8080EX1.bin.hex
	xxd 8080EX1.COM.master >8080EX1.COM.master.hex
	diff 8080EX1.bin.hex 8080EX1.COM.master.hex

clean:
	-rm 8080EX1.p 8080EX1.bin
	-rm 8080EX1.COM.master
	-rm 8080EX1.bin.hex 8080EX1.COM.master.hex

