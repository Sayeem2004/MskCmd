# File content
read -r -d '' comments << EOM
# Prints the lines in a file that contain integers that satisfy the given expression.
EOM

read -r -d '' commands << EOM
cargo run --release --manifest-path $1/Cargo.toml --bin intsrc
EOM

# Adding content to function file
path_to_function=$ZDOTDIR/.zsh_functions/intsrc
echo "$comments" > $path_to_function
echo "$commands" >> $path_to_function
