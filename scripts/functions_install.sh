# Updating the .zshrc file
zshrc=~/.zshrc

read -r -d '' zshrc_content << EOM
# MskCmd Utilities
fpath=(~/.msk_cmd \$fpath)
autoload -U \$fpath[1]/*(.:t)
EOM

if ! grep -q "$zshrc_content" $zshrc; then
    echo "$zshrc_content" >> $zshrc
fi

# Creating the .msk_cmd directory
zsh=~/.msk_cmd
mkdir -p $zsh

# Installing MskCmd functions to the .zsh_functions directory
echo "    functions/intsrc.sh" && $1/functions/intsrc.sh $1
echo "    functions/jpgcrush-all.sh" && $1/functions/jpgcrush-all.sh $1
echo "    functions/pngcrush-all.sh" && $1/functions/pngcrush-all.sh $1
echo "    functions/sshload.sh" && $1/functions/sshload.sh $1
echo "    functions/tally.sh" && $1/functions/tally.sh $1
