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
export CARGO_HOME=\$HOME/.cache/cargo
export RUSTUP_HOME=\$HOME/.cache/rustup
EOM

grep -q "$zshrc_content" $zshrc || echo "$zshrc_content" >> $zshrc
rustc -V &> /dev/null || rustup-init -y &> /dev/null
grep -q "$zshrc_content" $zshrc && rustc -V &> /dev/null && let ++valid \
|| err "Failed to configure rust"

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
export SDKMAN_DIR="/Users/Najmoon/.cache/sdkman"
[[ -s "/Users/Najmoon/.cache/sdkman/bin/sdkman-init.sh" ]] \\\\
&& source "/Users/Najmoon/.cache/sdkman/bin/sdkman-init.sh"
EOM

grep -Fq "$zshrc_content" $zshrc || echo "$zshrc_content" >> $zshrc
export SDKMAN_DIR=$HOME/.cache/sdkman
sdk version &> /dev/null || curl -s "https://get.sdkman.io?rcupdate=false" | zsh &> /dev/null

[[ -s "/Users/Najmoon/.cache/sdkman/bin/sdkman-init.sh" ]] \
&& source "/Users/Najmoon/.cache/sdkman/bin/sdkman-init.sh"
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

# Configuring npm settings
info "Configuring npm..."
npm_cache=$HOME/.config/npm
npm_config=$HOME/.config/npm/.npmrc

[[ $(npm config get cache) == $npm_cache ]] || npm config set cache $npm_cache --global
[[ $(npm config get userconfig) == $npm_config ]] || npm config set userconfig $npm_config --global
[ -d $HOME/.config/npm/_logs ] && let ++valid || err "Failed to configure npm"

# Configuring node settings
info "Configuring node..."
read -r -d '' zshrc_content << EOM
export NODE_REPL_HISTORY=\$HOME/.config/node/.node_repl_history
EOM

node_repl_history=$HOME/.config/node/.node_repl_history
[ -e $node_repl_history ] || (mkdir -p $HOME/.config/node && touch $node_repl_history)
grep -q "$zshrc_content" $zshrc || echo "$zshrc_content" >> $zshrc
grep -q "$zshrc_content" $zshrc && let ++valid || err "Failed to configure node"

# Configuring http-server
info "Configuring http-server..."
http-server -v &> /dev/null || npm install -g http-server &> /dev/null
http-server -v &> /dev/null && let ++valid || err "Failed to install http-server"

# # Configuring opam
# info "Configuring opam..."
# read -r -d '' zshrc_content << EOM
# [[ ! -r /Users/Najmoon/.cache/opam/opam-init/init.zsh ]] \\\\
# || source /Users/Najmoon/.cache/opam/opam-init/init.zsh &> /dev/null
# EOM

# grep -Fq "$zshrc_content" $zshrc || echo "$zshrc_content" >> $zshrc


# Printing utility count
expr $count % $_MAX_ &> /dev/null && printf "\n    "
title "Configured $valid Utilities"
