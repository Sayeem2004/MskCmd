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
title "    Installing Brew Packages..."
printf "    "

# Installing homebrew.
brew -v &> /dev/null || /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Variable declarations
cellar=$(brew --cellar)
caskroom=$(brew --caskroom)
let valid=0
let count=0

# Installing gcc
info "Installing cmake..."
test -d $cellar/cmake || brew install cmake &> /dev/null
test -d $cellar/cmake && let ++valid || err "Failed to install cmake"

info "Installing lz4..."
test -d $cellar/lz4 || brew install lz4 &> /dev/null
test -d $cellar/lz4 && let ++valid || err "Failed to install lz4"

info "Installing texinfo..."
test -d $cellar/texinfo || brew install texinfo &> /dev/null
test -d $cellar/texinfo && let ++valid || err "Failed to install texinfo"

info "Installing xz..."
test -d $cellar/xz || brew install xz &> /dev/null
test -d $cellar/xz && let ++valid || err "Failed to install xz"

info "Installing gmp..."
test -d $cellar/gmp || brew install gmp &> /dev/null
test -d $cellar/gmp && let ++valid || err "Failed to install gmp"

info "Installing isl..."
test -d $cellar/isl || brew install isl &> /dev/null
test -d $cellar/isl && let ++valid || err "Failed to install isl"

info "Installing libmpc..."
test -d $cellar/libmpc || brew install libmpc &> /dev/null
test -d $cellar/libmpc && let ++valid || err "Failed to install libmpc"

info "Installing mpfr..."
test -d $cellar/mpfr || brew install mpfr &> /dev/null
test -d $cellar/mpfr && let ++valid || err "Failed to install mpfr"

info "Installing zstd..."
test -d $cellar/zstd || brew install zstd &> /dev/null
test -d $cellar/zstd && let ++valid || err "Failed to install zstd"

info "Installing gcc..."
test -d $cellar/gcc || brew install gcc &> /dev/null
test -d $cellar/gcc && let ++valid || err "Failed to install gcc"

# Installing jpegoptim
info "Installing jpeg-turbo..."
test -d $cellar/jpeg-turbo || brew install jpeg-turbo &> /dev/null
test -d $cellar/jpeg-turbo && let ++valid || err "Failed to install jpeg-turbo"

info "Installing jpegoptim..."
test -d $cellar/jpegoptim || brew install jpegoptim &> /dev/null
test -d $cellar/jpegoptim && let ++valid || err "Failed to install jpegoptim"

# Installing pngcrush
info "Installing pngcrush..."
test -d $cellar/pngcrush || brew install pngcrush &> /dev/null
test -d $cellar/pngcrush && let ++valid || err "Failed to install pngcrush"

# Installing tree
info "Installing tree..."
test -d $cellar/tree || brew install tree &> /dev/null
test -d $cellar/tree && let ++valid || err "Failed to install tree"

# Installing python
info "Installing ca-certificates..."
test -d $cellar/ca-certificates || brew install ca-certificates &> /dev/null
test -d $cellar/ca-certificates && let ++valid || err "Failed to install ca-certificates"

info "Installing gdbm..."
test -d $cellar/gdbm || brew install gdbm &> /dev/null
test -d $cellar/gdbm && let ++valid || err "Failed to install gdbm"

info "Installing mpdecimal..."
test -d $cellar/mpdecimal || brew install mpdecimal &> /dev/null
test -d $cellar/mpdecimal && let ++valid || err "Failed to install mpdecimal"

info "Installing openssl@1.1..."
test -d $cellar/openssl@1.1 || brew install openssel@1.1 &> /dev/null
test -d $cellar/openssl@1.1 && let ++valid || err "Failed to install openssl@1.1"

info "Installing pkg-config..."
test -d $cellar/pkg-config || brew install pkg-config &> /dev/null
test -d $cellar/pkg-config && let ++valid || err "Failed to install pkg-config"

info "Installing readline..."
test -d $cellar/readline || brew install readline &> /dev/null
test -d $cellar/readline && let ++valid || err "Failed to install readline"

info "Installing sqlite..."
test -d $cellar/sqlite || brew install sqlite &> /dev/null
test -d $cellar/sqlite && let ++valid || err "Failed to install sqlite"

