NULL :=
TAB  := $(NULL)    $(NULL)

repo_path     := $(shell pwd)
function_path := $(repo_path)/function
script_path   := $(repo_path)/script
zshrc_path    := ~/.zshrc

update_permission:
	$(info Updating Permissions...)
	$(info $(TAB)chmod +x $(function_path)/*)
	@chmod +x $(function_path)/*
	$(info $(TAB)chmod +x $(script_path)/*)
	@chmod +x $(script_path)/*

build:
	$(info Building...)
	@cargo build --release

clean:
	$(info Cleaning...)
	@cargo clean
	@rm -rf $(repo_path)/bin

install_brew: update_permission
	$(info Installing Brew...)
	@$(script_path)/install_brew.sh

# install: update build
# 	@echo "Installing..."
# 	@./$(install) $(repo_path)
# 	@source $(zshrc)

# remove: clean
# 	@echo "Removing..."
# 	@./$(remove)
# 	@source $(zshrc)
