# TODO: Finish intsrc implementation
# TODO: Finish configure_code implementation
# TODO: Finish configure_functions implementation
# TODO: Find more packages to install in configure_brew

NULL :=
TAB  := $(NULL)    $(NULL)

repo_path     := $(shell pwd)
function_path := $(repo_path)/functions
script_path   := $(repo_path)/scripts

all: clean configure_functions configure_brew configure_coding build
	$(info Finished configuring ZSH)

clean:
	$(info Cleaning Repo...)
	$(info $(TAB)cargo clean)
	@cargo clean
	$(info $(TAB)rm -rf $(repo_path)/bin)
	@rm -rf $(repo_path)/bin

configure_functions: update_permission
	$(info Configuring Functions...)
	@$(script_path)/configure_functions.sh $(repo_path)

configure_brew: update_permission
	$(info Configuring Brew...)
	@$(script_path)/configure_brew.sh $(repo_path)

configure_coding: update_permission
	$(info Configuring Coding...)
	@$(script_path)/configure_coding.sh $(repo_path)

update_permission:
	$(info Updating Permissions...)
	$(info $(TAB)chmod +x $(function_path)/*)
	@chmod +x $(function_path)/*
	$(info $(TAB)chmod +x $(script_path)/*)
	@chmod +x $(script_path)/*

build:
	$(info Building Repo...)
	@cargo build --release
