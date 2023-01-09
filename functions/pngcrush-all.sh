#!/bin/zsh

# File content
read -r -d '' function_comments << EOM
# Compresses and overwrites all PNG images in a folder.
EOM

read -r -d '' function_commands << EOM
for png in *.png(.N); do
	printf "\\\\n"
	pngcrush -ow "\$png"
done;
printf "\\\\n"
EOM

# Adding content to function file
path_to_function=$ZDOTDIR/.zsh_functions/pngcrush-all
echo "$function_comments" > $path_to_function
echo "$function_commands" >> $path_to_function
