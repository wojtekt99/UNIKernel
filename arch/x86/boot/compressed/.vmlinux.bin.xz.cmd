cmd_arch/x86/boot/compressed/vmlinux.bin.xz := (cat arch/x86/boot/compressed/vmlinux.bin | sh ./scripts/xz_wrap.sh && printf \\320\\367\\233\\002) > arch/x86/boot/compressed/vmlinux.bin.xz || (rm -f arch/x86/boot/compressed/vmlinux.bin.xz ; false)