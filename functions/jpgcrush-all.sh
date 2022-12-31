# Printing arguments
echo $0

# Installing requirements
brew install jpegoptim &> /dev/null

# File content
read -r -d '' COMMENT << EOM
# Compresses and overwrites all jpg images in a folder.
EOM

read -r -d '' COMMAND << EOM
jpegoptim *.jpg
EOM

# Adding content to function file
PATH_TO_FILE=~/.msk_cmd/jpgcrush-all
echo "$COMMENT" > $PATH_TO_FILE
echo "$COMMAND" >> $PATH_TO_FILE
