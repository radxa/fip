# Let's see if we can replicate this.
#
# blx_fix.sh bl30.bin zero_tmp bl30_zero.bin bl301.bin bl301_zero.bin bl30_new.bin bl30
# blx_fix.sh bl2.bin  zero_tmp bl2_zero.bin  acs.bin   bl21_zero.bin  bl2_new.bin  bl2

# ./aml_encrypt_g12a --bl30sig --input bl30_new.bin	         --output bl30_new.bin.g12a.enc --level v3
# ./aml_encrypt_g12a --bl3sig  --input bl30_new.bin.g12a.enc --output bl30_new.bin.enc      --level v3 --type bl30
# ./aml_encrypt_g12a --bl3sig  --input bl31.img              --output bl31.img.enc          --level v3 --type bl31
# ./aml_encrypt_g12a --bl3sig  --input bl33.bin              --output bl33.bin.enc          --level v3 --type bl33 --compress lz4
# ./aml_encrypt_g12a --bl2sig  --input bl2_new.bin           --output bl2.n.bin.sig
# ./aml_encrypt_g12a --bootmk                                --output u-boot.bin            --level v3 \
#                    --bl2 bl2.n.bin.sig --bl30 bl30_new.bin.enc --bl31 bl31.img.enc     --bl33 bl33.bin.enc \
#                    --ddrfw1 ddr4_1d.fw   --ddrfw2 ddr4_2d.fw   --ddrfw3 ddr3_1d.fw     --ddrfw4 piei.fw \
#                    --ddrfw5 lpddr4_1d.fw --ddrfw6 lpddr4_2d.fw --ddrfw7 diag_lpddr4.fw --ddrfw8 aml_ddr.fw

.phony: clean

all: u-boot.bin

clean:
	rm -f bl30_new.bin bl2_new.bin
	rm -f bl30_new.bin.g12a.enc bl30_new.bin.enc
	rm -f bl31.img.enc bl33.bin.enc
	rm -f bl21_zero.bin bl2_zero.bin bl301_zero.bin bl30_zero.bin bl2.n.bin.sig

distclean: clean
	rm -f bl33.bin
	rm -f u-boot.bin u-boot.bin.sd.bin u-boot.bin.usb.bl2 u-boot.bin.usb.tpl

bl30_new.bin: bl30.bin bl301.bin
	./blx_fix.sh bl30.bin zero_tmp bl30_zero.bin bl301.bin bl301_zero.bin bl30_new.bin bl30

bl2_new.bin: bl2.bin acs.bin
	./blx_fix.sh bl2.bin  zero_tmp bl2_zero.bin  acs.bin   bl21_zero.bin  bl2_new.bin  bl2

bl30_new.bin.g12a.enc: bl30_new.bin
	./aml_encrypt_g12a --bl30sig --input bl30_new.bin	       --output bl30_new.bin.g12a.enc --level v3

bl30_new.bin.enc: bl30_new.bin.g12a.enc
	./aml_encrypt_g12a --bl3sig  --input bl30_new.bin.g12a.enc --output bl30_new.bin.enc      --level v3 --type bl30

bl31.img.enc: bl31.img
	./aml_encrypt_g12a --bl3sig  --input bl31.img              --output bl31.img.enc          --level v3 --type bl31

bl33.bin.enc: bl33.bin
	./aml_encrypt_g12a --bl3sig  --input bl33.bin              --output bl33.bin.enc          --level v3 --type bl33
	# --compress lz4

bl2.n.bin.sig: bl2_new.bin
	./aml_encrypt_g12a --bl2sig  --input bl2_new.bin           --output bl2.n.bin.sig

u-boot.bin: bl2.n.bin.sig bl30_new.bin.enc bl31.img.enc bl33.bin.enc
	./aml_encrypt_g12a --bootmk                                --output u-boot.bin            --level v3 \
	               --bl2 bl2.n.bin.sig --bl30 bl30_new.bin.enc --bl31 bl31.img.enc     --bl33 bl33.bin.enc \
	               --ddrfw1 ddr4_1d.fw   --ddrfw2 ddr4_2d.fw   --ddrfw3 ddr3_1d.fw     --ddrfw4 piei.fw \
	               --ddrfw5 lpddr4_1d.fw --ddrfw6 lpddr4_2d.fw --ddrfw7 diag_lpddr4.fw --ddrfw8 aml_ddr.fw

