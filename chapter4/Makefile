BUILD_DIR := build

all: $(BUILD_DIR)/maximum \
     $(BUILD_DIR)/use_outside_square \
     $(BUILD_DIR)/square \
     $(BUILD_DIR)/factorial \
     $(BUILD_DIR)/power

$(BUILD_DIR):
	mkdir -p $(BUILD_DIR)

# maximum
$(BUILD_DIR)/maximum.o: maximum.s | $(BUILD_DIR)
	as --32 maximum.s -o $(BUILD_DIR)/maximum.o

$(BUILD_DIR)/maximum: $(BUILD_DIR)/maximum.o
	ld -m elf_i386 $(BUILD_DIR)/maximum.o -o $(BUILD_DIR)/maximum

# square
$(BUILD_DIR)/square.o: square.s | $(BUILD_DIR)
	as --32 square.s -o $(BUILD_DIR)/square.o

$(BUILD_DIR)/square: $(BUILD_DIR)/square.o
	ld -m elf_i386 $(BUILD_DIR)/square.o -o $(BUILD_DIR)/square

# use_outside_square
$(BUILD_DIR)/use_outside_square.o: use_outside_square.s square.s | $(BUILD_DIR)
	as --32 use_outside_square.s -o $(BUILD_DIR)/use_outside_square.o

$(BUILD_DIR)/use_outside_square: $(BUILD_DIR)/use_outside_square.o $(BUILD_DIR)/square.o
	ld -m elf_i386 $(BUILD_DIR)/use_outside_square.o $(BUILD_DIR)/square.o -o $(BUILD_DIR)/use_outside_square

# factorial
$(BUILD_DIR)/factorial.o: factorial.s | $(BUILD_DIR)
	as --32 factorial.s -o $(BUILD_DIR)/factorial.o

$(BUILD_DIR)/factorial: $(BUILD_DIR)/factorial.o
	ld -m elf_i386 $(BUILD_DIR)/factorial.o -o $(BUILD_DIR)/factorial

# power
$(BUILD_DIR)/power.o: power.s | $(BUILD_DIR)
	as --32 power.s -o $(BUILD_DIR)/power.o

$(BUILD_DIR)/power: $(BUILD_DIR)/power.o
	ld -m elf_i386 $(BUILD_DIR)/power.o -o $(BUILD_DIR)/power

clean:
	rm -rf $(BUILD_DIR)