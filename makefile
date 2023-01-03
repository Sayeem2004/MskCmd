# Author: Sayeem2004

# Path Variables
repo_path     := $(shell pwd)
crate_path    := $(repo_path)/crates
function_path := $(repo_path)/functions
script_path   := $(repo_path)/scripts

# Customizes ZSH Shell
all: update
	@$(script_path)/all.sh $(repo_path) $(crate_path) $(function_path) $(script_path)

# Updates File Permissions
update:
	@chmod +x $(function_path)/*
	@chmod +x $(script_path)/*

# Cleans Rust Crates
clean:
	@cargo clean --release --manifest-path $(repo_path)/Cargo.toml
	@rm -rf $(repo_path)/bin
