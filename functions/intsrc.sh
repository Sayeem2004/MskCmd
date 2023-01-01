# Installing requirements

# File content
read -r -d '' COMMENT << EOM
# Prints the lines in a file that contain integers that satisfy the given expression.
EOM

read -r -d '' COMMAND << EOM
echo ""
EOM

# Adding content to function file
PATH_TO_FILE=~/.msk_cmd/intsrc
echo "$COMMENT" > $PATH_TO_FILE
echo "$COMMAND" >> $PATH_TO_FILE
