# Author: Sayeem2004
# $1 = REPO_PATH
# $2 = CRATE_PATH
# $3 = FUNCTION_PATH
# $4 = SCRIPT_PATH

# Printing start message
printf "\e[1;32m"
printf "\tBuilding Rust Crates...\n"
printf "\e[0m"

# Printing the crates
printf "\t\tBuilding intsrc...\n"
printf "\t\tBuilding tally...\n"

# Building and counting the crates
cargo build --release --manifest-path $1/Cargo.toml
let count="$(ls $2 | wc -w)"

# Printing end message
printf "\e[1;32m"
printf "\tBuilt $count Crates\n"
printf "\e[0m"
