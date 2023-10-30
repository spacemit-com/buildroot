# How to build

```
make spacemit_stev10_initramfs_defconfig
make
```

# How to run

## Run on qemu

```
qemu-system-riscv64 -M k1max -cpu rv64,v=true,vlen=128,elen=64,vext_spec=v1.0,svpbmt=true -bios output/images/fw_jump.elf -kernel output/images/Image -nographic
```

## Run on board

```
target remote 192.168.1.1:1025

set height 0

### option 1
lo output/images/fw_jump.elf
lo output/build/linux-k1-dev-stev10/vmlinux 0x40200000

### option 2
#lo output/images/fw_payload.elf

### brom: lui t0,0x40000; jr t0
set *(long long *)0x0=0x00008282400002b7

restore output/images/stev10.dtb binary 0x40180000

set $a0=0
set $a1=0x40180000
set $pc=0x40000000
```
