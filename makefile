all:
	@echo "Compiling..."
	nasm -fbin -o bin/loader.bin source/loader.asm	
	nasm -fbin -o bin/kernel.bin source/kernel.asm
	@echo "Done."
	@echo "Creating disk..."
	dd if=/dev/zero of=bin/disk.img bs=512 count=2880
	dd if=bin/loader.bin of=bin/disk.img bs=512 count=1 conv=notrunc
	dd if=bin/kernel.bin of=bin/disk.img bs=512 count=1 seek=1 conv=notrunc
	@echo "Done."
	@echo "Emulating..."
	qemu-system-i386 -fda bin/disk.img
	@echo "Done."
	@echo "Cleaning..."
	rm bin/*
	@echo "Done."
	
	
compile:
	@echo "Compiling..."
	nasm -fbin -o bin/loader.bin source/loader.asm	
	nasm -fbin -o bin/kernel.bin source/kernel.asm
	@echo "Done."

disk:
	@echo "Creating disk..."
	dd if=/dev/zero of=bin/disk.img bs=512 count=2880
	dd if=bin/loader.bin of=bin/disk.img bs=512 count=1 conv=notrunc
	dd if=bin/kernel.bin of=bin/disk.img bs=512 count=1 seek=1 conv=notrunc
	@echo "Done."

emulate:
	@echo "Emulating..."
	qemu-system-x86_64 -boot c -vga cirrus -m 18 -L vgabios-stdvga -boot menu=off -hda bin/disk.img -rtc base=localtime,clock=host
	@echo "Done."

clean:
	@echo "Cleaning..."
	rm bin/*
	@echo "Done."
