# Author: Sayeem2004

# Updating the .zshrc file
zshrc=$ZDOTDIR/.zshrc

read -r -d '' zshrc_content << EOM
# MskCmd Utilities
fpath=(\$ZDOTDIR/.zsh_functions \$fpath)
autoload -U \$fpath[1]/*(.:t)
EOM

if ! grep -q "$zshrc_content" $zshrc; then
    echo "$zshrc_content" >> $zshrc
fi

# Creating the .zsh_functions directory
zsh_functions=$ZDOTDIR/.zsh_functions
mkdir -p $zsh_functions

# Function counter
count=0

# Installing functions to the .zsh_functions directory
echo "    Installing intsrc..." && $1/functions/intsrc.sh $1
[ -e $zsh_functions/intsrc ] && let ++count || echo "    Failed to install intsrc"

echo "    Installing jpgcrush-all..." && $1/functions/jpgcrush-all.sh $1
[ -e $zsh_functions/jpgcrush-all ] && let ++count || echo "    Failed to install jpgcrush-all"

echo "    Installing pngcrush-all..." && $1/functions/pngcrush-all.sh $1
[ -e $zsh_functions/pngcrush-all ] && let ++count || echo "    Failed to install pngcrush-all"

echo "    Installing sshload..." && $1/functions/sshload.sh $1
[ -e $zsh_functions/sshload ] && let ++count || echo "    Failed to install sshload"

echo "    Installing tally..." && $1/functions/tally.sh $1
[ -e $zsh_functions/tally ] && let ++count || echo "    Failed to install tally"

# Printing function count
echo "    Installed $count functions"
