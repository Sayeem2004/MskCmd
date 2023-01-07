# File content
read -r -d '' comments << EOM
# Compresses and overwrites all PNG images in a folder.
EOM

read -r -d '' commands << EOM
for png in *.png(.N); do
	printf "\\\\n"
	pngcrush -ow "\$png"
done;
printf "\\\\n"
EOM

# Adding content to function file
path_to_function=$ZDOTDIR/.zsh_functions/pngcrush-all
echo "$comments" > $path_to_function
echo "$commands" >> $path_to_function
