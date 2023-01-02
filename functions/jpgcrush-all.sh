# Author: Sayeem2004

# File content
read -r -d '' comments << EOM
# Compresses and overwrites all JPG images in a folder.
EOM

read -r -d '' commands << EOM
jpegoptim *.jpg
EOM

# Adding content to function file
path_to_function=$ZDOTDIR/.zsh_functions/jpgcrush-all
echo "$comments" > $path_to_function
echo "$commands" >> $path_to_function
