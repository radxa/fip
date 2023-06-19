MAKEFLAGS += --silent

.phony: list_device fip deb-pkg

list_device:
	echo Supported devices:
	echo 	radxa-zero
	echo 	radxa-zero2

fip:
	$(MAKE) -C $(BOARD) UBOOT_BIN=$(realpath $(UBOOT_BIN))

deb-pkg: fip
	mkdir -p ./.deb-pkg/usr/lib/u-boot-$(BOARD)
	cp $(BOARD)/u-boot* ./.deb-pkg/usr/lib/u-boot-$(BOARD)
	fpm -s dir -t deb -n $(BOARD)-ubootimg -v $(VERSION) \
		-p $(BOARD)-ubootimg_$(VERSION)_all.deb \
		--deb-priority optional --category admin \
		--force \
		--depends debsums \
		--depends mtd-utils \
		--deb-field "Multi-Arch: foreign" \
		--deb-field "Replaces: $(BOARD)-ubootimg" \
		--deb-field "Conflicts: $(BOARD)-ubootimg" \
		--deb-field "Provides: $(BOARD)-ubootimg" \
		--url https://github.com/radxa/u-boot \
		--description "$(BOARD) u-boot package" \
		--license "GPL-2+" \
		-m "Radxa <dev@radxa.com>" \
		--vendor "Radxa" \
		-a all \
		./.deb-pkg/=/
	rm -rf ./.deb-pkg/

clean:
	cd radxa-zero && $(MAKE) clean
	cd radxa-zero2 && $(MAKE) clean

distclean:
	cd radxa-zero && $(MAKE) distclean
	cd radxa-zero2 && $(MAKE) distclean
