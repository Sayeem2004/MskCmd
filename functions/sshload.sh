# Printing arguments
echo $0

# File content
read -r -d '' COMMENT << EOM
# Loads in ssh identities from apple keychain.
EOM

read -r -d '' COMMAND << EOM
ssh-add --apple-load-keychain
EOM

# Adding content to function file
PATH_TO_FILE=~/.msk_cmd/sshload
echo "$COMMENT" > $PATH_TO_FILE
echo "$COMMAND" >> $PATH_TO_FILE
