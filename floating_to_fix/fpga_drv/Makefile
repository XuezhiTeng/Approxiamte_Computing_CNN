# --- Makefile for simple Adder example.

# ARM cross-compiler
PROC	= arm
TYPE	= linux-gnueabihf
CC	= $(PROC)-$(TYPE)-gcc
CCFLAGS	= # -static
STRIP	= $(PROC)-$(TYPE)-strip

UNAME 	= $(shell uname -r)
#KDIR	= /home/projects/gerstl/ee382m/plnx_kernel.4.9
KDIR	= /usr/src/plnx_kernel.4.9
KFLAGS	= -DDEBUG # -DNO_DTS

obj-m	= fpga_drv.o


all: fpga_drv.ko example

fpga_drv.ko: fpga_drv.c
	$(MAKE) ARCH=$(PROC) CROSS_COMPILE=$(PROC)-$(TYPE)- EXTRA_CFLAGS="$(KFLAGS)" -C $(KDIR) M=$(PWD) modules

example: example.c
	$(CC) example.c $(CCFLAGS) -o example
	$(STRIP) $@ 

debug:	example.c
	$(CC) example.c $(CFLAGS) -g -o example

clean:
	$(RM) .skeleton* .*.cmd *.o *.ko *.mod.c
	$(RM) modules.order Module.symvers
	$(RM) -R .tmp*
	$(RM) example *~
