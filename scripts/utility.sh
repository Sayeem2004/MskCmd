#!/bin/zsh
# $1 = REPO_PATH, $2 = CRATE_PATH, $3 = FUNCTION_PATH, $4 = SCRIPT_PATH

# Printing start message
printf "\e[1;32m"
printf "Configuring Utility Settings...\n"
printf "\e[0m"

# Utility count and path variables
zshrc=$ZDOTDIR/.zshrc
[ -e $zshrc ] || touch $zshrc
let count=0

# Configuring the zshrc file
printf "    Configuring zshrc...\n"
read -r -d '' zshrc_content << EOM
# Sayeem2004's ZSH Customization
EOM

grep -q "$zshrc_content" $zshrc || echo "$zshrc_content" >> $zshrc
grep -q "$zshrc_content" $zshrc && let ++count || printf "    Failed to configure zshrc\n"

# Configuring functions path
printf "    Configuring functions...\n"
read -r -d '' zshrc_content << EOM
fpath=(\$ZDOTDIR/.zsh_functions \$fpath)
autoload -U \$fpath[1]/*(.:t)
EOM

grep -q "$zshrc_content" $zshrc || echo "$zshrc_content" >> $zshrc
grep -q "$zshrc_content" $zshrc && let ++count || printf "    Failed to configure functions\n"

# Configuring tab size
printf "    Configuring tabs...\n"
read -r -d '' zshrc_content << EOM
tabs -4 # Set tab size to 4
EOM

grep -q "$zshrc_content" $zshrc || echo "$zshrc_content" >> $zshrc
grep -q "$zshrc_content" $zshrc && let ++count || printf "    Failed to configure tabs\n"

# Configuring bat theme
printf "    Configuring bat...\n"
read -r -d '' zshrc_content << EOM
export BAT_THEME="Nord"
EOM

grep -q "$zshrc_content" $zshrc || echo "$zshrc_content" >> $zshrc
grep -q "$zshrc_content" $zshrc && let ++count || printf "    Failed to configure bat\n"

# Configuring default python
printf "    Configuring python...\n"
read -r -d '' zshrc_content << EOM
alias python=python3
EOM

grep -q "$zshrc_content" $zshrc || echo "$zshrc_content" >> $zshrc
grep -q "$zshrc_content" $zshrc && let ++count || printf "    Failed to configure python\n"

# Configuring rust installation
printf "    Configuring rust...\n"
read -r -d '' zshrc_content << EOM
export CARGO_HOME=\$HOME/.config/cargo
export RUSTUP_HOME=\$HOME/.config/rustup
EOM

grep -q "$zshrc_content" $zshrc || echo "$zshrc_content" >> $zshrc
rustc -V &> /dev/null || rustup-init -y &> /dev/null
(grep -q "$zshrc_content" $zshrc && rustc -V &> /dev/null && let ++count) \
|| printf "    Failed to install rust\n"

# Configuring less history
printf "    Configuring less...\n"
read -r -d '' zshrc_content << EOM
export LESSHISTFILE=/dev/null
EOM

grep -q "$zshrc_content" $zshrc || echo "$zshrc_content" >> $zshrc
grep -q "$zshrc_content" $zshrc && let ++count || printf "    Failed to configure less\n"

# Configuring sdkman installation
printf "    Configuring sdkman...\n"
read -r -d '' zshrc_content << EOM
export SDKMAN_DIR="/Users/Najmoon/.config/sdkman"
[[ -s "/Users/Najmoon/.config/sdkman/bin/sdkman-init.sh" ]] \\\\
&& source "/Users/Najmoon/.config/sdkman/bin/sdkman-init.sh"
EOM

grep -Fq "$zshrc_content" $zshrc || echo "$zshrc_content" >> $zshrc
export SDKMAN_DIR=$HOME/.config/sdkman
sdk version &> /dev/null || curl -s "https://get.sdkman.io?rcupdate=false" | zsh &> /dev/null

[[ -s "/Users/Najmoon/.config/sdkman/bin/sdkman-init.sh" ]] \
&& source "/Users/Najmoon/.config/sdkman/bin/sdkman-init.sh"
(grep -Fq "$zshrc_content" $zshrc && sdk version &> /dev/null && let ++count) \
|| printf "    Failed to install sdkman\n"
sdk update &> /dev/null

# Configuring java installation
printf "    Configuring java...\n"
java --version &> /dev/null || sdk install java &> /dev/null
java --version &> /dev/null && let ++count || printf "    Failed to install java\n"

# Printing utility count
printf "\e[1;32m"
printf "Configured $count Utilities\n"
printf "\e[0m"
