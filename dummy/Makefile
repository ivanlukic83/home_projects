# obj-m: tells build system that this is a module
obj-m := src/dummy.o

KDIR := /home/ilukic/projects/yocto/kernel-yocto/kernel-source/
PWD := $(shell pwd)
ARCH := arm
CROSS_COMPILE := arm-poky-linux-gnueabi-

# tell kernel when invoking gcc to ignore warnings (can't use CFLAGS)
KBUILD_CFLAGS += -w

all:
	make -C $(KDIR) M=$(PWD) modules
