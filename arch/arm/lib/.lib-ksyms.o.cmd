cmd_arch/arm/lib/lib-ksyms.o := arm-linux-gnueabi-objdump -h arch/arm/lib/lib.a | sed -ne '/___ksymtab/s/.*+\([^ ]*\).*/EXTERN(\1)/p' >arch/arm/lib/.lib-ksyms.o.lds; rm -f arch/arm/lib/.lib_exports.o; echo | arm-linux-gnueabi-gcc -Wp,-MD,arch/arm/lib/.lib-ksyms.o.d  -nostdinc -isystem /usr/lib/gcc-cross/arm-linux-gnueabi/6/include -I./arch/arm/include -I./arch/arm/include/generated/uapi -I./arch/arm/include/generated  -I./include -I./arch/arm/include/uapi -I./include/uapi -I./include/generated/uapi -include ./include/linux/kconfig.h -D__KERNEL__ -mlittle-endian -D__ASSEMBLY__ -fno-PIE -mabi=apcs-gnu -mno-thumb-interwork -marm -D__LINUX_ARM_ARCH__=7 -march=armv7-a -include asm/unified.h -msoft-float -Wa,-gdwarf-2 -DCC_HAVE_ASM_GOTO   -c -o arch/arm/lib/.lib_exports.o -x assembler -; arm-linux-gnueabi-ld -EL    -r -o arch/arm/lib/lib-ksyms.o -T arch/arm/lib/.lib-ksyms.o.lds arch/arm/lib/.lib_exports.o; rm arch/arm/lib/.lib_exports.o arch/arm/lib/.lib-ksyms.o.lds