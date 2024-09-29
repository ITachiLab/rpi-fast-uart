obj-m = amba-pl011-nofifo.o
KOBJ = amba-pl011-nofifo.ko

KVERSION = $(shell uname -r)

$(KOBJ):
	make -C /lib/modules/$(KVERSION)/build M=$(PWD) modules

install: $(KOBJ)
	cp $^ /usr/lib/modules/$(KVERSION)
	depmod -a

clean:
	make -C /lib/modules/$(KVERSION)/build M=$(PWD) clean

.PHONY: all clean install
