# Printing arguments
echo $0

# Installing requirements

# File content
read -r -d '' COMMENT << EOM
# Lists all current commands and their descriptions.
EOM

PATH_TO_README="$1/README.md"
read -r -d '' COMMAND << EOM
grep -A100 -m1 -e '# Usage' $PATH_TO_README
EOM

# Adding content to function file
PATH_TO_FILE=~/.msk_cmd/mskcmd
echo "$COMMENT" > $PATH_TO_FILE
echo "$COMMAND" >> $PATH_TO_FILE
