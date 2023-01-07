# $1 = REPO_PATH
# $2 = CRATE_PATH
# $3 = FUNCTION_PATH
# $4 = SCRIPT_PATH

# Printing start message
printf "\e[1;32m"
printf "Configuring Utility Settings...\n"
printf "\e[0m"

# Utility count
let count=0

# Setting tab size to 4
zshrc=$ZDOTDIR/.zshrc
printf "\tConfiguring tabs...\n"
read -r -d '' zshrc_content << EOM
tabs -4
EOM
if ! grep -q "$zshrc_content" $zshrc; then
    echo "$zshrc_content" >> $zshrc
fi
if grep -q "$zshrc_content" $zshrc; then
    let ++count
else
    printf "\tFailed to configure tabs\n"
fi

# Setting bat theme
zshrc=$ZDOTDIR/.zshrc
printf "\tConfiguring bat...\n"
read -r -d '' zshrc_content << EOM
# Sayeem2004's ZSH Customization
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

# Printing utility count
printf "\e[1;32m"
printf "Configured $count Utilities\n"
printf "\e[0m"
