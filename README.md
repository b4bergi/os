# assembly stuff
compile: nasm -f bin boot.asm -o boot.bin

run: qemu-system-x86_64 boot.bin

# c stuff
continue:
https://github.com/cfenollosa/os-tutorial/tree/master/12-kernel-c


i686-elf-gcc --version
i686-elf-gcc (GCC) 4.9.1
Copyright (C) 2014 Free Software Foundation, Inc.
This is free software; see the source for copying conditions.  There is NO
warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE


# rust stuff
add target to rust startup:
rustup target add thumbv7em-none-eabihf

build with :
    //cargo xbuild --target x86_64-os.json

    cargo bootimage

run:
    qemu-system-x86_64 -drive format=raw,file=target/x86_64-os/debug/bootimage-os.bin

for a real machine:
    dd if=target/x86_64-os/debug/bootimage-os.bin of=/dev/sdX && sync