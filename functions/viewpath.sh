#!/bin/zsh

# File content
read -r -d '' function_comments << EOM
# Prettily prints the PATH environment variable.
EOM

read -r -d '' function_commands << EOM
tr ':' '\\\\n' <<< \$PATH | awk '{printf "%02s: %s\\\\n", NR, \$0}'
EOM

# Adding content to function file
path_to_function=$ZDOTDIR/.zsh_functions/viewpath
echo "$function_comments" > $path_to_function
echo "$function_commands" >> $path_to_function
