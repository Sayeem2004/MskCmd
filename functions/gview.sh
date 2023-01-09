#!/bin/zsh

# File content
read -r -d '' function_comments << EOM
# Displays the contents of a directory or file as a graph.
EOM

read -r -d '' function_commands << EOM
cargo run --release --quiet --manifest-path $1/Cargo.toml --bin gview -- "\$@"
EOM

# Adding content to function file
path_to_function=$ZDOTDIR/.zsh_functions/gview
echo "$function_comments" > $path_to_function
echo "$function_commands" >> $path_to_function
