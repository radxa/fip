# FIP
Amlogic Firmware In Package - Prebuilt binaries/tools to pack Amlogic bootloader

# Usage

    make list_device
    make <device_name> UBOOT_BIN=/path/to/u-boot.bin
    make clean
    make distclean

Packed output files are:

    <device_name>
        ├── u-boot.bin
        ├── u-boot.bin.sd.bin
        ├── u-boot.bin.usb.bl2
        └── u-boot.bin.usb.tpl
