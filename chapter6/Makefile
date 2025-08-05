BUILD_DIR := build

all: $(BUILD_DIR)/read-records \
     $(BUILD_DIR)/add-year \
     $(BUILD_DIR)/write-records

$(BUILD_DIR):
	mkdir -p $(BUILD_DIR)

# read-records
$(BUILD_DIR)/read-records.o: read-records.s | $(BUILD_DIR)
	as --32 read-records.s -o $(BUILD_DIR)/read-records.o

$(BUILD_DIR)/read-record.o: read-record.s | $(BUILD_DIR)
	as --32 read-record.s -o $(BUILD_DIR)/read-record.o

$(BUILD_DIR)/count-chars.o: count-chars.s | $(BUILD_DIR)
	as --32 count-chars.s -o $(BUILD_DIR)/count-chars.o

$(BUILD_DIR)/write-newline.o: write-newline.s | $(BUILD_DIR)
	as --32 write-newline.s -o $(BUILD_DIR)/write-newline.o

$(BUILD_DIR)/read-records: $(BUILD_DIR)/read-records.o $(BUILD_DIR)/read-record.o $(BUILD_DIR)/count-chars.o $(BUILD_DIR)/write-newline.o
	ld -m elf_i386 $(BUILD_DIR)/read-records.o $(BUILD_DIR)/read-record.o $(BUILD_DIR)/count-chars.o $(BUILD_DIR)/write-newline.o -o $(BUILD_DIR)/read-records

# add-year
$(BUILD_DIR)/add-year.o: add-year.s | $(BUILD_DIR)
	as --32 add-year.s -o $(BUILD_DIR)/add-year.o

$(BUILD_DIR)/write-record.o: write-record.s | $(BUILD_DIR)
	as --32 write-record.s -o $(BUILD_DIR)/write-record.o

$(BUILD_DIR)/add-year: $(BUILD_DIR)/add-year.o $(BUILD_DIR)/read-record.o $(BUILD_DIR)/write-record.o
	ld -m elf_i386 $(BUILD_DIR)/add-year.o $(BUILD_DIR)/read-record.o $(BUILD_DIR)/write-record.o -o $(BUILD_DIR)/add-year

# write-records
$(BUILD_DIR)/write-records.o: write-records.s | $(BUILD_DIR)
	as --32 write-records.s -o $(BUILD_DIR)/write-records.o

$(BUILD_DIR)/write-records: $(BUILD_DIR)/write-records.o $(BUILD_DIR)/write-record.o
	ld -m elf_i386 $(BUILD_DIR)/write-records.o $(BUILD_DIR)/write-record.o -o $(BUILD_DIR)/write-records

clean:
	rm -rf $(BUILD_DIR)