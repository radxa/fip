MAKEFLAGS += --silent

.phony: list_device radxa-zero radxa-zero2

list_device:
	echo Supported devices:
	echo 	radxa_zero
	echo 	radxa_zero2

radxa_zero:
	cd radxa-zero && $(MAKE) UBOOT_BIN=$(UBOOT_BIN)

radxa_zero2:
	cd radxa-zero2 && $(MAKE) UBOOT_BIN=$(UBOOT_BIN)

clean:
	cd radxa-zero && $(MAKE) clean
	cd radxa-zero2 && $(MAKE) clean

distclean:
	cd radxa-zero && $(MAKE) distclean
	cd radxa-zero2 && $(MAKE) distclean