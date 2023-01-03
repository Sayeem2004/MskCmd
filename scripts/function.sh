# Author: Sayeem2004
# $1 = REPO_PATH
# $2 = CRATE_PATH
# $3 = FUNCTION_PATH
# $4 = SCRIPT_PATH

# Printing start message
printf "\e[1;32m"
printf "\tWriting ZSH Functions...\n"
printf "\e[0m"

# Updating the .zshrc file
zshrc=$ZDOTDIR/.zshrc
read -r -d '' zshrc_content << EOM
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
let count=0

# Writing functions to the .zsh_functions directory
printf "\t\tWriting intsrc...\n" && $3/intsrc.sh $1
[ -e $zsh_functions/intsrc ] && let ++count || printf "\t\tFailed to write intsrc\n"
printf "\t\tWriting jpgcrush-all...\n" && $3/jpgcrush-all.sh $1
[ -e $zsh_functions/jpgcrush-all ] && let ++count || printf "\t\tFailed to write jpgcrush-all\n"
printf "\t\tWriting pngcrush-all...\n" && $3/pngcrush-all.sh $1
[ -e $zsh_functions/pngcrush-all ] && let ++count || printf "\t\tFailed to write pngcrush-all\n"
printf "\t\tWriting sshload...\n" && $3/sshload.sh $1
[ -e $zsh_functions/sshload ] && let ++count || printf "\t\tFailed to write sshload\n"
printf "\t\tWriting tally...\n" && $3/tally.sh $1
[ -e $zsh_functions/tally ] && let ++count || printf "\t\tFailed to write tally\n"

# Printing end message
printf "\e[1;32m"
printf "\tWrote $count Functions\n"
printf "\e[0m"
