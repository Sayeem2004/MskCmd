# Updating the .zshrc file
ZSHRC=~/.zshrc

read -r -d '' ZSHRC_CONTENT << EOM
# MskCmd Utilities
fpath=(~/.msk_cmd \$fpath)
autoload -U \$fpath[1]/*(.:t)
EOM

if ! grep -q "$ZSHRC_CONTENT" $ZSHRC; then
    echo "$ZSHRC_CONTENT" >> $ZSHRC
fi

# Creating the .msk_cmd directory
ZSH=~/.msk_cmd
mkdir -p $ZSH

# Installing MskCmd functions to the .zsh_functions directory
$1/functions/intsrc.sh $1
$1/functions/jpgcrush-all.sh $1
$1/functions/mskcmd.sh $1
$1/functions/pngcrush-all.sh $1
$1/functions/sshload.sh $1
$1/functions/tally.sh $1
