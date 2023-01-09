#!/bin/zsh

# File content
read -r -d '' function_comments << EOM
# Prints the lines in a file that contain integers that satisfy the given expression.
EOM

read -r -d '' function_commands << EOM
cargo run --release --quiet --manifest-path $1/Cargo.toml --bin intsrc -- "\$@"
EOM

# Adding content to function file
path_to_function=$ZDOTDIR/.zsh_functions/intsrc
echo "$function_comments" > $path_to_function
echo "$function_commands" >> $path_to_function