info "Installing python@3.11..."
test -d $cellar/python@3.11 || brew install python@3.11 &> /dev/null
test -d $cellar/python@3.11 && let ++valid || err "Failed to install python@3.11"

# Installing bat
info "Installing bat..."
test -d $cellar/bat || brew install bat &> /dev/null
test -d $cellar/bat && let ++valid || err "Failed to install bat"

# Installing tealdeer
info "Installing tealdeer..."
test -d $cellar/tealdeer || brew install tealdeer &> /dev/null
test -d $cellar/tealdeer && let ++valid || err "Failed to install tealdeer"

# Installing rustup-init
info "Installing rustup-init..."
test -d $cellar/rustup-init || brew install rustup-init &> /dev/null
test -d $cellar/rustup-init && let ++valid || err "Failed to install rustup-init"

# Installing node
info "Installing brotli..."
test -d $cellar/brotli || brew install brotli &> /dev/null
test -d $cellar/brotli && let ++valid || err "Failed to install brotli"

info "Installing c-ares..."
test -d $cellar/c-ares || brew install c-ares &> /dev/null
test -d $cellar/c-ares && let ++valid || err "Failed to install c-ares"

info "Installing icu4c..."
test -d $cellar/icu4c || brew install icu4c &> /dev/null
test -d $cellar/icu4c && let ++valid || err "Failed to install icu4c"

info "Installing libnghttp2..."
test -d $cellar/libnghttp2 || brew install libnghttp2 &> /dev/null
test -d $cellar/libnghttp2 && let ++valid || err "Failed to install libnghttp2"

info "Installing m4..."
test -d $cellar/m4 || brew install m4 &> /dev/null
test -d $cellar/m4 && let ++valid || err "Failed to install m4"

info "Installing autoconf..."
test -d $cellar/autoconf || brew install autoconf &> /dev/null
test -d $cellar/autoconf && let ++valid || err "Failed to install autoconf"

info "Installing automake..."
test -d $cellar/automake || brew install automake &> /dev/null
test -d $cellar/automake && let ++valid || err "Failed to install automake"

info "Installing libtool..."
test -d $cellar/libtool || brew install libtool &> /dev/null
test -d $cellar/libtool && let ++valid || err "Failed to install libtool"

info "Installing docutils..."
test -d $cellar/docutils || brew install docutils &> /dev/null
test -d $cellar/docutils && let ++valid || err "Failed to install docutils"

info "Installing python@3.10..."
test -d $cellar/python@3.10 || brew install python@3.10 &> /dev/null
test -d $cellar/python@3.10 && let ++valid || err "Failed to install python@3.10"

info "Installing pygments..."
test -d $cellar/pygments || brew install pygments &> /dev/null
test -d $cellar/pygments && let ++valid || err "Failed to install pygments"

info "Installing sphinx-doc..."
test -d $cellar/sphinx-doc || brew install sphinx-doc &> /dev/null
test -d $cellar/sphinx-doc && let ++valid || err "Failed to install sphinx-doc"

info "Installing libuv..."
test -d $cellar/libuv || brew install libuv &> /dev/null
test -d $cellar/libuv && let ++valid || err "Failed to install libuv"

info "Installing node..."
test -d $cellar/node || brew install node &> /dev/null
test -d $cellar/node && let ++valid || err "Failed to install node"

# Installing ruby
info "Installing bison..."
test -d $cellar/bison || brew install bison &> /dev/null
test -d $cellar/bison && let ++valid || err "Failed to install bison"

info "Installing libffi..."
test -d $cellar/libffi || brew install libffi &> /dev/null
test -d $cellar/libffi && let ++valid || err "Failed to install libffi"

info "Installing libyaml..."
test -d $cellar/libyaml || brew install libyaml &> /dev/null
test -d $cellar/libyaml && let ++valid || err "Failed to install libyaml"

info "Installing ruby-install..."
test -d $cellar/ruby-install || brew install ruby-install &> /dev/null
test -d $cellar/ruby-install && let ++valid || err "Failed to install ruby-install"

# Performing cleanup commands
brew update &> /dev/null
brew cleanup &> /dev/null

# Printing end message
expr $count % $_MAX_ &> /dev/null && printf "\n    "
title "Installed $valid Packages"
