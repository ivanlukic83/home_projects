# ":=" expresisons are evaluated once, "=" expressions evaluated each time they are used
PWD :=  $(shell pwd)

# name of the project is the same as name of containing directory (also .c file)
PROJ_NAME := queue
#PROJ_NAME := $(shell basename $(PWD))


ifneq ($(KERNELRELEASE),)
  # obj-m: tells build system that this is a module
  obj-m := $(PROJ_NAME).o
else
	# set location for kernel build tree (where autogen.h is found, etc.) or kernel header files
	
	# if not cross compiling, use installed kernel headers, else kernel build tree
	ifeq ($(CROSS_COMPILE),)
		KDIR := /lib/modules/$(shell uname -r)/build/
	else
		KDIR := ~/projects/kernel/builds/rpi/
	endif
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

