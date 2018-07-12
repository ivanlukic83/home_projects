PWD :=  $(shell pwd)

# name of the project is the same as name of containing directory (also .c file)
PROJ_NAME := moisture
#PROJ_NAME := $(shell basename $(PWD))


ifneq ($(KERNELRELEASE),)
  # obj-m: tells build system that this is a module
  obj-m := $(PROJ_NAME).o
else
	# kernel build tree (where autogen.h is found, etc.)
	#KDIR := /home/ilukic/projects/kernels/builds/bbb-yocto/
	KDIR := /home/ilukic/projects/yocto/kernel-yocto/builds/arm/
endif

# tell kernel when invoking gcc to ignore warnings (can't use CFLAGS)
KBUILD_CFLAGS += -w
INSTALL_PATH = $(shell dirname $(PWD))/builds/$(PROJ_NAME)

all default: modules

install: modules_install 

modules help:
	$(MAKE) -C $(KDIR) M=$(PWD) $@

modules_install:
	$(MAKE) -C $(KDIR) M=$(PWD) INSTALL_MOD_PATH=$(INSTALL_PATH) $@

clean:
	rm -f *.o
	rm -f *.ko
	rm -f *.mod.*
	rm -f modules.order
	rm -f Module.symvers
	rm -fr $(INSTALL_PATH)/*
	rm -f .$(PROJ_NAME).*
	rm -fr .tmp_versions
	
