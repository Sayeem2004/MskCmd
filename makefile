BIN := $(shell pwd)/target/release/mskcmd
INSTALL := script/install.sh
REMOVE := script/remove.sh
SCRIPT_FILES := $(wildcard script/*.sh)
ZSHRC := ~/.zshrc

all: update clean build install
	@source $(ZSHRC)

update: $(SCRIPT_FILES)
	@echo "Updating Permissions...\n"
	chmod +x $(SCRIPT_FILES)
	@echo ""

clean:
	@echo "Cleaning...\n"
	cargo clean && ./$(REMOVE)
	@echo ""

build:
	@echo "Building...\n"
	cargo build --release
	@echo ""

install:
	@echo "Installing...\n"
	./$(INSTALL) $(BIN)
	@echo ""
