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
info "Configuring zshrc1..."
read -r -d '' zshrc_content << EOM
# Start Of Sayeem2004's ZSH Customization --------------------------------------
EOM

grep -q "$zshrc_content" $zshrc || echo "$zshrc_content\n" >> $zshrc
grep -q "$zshrc_content" $zshrc && let ++valid || err "Failed to configure zshrc1"

# Configuring functions path
info "Configuring functions..."
read -r -d '' zshrc_content << EOM
# Configuring functions
fpath=(\$ZDOTDIR/.zsh_functions \$fpath)
autoload -U \$fpath[1]/*(.:t)
EOM

grep -q "$zshrc_content" $zshrc || echo "$zshrc_content\n" >> $zshrc
grep -q "$zshrc_content" $zshrc && let ++valid || err "Failed to configure functions"

# Configuring tab size
info "Configuring tabs..."
read -r -d '' zshrc_content << EOM
# Configuring tabs
tabs -4
EOM

grep -q "$zshrc_content" $zshrc || echo "$zshrc_content\n" >> $zshrc
grep -q "$zshrc_content" $zshrc && let ++valid || err "Failed to configure tabs"

# Configuring bat theme
info "Configuring bat..."
read -r -d '' zshrc_content << EOM
# Configuring bat
export BAT_THEME="Nord"
EOM

grep -q "$zshrc_content" $zshrc || echo "$zshrc_content\n" >> $zshrc
grep -q "$zshrc_content" $zshrc && let ++valid || err "Failed to configure bat"

# Configuring default python
info "Configuring python..."
read -r -d '' zshrc_content << EOM
# Configuring python
alias python=python3.11
EOM

grep -q "$zshrc_content" $zshrc || echo "$zshrc_content\n" >> $zshrc
grep -q "$zshrc_content" $zshrc && let ++valid || err "Failed to configure python"

# Configuring rust installation
info "Configuring rust..."
read -r -d '' zshrc_content << EOM
# Configuring rust
export CARGO_HOME=\$HOME/.cache/cargo
export RUSTUP_HOME=\$HOME/.cache/rustup
EOM

grep -q "$zshrc_content" $zshrc || echo "$zshrc_content\n" >> $zshrc
rustc -V &> /dev/null || rustup-init -y &> /dev/null
grep -q "$zshrc_content" $zshrc && rustc -V &> /dev/null && let ++valid \
|| err "Failed to configure rust"

# Configuring less history
info "Configuring less..."
read -r -d '' zshrc_content << EOM
# Configuring less
export LESSHISTFILE=/dev/null
EOM

grep -q "$zshrc_content" $zshrc || echo "$zshrc_content\n" >> $zshrc
grep -q "$zshrc_content" $zshrc && let ++valid || err "Failed to configure less"

# Configuring sdkman installation
info "Configuring sdkman..."
read -r -d '' zshrc_content << EOM
# Configuring sdkman
export SDKMAN_DIR="/Users/Najmoon/.cache/sdkman"
[[ -s "/Users/Najmoon/.cache/sdkman/bin/sdkman-init.sh" ]] \\\\
&& source "/Users/Najmoon/.cache/sdkman/bin/sdkman-init.sh"
EOM

grep -Fq "$zshrc_content" $zshrc || echo "$zshrc_content\n" >> $zshrc
export SDKMAN_DIR=$HOME/.cache/sdkman
sdk version &> /dev/null || curl -s "https://get.sdkman.io?rcupdate=false" | zsh &> /dev/null

[[ -s "/Users/Najmoon/.cache/sdkman/bin/sdkman-init.sh" ]] \
&& source "/Users/Najmoon/.cache/sdkman/bin/sdkman-init.sh"
grep -Fq "$zshrc_content" $zshrc && sdk version &> /dev/null && let ++valid \
|| err "Failed to configure sdkman"
sdk update &> /dev/null

# Configuring java installation
info "Configuring java..."
java --version &> /dev/null || sdk install java &> /dev/null
java --version &> /dev/null && let ++valid || err "Failed to configure java"

# Configuring vim settings
info "Configuring vim..."
read -r -d '' zshrc_content << EOM
# Configuring vim
export VIMINIT="source \$HOME/.config/vim/.vimrc"
EOM
read -r -d '' vimrc_content << EOM
set viminfo+=n\$HOME/.config/vim/.viminfo
EOM

vimrc=$HOME/.config/vim/.vimrc
[ -e $vimrc ] || (mkdir -p $HOME/.config/vim && touch $vimrc)

grep -q "$zshrc_content" $zshrc || echo "$zshrc_content\n" >> $zshrc
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
# Configuring node
export NODE_REPL_HISTORY=\$HOME/.config/node/.node_repl_history
EOM

node_repl_history=$HOME/.config/node/.node_repl_history
[ -e $node_repl_history ] || (mkdir -p $HOME/.config/node && touch $node_repl_history)
grep -q "$zshrc_content" $zshrc || echo "$zshrc_content\n" >> $zshrc
grep -q "$zshrc_content" $zshrc && let ++valid || err "Failed to configure node"

# Configuring http-server
info "Configuring http-server..."
http-server -v &> /dev/null || npm install -g http-server &> /dev/null
http-server -v &> /dev/null && let ++valid || err "Failed to configure http-server"

# Configuring ruby
info "Configuring ruby..."
read -r -d '' zshrc_content << EOM
# Configuring ruby
export GEM_HOME=\$HOME/.cache/rubies/ruby-3.2.0/lib/ruby/gems/3.2.0
export GEM_PATH=\$HOME/.cache/rubies/ruby-3.2.0/lib/ruby/gems/3.2.0
export RUBY_ROOT=\$HOME/.cache/rubies/ruby-3.2.0
export PATH=\$GEM_PATH/bin:\$RUBY_ROOT/bin:\$PATH
EOM

export GEM_HOME=$HOME/.cache/rubies/ruby-3.2.0/lib/ruby/gems/3.2.0
export GEM_PATH=$HOME/.cache/rubies/ruby-3.2.0/lib/ruby/gems/3.2.0
export RUBY_ROOT=$HOME/.cache/rubies/ruby-3.2.0
export PATH=$GEM_PATH/bin:$RUBY_ROOT/bin:$PATH

grep -q "$zshrc_content" $zshrc || echo "$zshrc_content\n" >> $zshrc
ruby -v | grep -q "ruby 3.2.0" || ruby-install ruby 3.2.0 -r $HOME/.cache/rubies &> /dev/null

grep -q "$zshrc_content" $zshrc && ruby -v | grep -q "ruby 3.2.0" && let ++valid \
|| err "Failed to configure ruby"

# Configuring gems
info "Configuring jekyll..."
jekyll -v &> /dev/null || gem install jekyll &> /dev/null
jekyll -v &> /dev/null && let ++valid || err "Failed to configure jekyll"

# Printing closing line
info "Configuring zshrc2..."
read -r -d '' zshrc_content << EOM
# End Of Sayeem2004's ZSH Customization ----------------------------------------
EOM
grep -q "$zshrc_content" $zshrc || echo "$zshrc_content\n" >> $zshrc
grep -q "$zshrc_content" $zshrc && let ++valid || err "Failed to configure zshrc2"

# Printing utility count
expr $count % $_MAX_ &> /dev/null && printf "\n    "
title "Configured $valid Utilities"
