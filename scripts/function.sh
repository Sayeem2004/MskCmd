# $1 = REPO_PATH
# $2 = CRATE_PATH
# $3 = FUNCTION_PATH
# $4 = SCRIPT_PATH

# Printing start message
printf "\e[1;32m"
printf "Writing ZSH Functions...\n"
printf "\e[0m"

# Function count and path variables
zsh_functions=$ZDOTDIR/.zsh_functions
mkdir -p $zsh_functions
let count=0

# Writing sshload
printf "\tWriting sshload...\n" && $3/sshload.sh $1
[ -e $zsh_functions/sshload ] && let ++count || printf "\tFailed to write sshload\n"

# Writing pngcrush-all
printf "\tWriting pngcrush-all...\n" && $3/pngcrush-all.sh $1
[ -e $zsh_functions/pngcrush-all ] && let ++count || printf "\tFailed to write pngcrush-all\n"

# Writing tally
printf "\tWriting tally...\n" && $3/tally.sh $1
[ -e $zsh_functions/tally ] && let ++count || printf "\tFailed to write tally\n"

# Writing jpgcrush-all
printf "\tWriting jpgcrush-all...\n" && $3/jpgcrush-all.sh $1
[ -e $zsh_functions/jpgcrush-all ] && let ++count || printf "\tFailed to write jpgcrush-all\n"

# Writing intsrc
printf "\tWriting intsrc...\n" && $3/intsrc.sh $1
[ -e $zsh_functions/intsrc ] && let ++count || printf "\tFailed to write intsrc\n"

# Writing gview
printf "\tWriting gview...\n" && $3/gview.sh $1
[ -e $zsh_functions/gview ] && let ++count || printf "\tFailed to write gview\n"

# Printing end message
printf "\e[1;32m"
printf "Wrote $count Functions\n"
printf "\e[0m"
