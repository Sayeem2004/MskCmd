REPO_PATH := $(shell pwd)
INSTALL := utilities/install.sh
REMOVE := utilities/remove.sh
FUNCTION_FILES := $(wildcard functions/*.sh)
ZSHRC := ~/.zshrc

all: update clean build install

update: $(SCRIPT_FILES)
	@echo "Updating Permissions...\n"
	chmod +x $(INSTALL)
	chmod +x $(REMOVE)
	chmod +x $(FUNCTION_FILES)
	@echo ""

clean:
	@echo "Cleaning...\n"
	cargo clean
	@echo ""

build:
	@echo "Building...\n"
	cargo build --release
	@echo ""

install:
	@echo "Installing...\n"
	@./$(INSTALL) $(REPO_PATH)
	@echo ""

remove:
	@echo "Removing...\n"
	@./$(REMOVE)
	@echo ""
