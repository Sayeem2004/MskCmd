# Updating the .zshrc file
ZSHRC=~/.zshrc

read -r -d '' ZSHRC_CONTENT << EOM
# MskCmd Utilities
fpath=(~/.msk_cmd \$fpath)
autoload -U \$fpath[1]/*(.:t)
EOM

if grep -q "$ZSHRC_CONTENT" $ZSHRC; then
    sed -i '' "/# MskCmd Utilities/,+2 d" $ZSHRC
fi

# Deleting the .msk_cmd directory
ZSH=~/.msk_cmd
rm -rf $ZSH
