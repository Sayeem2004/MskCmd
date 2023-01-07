# File content
read -r -d '' comments << EOM
# Displays the contents of a directory or file as a graph.
EOM

read -r -d '' comments << EOM
cargo run --release --quiet --manifest-path $1/Cargo.toml --bin gview -- "\$@"
EOM

# Adding content to function file
path_to_function=$ZDOTDIR/.zsh_functions/gview
echo "$comments" > $path_to_function
echo "$commands" >> $path_to_function
