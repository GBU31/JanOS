ASM=nasm

SRC_DIR=src
BUILD_DIR=build

$(BUILD_DIR)/main_floppy.img: $(BUILD_DIR)/main.bin
	cp $(BUILD_DIR)/main.bin $(BUILD_DIR)/main_floppy.img
	truncate -s 1440k $(BUILD_DIR)/main_floppy.img

$(BUILD_DIR)/main.bin: $(SRC_DIR)/bootloader.asm
	mkdir -p $(BUILD_DIR)
	$(ASM) -f bin $(SRC_DIR)/bootloader.asm -o $(BUILD_DIR)/main.bin


.PHONY: clean
clean:
	rm -rf $(BUILD_DIR)

# Phony target to build everything
.PHONY: all
all: $(BUILD_DIR)/main_floppy.img
