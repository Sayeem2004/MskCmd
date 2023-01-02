# TODO: Finish configure_code implementation
# TODO: Finish configure_functions implementation
# TODO: Find more packages to install in configure_brew
# Author: Sayeem2004

NULL :=
TAB  := $(NULL)    $(NULL)

repo_path     := $(shell pwd)
crate_path    := $(repo_path)/crates
function_path := $(repo_path)/functions
script_path   := $(repo_path)/scripts
sh_count      := $(shell echo $(script_path)/* $(function_path)/* | wc -w | tr -d ' ')
rs_count	  := $(shell echo $(crate_path)/* | wc -w | tr -d ' ')

all: configure_functions configure_brew configure_coding build
	$(info Finished configuring ZSH)

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
	$(info $(TAB)chmod +x $(function_path)/*...)
	@chmod +x $(function_path)/*
	$(info $(TAB)chmod +x $(script_path)/*...)
	@chmod +x $(script_path)/*
	$(info $(TAB)Updated $(sh_count) files)

build: build_help
	$(info $(TAB)Built $(rs_count) crates)

build_help:
	$(info Building Repo...)
	@cargo build --release --manifest-path $(repo_path)/Cargo.toml

clean:
	$(info Cleaning Repo...)
	$(info $(TAB)cargo clean --release...)
	@cargo clean --release --manifest-path $(repo_path)/Cargo.toml
	$(info $(TAB)rm -rf $(repo_path)/bin...)
	@rm -rf $(repo_path)/bin
