#!/bin/bash
# Author :: Varun Barala
# build kernel

# compile assembly code
nasm -f elf32 kernel.asm -o kasm.o

# compile c code
gcc -m32 -c kernel.c -o kc.o

# link object files
ld -m elf_i386 -T link.ld -o kernel kasm.o kc.o

# since kernel image follows naming convention like kernel-<version>
# we rename above generated kernel to kernel-99
mv kernel kernel-99

