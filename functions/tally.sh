#!/bin/zsh

# File content
read -r -d '' function_comments << EOM
# Counts the number of lines in the given directory and sorts them by extension type.
EOM

read -r -d '' function_commands << EOM
cargo run --release --quiet --manifest-path $1/Cargo.toml --bin tally -- "\$@"
EOM

# Adding content to function file
path_to_function=$ZDOTDIR/.zsh_functions/tally
echo "$function_comments" > $path_to_function
echo "$function_commands" >> $path_to_function
