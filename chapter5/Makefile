BUILD_DIR := build

all: $(BUILD_DIR)/howdy \
     $(BUILD_DIR)/toupperastd \
     $(BUILD_DIR)/toupperstd \
     $(BUILD_DIR)/toupper \
     $(BUILD_DIR)/test_comments

$(BUILD_DIR):
	mkdir -p $(BUILD_DIR)

# howdy
$(BUILD_DIR)/howdy.o: howdy.s | $(BUILD_DIR)
	as --32 howdy.s -o $(BUILD_DIR)/howdy.o

$(BUILD_DIR)/howdy: $(BUILD_DIR)/howdy.o
	ld -m elf_i386 $(BUILD_DIR)/howdy.o -o $(BUILD_DIR)/howdy

# toupperastd
$(BUILD_DIR)/toupperastd.o: toupperastd.s | $(BUILD_DIR)
	as --32 toupperastd.s -o $(BUILD_DIR)/toupperastd.o

$(BUILD_DIR)/toupperastd: $(BUILD_DIR)/toupperastd.o
	ld -m elf_i386 $(BUILD_DIR)/toupperastd.o -o $(BUILD_DIR)/toupperastd

# toupperstd
$(BUILD_DIR)/toupperstd.o: toupperstd.s | $(BUILD_DIR)
	as --32 toupperstd.s -o $(BUILD_DIR)/toupperstd.o

$(BUILD_DIR)/toupperstd: $(BUILD_DIR)/toupperstd.o
	ld -m elf_i386 $(BUILD_DIR)/toupperstd.o -o $(BUILD_DIR)/toupperstd

# toupper
$(BUILD_DIR)/toupper.o: toupper.s | $(BUILD_DIR)
	as --32 toupper.s -o $(BUILD_DIR)/toupper.o

$(BUILD_DIR)/toupper: $(BUILD_DIR)/toupper.o
	ld -m elf_i386 $(BUILD_DIR)/toupper.o -o $(BUILD_DIR)/toupper

# test_comments
$(BUILD_DIR)/test_comments.o: test_comments.s | $(BUILD_DIR)
	as --32 test_comments.s -o $(BUILD_DIR)/test_comments.o

$(BUILD_DIR)/test_comments: $(BUILD_DIR)/test_comments.o
	ld -m elf_i386 $(BUILD_DIR)/test_comments.o -o $(BUILD_DIR)/test_comments

clean:
	rm -rf $(BUILD_DIR)