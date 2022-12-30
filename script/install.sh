# Updating the .zshrc file to include the MskCmd functions
ZSHRC=~/.zshrc
read -r -d '' ZSHRC_CONTENT << EOM
\n# MskCmd Utilities
\nfpath=(~/.zsh_functions \$fpath);
\nautoload -U \$fpath[1]/*(.:t)
EOM
echo $ZSHRC_CONTENT >> $ZSHRC

# Creating the .zsh_functions directory
ZSH=~/.zsh_functions
mkdir -p $ZSH

# Copying MskCmd function to the .zsh_functions directory
# ./script/jpgcrush-all.sh $0
# ./script/mskcmd.sh $0
# ./script/pngcrush-all.sh $0
# ./script/tally.sh $0
