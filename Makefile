OSBOOK_HOME=/Users/fukuno/data/c/osbook

all: fs/EFI/BOOT/BOOTX64.EFI

fs/EFI/BOOT/BOOTX64.EFI: main.zen
	mkdir -p fs/EFI/BOOT
	zen build-exe main.zen -target x86_64-uefi-msvc
	cp main.efi fs/EFI/BOOT/BOOTX64.EFI

run: fs/EFI/BOOT/BOOTX64.EFI
	${OSBOOK_HOME}/devenv/run_qemu.sh main.efi

clean:
	rm -rf *~ fs
	rm -rf *~ mnt
	rm disk.img
	rm -f main.obj
	rm -f main.efi
	rm -f main.pdb

.PHONY: clean
