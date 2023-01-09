#!/bin/zsh
# $1 = REPO_PATH, $2 = CRATE_PATH, $3 = FUNCTION_PATH, $4 = SCRIPT_PATH

# Printing start message
printf "\e[1;32m"
printf "Installing Brew Packages...\n"
printf "\e[0m"

# Installing homebrew.
brew -v &> /dev/null || /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Package count and path variables
cellar=$(brew --cellar)
caskroom=$(brew --caskroom)
let count=0

# Installing gcc
printf "    Installing cmake...\n"
test -d $cellar/cmake || brew install cmake &> /dev/null
test -d $cellar/cmake && let ++count || printf "    Failed to install cmake\n"
printf "    Installing lz4...\n"
test -d $cellar/lz4 || brew install lz4 &> /dev/null
test -d $cellar/lz4 && let ++count || printf "    Failed to install lz4\n"
printf "    Installing texinfo...\n"
test -d $cellar/texinfo || brew install texinfo &> /dev/null
test -d $cellar/texinfo && let ++count || printf "    Failed to install texinfo\n"
printf "    Installing xz...\n"
test -d $cellar/xz || brew install xz &> /dev/null
test -d $cellar/xz && let ++count || printf "    Failed to install xz\n"
printf "    Installing gmp...\n"
test -d $cellar/gmp || brew install gmp &> /dev/null
test -d $cellar/gmp && let ++count || printf "    Failed to install gmp\n"
printf "    Installing isl...\n"
test -d $cellar/isl || brew install isl &> /dev/null
test -d $cellar/isl && let ++count || printf "    Failed to install isl\n"
printf "    Installing libmpc...\n"
test -d $cellar/libmpc || brew install libmpc &> /dev/null
test -d $cellar/libmpc && let ++count || printf "    Failed to install libmpc\n"
printf "    Installing mpfr...\n"
test -d $cellar/mpfr || brew install mpfr &> /dev/null
test -d $cellar/mpfr && let ++count || printf "    Failed to install mpfr\n"
printf "    Installing zstd...\n"
test -d $cellar/zstd || brew install zstd &> /dev/null
test -d $cellar/zstd && let ++count || printf "    Failed to install zstd\n"
printf "    Installing gcc...\n"
test -d $cellar/gcc || brew install gcc &> /dev/null
test -d $cellar/gcc && let ++count || printf "    Failed to install gcc\n"

# Installing jpegoptim
printf "    Installing jpeg-turbo...\n"
test -d $cellar/jpeg-turbo || brew install jpeg-turbo &> /dev/null
test -d $cellar/jpeg-turbo && let ++count || printf "    Failed to install jpeg-turbo\n"
printf "    Installing jpegoptim...\n"
test -d $cellar/jpegoptim || brew install jpegoptim &> /dev/null
test -d $cellar/jpegoptim && let ++count || printf "    Failed to install jpegoptim\n"

# Installing pngcrush
printf "    Installing pngcrush...\n"
test -d $cellar/pngcrush || brew install pngcrush &> /dev/null
test -d $cellar/pngcrush && let ++count || printf "    Failed to install pngcrush\n"

# Installing tree
printf "    Installing tree...\n"
test -d $cellar/tree || brew install tree &> /dev/null
test -d $cellar/tree && let ++count || printf "    Failed to install tree\n"

# Installing python
printf "    Installing ca-certificates...\n"
test -d $cellar/ca-certificates || brew install ca-certificates &> /dev/null
test -d $cellar/ca-certificates && let ++count || printf "    Failed to install ca-certificates\n"
printf "    Installing gdbm...\n"
test -d $cellar/gdbm || brew install gdbm &> /dev/null
test -d $cellar/gdbm && let ++count || printf "    Failed to install gdbm\n"
printf "    Installing mpdecimal...\n"
test -d $cellar/mpdecimal || brew install mpdecimal &> /dev/null
test -d $cellar/mpdecimal && let ++count || printf "    Failed to install mpdecimal\n"
printf "    Installing openssl@1.1...\n"
test -d $cellar/openssl@1.1 || brew install openssl@1.1 &> /dev/null
test -d $cellar/openssl@1.1 && let ++count || printf "    Failed to install openssl@1.1\n"
printf "    Installing pkg-config...\n"
test -d $cellar/pkg-config || brew install pkg-config &> /dev/null
test -d $cellar/pkg-config && let ++count || printf "    Failed to install pkg-config\n"
printf "    Installing readline...\n"
test -d $cellar/readline || brew install readline &> /dev/null
test -d $cellar/readline && let ++count || printf "    Failed to install readline\n"
printf "    Installing sqlite...\n"
test -d $cellar/sqlite || brew install sqlite &> /dev/null
test -d $cellar/sqlite && let ++count || printf "    Failed to install sqlite\n"
printf "    Installing python@3.10...\n"
test -d $cellar/python@3.10 || brew install python@3.10 &> /dev/null
test -d $cellar/python@3.10 && let ++count || printf "    Failed to install python@3.10\n"

# Installing bat
printf "    Installing bat...\n"
test -d $cellar/bat || brew install bat &> /dev/null
test -d $cellar/bat && let ++count || printf "    Failed to install bat\n"

# Installing tealdeer
printf "    Installing tealdeer...\n"
test -d $cellar/tealdeer || brew install tealdeer &> /dev/null
test -d $cellar/tealdeer && let ++count || printf "    Failed to install tealdeer\n"

# Performing cleanup commands
brew update &> /dev/null
brew upgrade &> /dev/null
brew cleanup &> /dev/null

# Printing end message
printf "\e[1;32m"
printf "Installed $count Packages\n"
printf "\e[0m"
