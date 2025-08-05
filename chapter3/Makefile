BUILD_DIR := build

all: $(BUILD_DIR)/maximum $(BUILD_DIR)/minimum $(BUILD_DIR)/max_sa $(BUILD_DIR)/exit

# Ensure build directory exists
$(BUILD_DIR):
	mkdir -p $(BUILD_DIR)

# maximum
$(BUILD_DIR)/maximum.o: maximum.s | $(BUILD_DIR)
	as maximum.s -o $(BUILD_DIR)/maximum.o

$(BUILD_DIR)/maximum: $(BUILD_DIR)/maximum.o
	ld $(BUILD_DIR)/maximum.o -o $(BUILD_DIR)/maximum

# minimum
$(BUILD_DIR)/minimum.o: minimum.s | $(BUILD_DIR)
	as minimum.s -o $(BUILD_DIR)/minimum.o

$(BUILD_DIR)/minimum: $(BUILD_DIR)/minimum.o
	ld $(BUILD_DIR)/minimum.o -o $(BUILD_DIR)/minimum

# max_sa
$(BUILD_DIR)/max_sa.o: max_sa.s | $(BUILD_DIR)
	as max_sa.s -o $(BUILD_DIR)/max_sa.o

$(BUILD_DIR)/max_sa: $(BUILD_DIR)/max_sa.o
	ld $(BUILD_DIR)/max_sa.o -o $(BUILD_DIR)/max_sa

# exit
$(BUILD_DIR)/exit.o: exit.s | $(BUILD_DIR)
	as exit.s -o $(BUILD_DIR)/exit.o

$(BUILD_DIR)/exit: $(BUILD_DIR)/exit.o
	ld $(BUILD_DIR)/exit.o -o $(BUILD_DIR)/exit

# Clean rule
clean:
	rm -rf $(BUILD_DIR)