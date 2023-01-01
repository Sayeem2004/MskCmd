# Installing requirements
brew list pngcrush &> /dev/null || brew install pngcrush &> /dev/null

# File content
read -r -d '' COMMENT << EOM
# Compresses and overwrites all png images in a folder.
EOM

read -r -d '' COMMAND << EOM
for png in *.png(.N); do
	printf "\\\\n"
	pngcrush -ow "\$png"
done;
printf "\\\\n"
EOM

# Adding content to function file
PATH_TO_FILE=~/.msk_cmd/pngcrush-all
echo "$COMMENT" > $PATH_TO_FILE
echo "$COMMAND" >> $PATH_TO_FILE
