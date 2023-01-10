#!/bin/zsh
# $1 = REPO_PATH, $2 = CRATE_PATH, $3 = FUNCTION_PATH, $4 = SCRIPT_PATH

# Defining utility variables
_SIZE_="40"
_PRE_="%-${_SIZE_}s"
_MAX_=$(( ($COLUMNS - 4) / $_SIZE_ ))

# Defining utility functions
red() {printf "\e[1;31m";}
blue() {printf "\e[1;32m";}
no() {printf "\e[0m";}
new() {expr $count % $_MAX_ &> /dev/null || printf "\n    ";}
title() {blue && printf "$1\n" && no}
info() {printf $_PRE_ "$1" && let ++count && new}
err() {red && printf $_PRE_ "$1" && no && let ++count && new}

# Printing start message
title "    Building Rust Crates..."
printf "    "

# Printing the crates
printf $_PRE_ "Building tally..."
printf $_PRE_ "Building intsrc..."
printf $_PRE_ "Building gview..."
printf "\n"

# Building and counting the crates
cargo build --release --manifest-path $1/Cargo.toml
let valid="$(ls -l target/release | grep -c "\.d")"

# Printing end message
title "    Built $valid Crates"
