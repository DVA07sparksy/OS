ld -m elf_i386 -T linker.ld -o kernel.bin kernel.o --oformat binary
nasm boot2.asm -f bin -o os.flp
qemu-system-x86_64 -drive format=raw,file=os.flp
pause