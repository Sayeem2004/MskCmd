#!/bin/zsh
# $1 = REPO_PATH, $2 = CRATE_PATH, $3 = FUNCTION_PATH, $4 = SCRIPT_PATH

# Printing start message
printf "\e[1;32m"
printf "Starting ZSH Customization...\n"
printf "\e[0m"

# Installing brew packages
$4/brew.sh $@

# Configuring utility settings
$4/utility.sh $@

# Writing zsh functions
$4/function.sh $@

# Building rust crates
$4/build.sh $@

# Printing end message
printf "\e[1;32m"
printf "Finished ZSH Customization\n"
printf "\e[0m"
