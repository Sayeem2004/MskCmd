#!/bin/zsh
# $1 = REPO_PATH, $2 = CRATE_PATH, $3 = FUNCTION_PATH, $4 = SCRIPT_PATH

# Defining utility variables
_SIZE_="40"
_PRE_="%-${_SIZE_}s"
_MAX_=$(( ($COLUMNS - 4) / $_SIZE_ ))

# Defining utility functions
red() {printf "\e[1;31m";}
blue() {printf "\e[1;32m";}
no() {printf "\e[0m";}
new() {expr $count % $_MAX_ &> /dev/null || printf "\n    ";}
title() {blue && printf "$1\n" && no}
info() {printf $_PRE_ "$1" && let ++count && new}
err() {red && printf $_PRE_ "$1" && no && let ++count && new}

# Printing start message
title "    Configuring Utility Settings..."
printf "    "

# Utility count and path variables
zshrc=$ZDOTDIR/.zshrc
[ -e $zshrc ] || touch $zshrc
let count=0
let valid=0

# Configuring the zshrc file
info "Configuring zshrc..."
read -r -d '' zshrc_content << EOM
# Sayeem2004's ZSH Customization
EOM

grep -q "$zshrc_content" $zshrc || echo "$zshrc_content" >> $zshrc
grep -q "$zshrc_content" $zshrc && let ++valid || err "Failed to configure zshrc"

# Configuring functions path
info "Configuring functions..."
read -r -d '' zshrc_content << EOM
fpath=(\$ZDOTDIR/.zsh_functions \$fpath)
autoload -U \$fpath[1]/*(.:t)
EOM

grep -q "$zshrc_content" $zshrc || echo "$zshrc_content" >> $zshrc
grep -q "$zshrc_content" $zshrc && let ++valid || err "Failed to configure functions"

# Configuring tab size
info "Configuring tabs..."
read -r -d '' zshrc_content << EOM
tabs -4 # Set tab size to 4
EOM

grep -q "$zshrc_content" $zshrc || echo "$zshrc_content" >> $zshrc
grep -q "$zshrc_content" $zshrc && let ++valid || err "Failed to configure tabs"

# Configuring bat theme
info "Configuring bat..."
read -r -d '' zshrc_content << EOM
export BAT_THEME="Nord"
EOM

grep -q "$zshrc_content" $zshrc || echo "$zshrc_content" >> $zshrc
grep -q "$zshrc_content" $zshrc && let ++valid || err "Failed to configure bat"

# Configuring default python
info "Configuring python..."
read -r -d '' zshrc_content << EOM
alias python=python3.11
EOM

grep -q "$zshrc_content" $zshrc || echo "$zshrc_content" >> $zshrc
grep -q "$zshrc_content" $zshrc && let ++valid || err "Failed to configure python"

# Configuring rust installation
info "Configuring rust..."
read -r -d '' zshrc_content << EOM
export CARGO_HOME=\$HOME/.config/cargo
export RUSTUP_HOME=\$HOME/.config/rustup
EOM

grep -q "$zshrc_content" $zshrc || echo "$zshrc_content" >> $zshrc
rustc -V &> /dev/null || rustup-init -y &> /dev/null
grep -q "$zshrc_content" $zshrc && rustc -V &> /dev/null && let ++valid \
|| err "Failed to install rust"

# Configuring less history
info "Configuring less..."
read -r -d '' zshrc_content << EOM
export LESSHISTFILE=/dev/null
EOM

grep -q "$zshrc_content" $zshrc || echo "$zshrc_content" >> $zshrc
grep -q "$zshrc_content" $zshrc && let ++valid || err "Failed to configure less"

# Configuring sdkman installation
info "Configuring sdkman..."
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
grep -Fq "$zshrc_content" $zshrc && sdk version &> /dev/null && let ++valid \
|| err "Failed to install sdkman"
sdk update &> /dev/null

# Configuring java installation
info "Configuring java..."
java --version &> /dev/null || sdk install java &> /dev/null
java --version &> /dev/null && let ++valid || err "Failed to install java"

# Configuring vim settings
info "Configuring vim..."
read -r -d '' zshrc_content << EOM
export VIMINIT="source \$HOME/.config/vim/.vimrc"
EOM
read -r -d '' vimrc_content << EOM
set viminfo+=n\$HOME/.config/vim/.viminfo
EOM

vimrc=$HOME/.config/vim/.vimrc
[ -e $vimrc ] || (mkdir -p $HOME/.config/vim && touch $vimrc)

grep -q "$zshrc_content" $zshrc || echo "$zshrc_content" >> $zshrc
grep -q "$vimrc_content" $vimrc || echo "$vimrc_content" >> $vimrc
grep -q "$zshrc_content" $zshrc && grep -q "$vimrc_content" $vimrc && let ++valid \
|| err "Failed to configure vim"

# Printing utility count
expr $count % $_MAX_ &> /dev/null && printf "\n    "
title "Configured $valid Utilities"
