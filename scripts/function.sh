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

# Installing functions to the .zsh_functions directory
printf "\t\tInstalling intsrc...\n" && $3/intsrc.sh $1
[ -e $zsh_functions/intsrc ] && let ++count || printf "\t\tFailed to install intsrc\n"
printf "\t\tInstalling jpgcrush-all...\n" && $3/jpgcrush-all.sh $1
[ -e $zsh_functions/jpgcrush-all ] && let ++count || printf "\t\tFailed to install jpgcrush-all\n"
printf "\t\tInstalling pngcrush-all...\n" && $3/pngcrush-all.sh $1
[ -e $zsh_functions/pngcrush-all ] && let ++count || printf "\t\tFailed to install pngcrush-all\n"
printf "\t\tInstalling sshload...\n" && $3/sshload.sh $1
[ -e $zsh_functions/sshload ] && let ++count || printf "\t\tFailed to install sshload\n"
printf "\t\tInstalling tally...\n" && $3/tally.sh $1
[ -e $zsh_functions/tally ] && let ++count || printf "\t\tFailed to install tally\n"

# Printing end message
printf "\e[1;32m"
printf "\tWrote $count Functions\n"
printf "\e[0m"
