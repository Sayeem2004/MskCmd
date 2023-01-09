#!/bin/zsh

# File content
read -r -d '' function_comments << EOM
# Compresses and overwrites all JPG images in a folder.
EOM

read -r -d '' function_commands << EOM
jpegoptim *.jpg
EOM

# Adding content to function file
path_to_function=$ZDOTDIR/.zsh_functions/jpgcrush-all
echo "$function_comments" > $path_to_function
echo "$function_commands" >> $path_to_function
