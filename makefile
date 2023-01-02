NULL :=
TAB  := $(NULL)    $(NULL)

repo_path     := $(shell pwd)
function_path := $(repo_path)/functions
script_path   := $(repo_path)/scripts

all: clean configure_zsh configure_brew configure_coding build
	$(info Finished configuring ZSH)

clean:
	$(info Cleaning Repo...)
	$(info $(TAB)cargo clean)
	@cargo clean
	$(info $(TAB)rm -rf $(repo_path)/bin)
	@rm -rf $(repo_path)/bin

configure_zsh: update_permission
	$(info Configuring ZSH...)
	@$(script_path)/configure_zsh.sh $(repo_path)

configure_brew: update_permission
	$(info Configuring Brew...)
	@$(script_path)/configure_brew.sh $(repo_path)

configure_coding: update_permission
	$(info Configuring Coding...)
	@$(script_path)/configure_code.sh $(repo_path)

update_permission:
	$(info Updating Permissions...)
	$(info $(TAB)chmod +x $(function_path)/*)
	@chmod +x $(function_path)/*
	$(info $(TAB)chmod +x $(script_path)/*)
	@chmod +x $(script_path)/*

build:
	$(info Building Repo...)
	@cargo build --release
