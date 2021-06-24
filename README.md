# FIP
Amlogic Firmware In Package - Prebuilt binaries/tools to pack Amlogic bootloader

# Usage

copy your u-boot.bin to the fip binary folder as bl33.bin

    cp /path/to/u-boot.bin fip/radxa_zero/bl33.bin
    cd fip/radxa_zero
    make

Packed output files are:

    ├── u-boot.bin
    ├── u-boot.bin.sd.bin
    ├── u-boot.bin.usb.bl2
    └── u-boot.bin.usb.tpl
