#!/bin/zsh
# $1 = REPO_PATH, $2 = CRATE_PATH, $3 = FUNCTION_PATH, $4 = SCRIPT_PATH

# Exporting variables
export CARGO_HOME=$HOME/.config/cargo
export RUSTUP_HOME=$HOME/.config/rustup

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
title "Starting ZSH Customization..."

# Installing brew packages
$4/brew.sh $@

# Configuring utility settings
$4/utility.sh $@

# Writing zsh functions
$4/function.sh $@

# Building rust crates
$4/build.sh $@

# Printing end message
title "Finished ZSH Customization, Please Restart Terminal To Apply Changes"
