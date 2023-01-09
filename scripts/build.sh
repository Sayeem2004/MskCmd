#!/bin/zsh
# $1 = REPO_PATH, $2 = CRATE_PATH, $3 = FUNCTION_PATH, $4 = SCRIPT_PATH

# Printing start message
printf "\e[1;32m"
printf "Building Rust Crates...\n"
printf "\e[0m"

# Printing the crates
printf "    Building tally...\n"
printf "    Building intsrc...\n"
printf "    Building gview...\n"

# Building and counting the crates
cargo build --release --manifest-path $1/Cargo.toml
let count="$(ls -l target/release | grep -c "\.d")"

# Printing end message
printf "\e[1;32m"
printf "Built $count Crates\n"
printf "\e[0m"
