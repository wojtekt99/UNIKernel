cmd_sound/drivers/built-in.o :=  ld -m elf_x86_64   -r -o sound/drivers/built-in.o sound/drivers/snd-dummy.o sound/drivers/snd-aloop.o sound/drivers/snd-virmidi.o sound/drivers/snd-serial-u16550.o sound/drivers/snd-mtpav.o sound/drivers/snd-mts64.o sound/drivers/snd-portman2x4.o sound/drivers/opl3/built-in.o sound/drivers/opl4/built-in.o sound/drivers/mpu401/built-in.o sound/drivers/vx/built-in.o sound/drivers/pcsp/built-in.o 