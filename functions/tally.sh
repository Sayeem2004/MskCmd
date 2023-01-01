# Installing requirements

# File content
read -r -d '' COMMENT << EOM
# Counts the number of lines in the given directory and sorts them by extension type.
EOM

read -r -d '' COMMAND << EOM
echo ""
EOM

# Adding content to function file
PATH_TO_FILE=~/.msk_cmd/tally
echo "$COMMENT" > $PATH_TO_FILE
echo "$COMMAND" >> $PATH_TO_FILE
