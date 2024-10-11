#!/bin/bash

# ./build_graphic.sh  |   no: sh build_graphic.sh

mv build/qemuarm64.graphic build/qemuarm64

. setup qemuarm64

rm -rf downloads

ln -s ~/downloads downloads


bitbake llvm-native
bitbake rust-native
bitbake rust-llvm-native
bitbake core-image-minimal-xfce

bitbake package-index

mv build/qemuarm64 build/qemuarm64.graphic

# runqemu  qemuarm64

# apt install libsdl2-dev                # display 
# apt install libslirp-dev               # user netdev
# apt install libcapstone-dev            # disassemble



