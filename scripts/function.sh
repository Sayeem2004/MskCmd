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
title "    Writing ZSH Functions..."
printf "    "

# Function count and path variables
zsh_functions=$ZDOTDIR/.zsh_functions
mkdir -p $zsh_functions
let count=0
let valid=0

# Writing sshload
info "Writing sshload..." && $3/sshload.sh $1
[ -e $zsh_functions/sshload ] && let ++valid || err "Failed to write sshload"

# Writing pngcrush-all
info "Writing pngcrush-all..." && $3/pngcrush-all.sh $1
[ -e $zsh_functions/pngcrush-all ] && let ++valid || err "Failed to write pngcrush-all"

# Writing tally
info "Writing tally..." && $3/tally.sh $1
[ -e $zsh_functions/tally ] && let ++valid || err "Failed to write tally"

# Writing jpgcrush-all
info "Writing jpgcrush-all..." && $3/jpgcrush-all.sh $1
[ -e $zsh_functions/jpgcrush-all ] && let ++valid || err "Failed to write jpgcrush-all"

# Writing intsrc
info "Writing intsrc..." && $3/intsrc.sh $1
[ -e $zsh_functions/intsrc ] && let ++valid || err "Failed to write intsrc"

# Writing gview
info "Writing gview..." && $3/gview.sh $1
[ -e $zsh_functions/gview ] && let ++valid || err "Failed to write gview"

# Writing viewpath
info "Writing viewpath..." && $3/viewpath.sh $1
[ -e $zsh_functions/viewpath ] && let ++valid || err "Failed to write viewpath"

# Printing end message
expr $count % $_MAX_ &> /dev/null && printf "\n    "
title "Wrote $valid Functions"
