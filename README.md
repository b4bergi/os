# os
compile: nasm -f bin boot.asm -o boot.bin

run: qemu-system-x86_64 boot.bin

i686-elf-gcc --version
i686-elf-gcc (GCC) 4.9.1
Copyright (C) 2014 Free Software Foundation, Inc.
This is free software; see the source for copying conditions.  There is NO
warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE