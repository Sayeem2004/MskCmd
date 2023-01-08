# $1 = REPO_PATH
# $2 = CRATE_PATH
# $3 = FUNCTION_PATH
# $4 = SCRIPT_PATH

# Printing start message
printf "\e[1;32m"
printf "Configuring Utility Settings...\n"
printf "\e[0m"

# Utility count and path variables
zshrc=$ZDOTDIR/.zshrc
let count=0

# Configuring the zshrc file
printf "\tConfiguring zshrc...\n"
if [ ! -e $zshrc ]; then
    touch $zshrc
fi
read -r -d '' zshrc_content << EOM
# Sayeem2004's ZSH Customization
EOM
if ! grep -q "$zshrc_content" $zshrc; then
    echo "$zshrc_content" >> $zshrc
fi
if grep -q "$zshrc_content" $zshrc; then
    let ++count
else
    printf "\tFailed to configure zshrc\n"
fi

# Configuring functions path
printf "\tConfiguring functions...\n"
read -r -d '' zshrc_content << EOM
fpath=(\$ZDOTDIR/.zsh_functions \$fpath)
autoload -U \$fpath[1]/*(.:t)
EOM
if ! grep -q "$zshrc_content" $zshrc; then
    echo "$zshrc_content" >> $zshrc
fi
if grep -q "$zshrc_content" $zshrc; then
    let ++count
else
    printf "\tFailed to configure functions\n"
fi

# Configuring tab size
printf "\tConfiguring tabs...\n"
read -r -d '' zshrc_content << EOM
tabs -4 # Set tab size to 4
EOM
if ! grep -q "$zshrc_content" $zshrc; then
    echo "$zshrc_content" >> $zshrc
fi
if grep -q "$zshrc_content" $zshrc; then
    let ++count
else
    printf "\tFailed to configure tabs\n"
fi

# Configuring bat theme
printf "\tConfiguring bat...\n"
read -r -d '' zshrc_content << EOM
export BAT_THEME="Nord"
EOM
if ! grep -q "$zshrc_content" $zshrc; then
    echo "$zshrc_content" >> $zshrc
fi
if grep -q "$zshrc_content" $zshrc; then
    let ++count
else
    printf "\tFailed to configure bat\n"
fi

# Configuring default python
printf "\tConfiguring python...\n"
read -r -d '' zshrc_content << EOM
alias python=python3
EOM
if ! grep -q "$zshrc_content" $zshrc; then
    echo "$zshrc_content" >> $zshrc
fi
if grep -q "$zshrc_content" $zshrc; then
    let ++count
else
    printf "\tFailed to configure python\n"
fi

# Printing utility count
printf "\e[1;32m"
printf "Configured $count Utilities\n"
printf "\e[0m"
