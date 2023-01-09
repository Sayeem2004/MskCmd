#!/bin/zsh

# File content
read -r -d '' function_comments << EOM
# Loads in ssh identities from apple keychain.
EOM

read -r -d '' function_commands << EOM
ssh-add --apple-load-keychain
EOM

# Adding content to function file
path_to_function=$ZDOTDIR/.zsh_functions/sshload
echo "$function_comments" > $path_to_function
echo "$function_commands" >> $path_to_function
