repo_path := $(shell pwd)
function_path := $(repo_path)/functions
script_path := $(repo_path)/scripts
zshrc_path := ~/.zshrc

update:
	@echo "Updating Permissions..."
	echo $(function_path)

build:
	@echo "Building..."
	@cargo build --release

install: update build
	@echo "Installing..."
	@./$(install) $(repo_path)
	@source $(zshrc)

clean:
	@echo "Cleaning..."
	@cargo clean

remove: clean
	@echo "Removing..."
	@./$(remove)
	@source $(zshrc)
