# Author: Sayeem2004

# File content
read -r -d '' comments << EOM
# Loads in ssh identities from apple keychain.
EOM

read -r -d '' commands << EOM
ssh-add --apple-load-keychain
EOM

# Adding content to function file
path_to_function=$ZDOTDIR/.zsh_functions/sshload
echo "$comments" > $path_to_function
echo "$commands" >> $path_to_function
