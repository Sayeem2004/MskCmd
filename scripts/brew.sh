# $1 = REPO_PATH
# $2 = CRATE_PATH
# $3 = FUNCTION_PATH
# $4 = SCRIPT_PATH

# Printing start message
printf "\e[1;32m"
printf "Installing Brew Packages...\n"
printf "\e[0m"

# Installing homebrew.
if ! brew -v &> /dev/null; then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# Package count and path variables
cellar=$(brew --cellar)
caskroom=$(brew --caskroom)
let count=0

# Installing bat
printf "\tInstalling bat...\n"
test -d $cellar/bat || brew install bat &> /dev/null
test -d $cellar/bat && let ++count || printf "\tFailed to install bat\n"

# Installing gcc
printf "\tInstalling cmake...\n"
test -d $cellar/cmake || brew install cmake &> /dev/null
test -d $cellar/cmake && let ++count || printf "\tFailed to install cmake\n"
printf "\tInstalling lz4...\n"
test -d $cellar/lz4 || brew install lz4 &> /dev/null
test -d $cellar/lz4 && let ++count || printf "\tFailed to install lz4\n"
printf "\tInstalling texinfo...\n"
test -d $cellar/texinfo || brew install texinfo &> /dev/null
test -d $cellar/texinfo && let ++count || printf "\tFailed to install texinfo\n"
printf "\tInstalling xz...\n"
test -d $cellar/xz || brew install xz &> /dev/null
test -d $cellar/xz && let ++count || printf "\tFailed to install xz\n"
printf "\tInstalling gmp...\n"
test -d $cellar/gmp || brew install gmp &> /dev/null
test -d $cellar/gmp && let ++count || printf "\tFailed to install gmp\n"
printf "\tInstalling isl...\n"
test -d $cellar/isl || brew install isl &> /dev/null
test -d $cellar/isl && let ++count || printf "\tFailed to install isl\n"
printf "\tInstalling libmpc...\n"
test -d $cellar/libmpc || brew install libmpc &> /dev/null
test -d $cellar/libmpc && let ++count || printf "\tFailed to install libmpc\n"
printf "\tInstalling mpfr...\n"
test -d $cellar/mpfr || brew install mpfr &> /dev/null
test -d $cellar/mpfr && let ++count || printf "\tFailed to install mpfr\n"
printf "\tInstalling zstd...\n"
test -d $cellar/zstd || brew install zstd &> /dev/null
test -d $cellar/zstd && let ++count || printf "\tFailed to install zstd\n"
printf "\tInstalling gcc...\n"
test -d $cellar/gcc || brew install gcc &> /dev/null
test -d $cellar/gcc && let ++count || printf "\tFailed to install gcc\n"

# Installing jpegoptim
printf "\tInstalling jpeg-turbo...\n"
test -d $cellar/jpeg-turbo || brew install jpeg-turbo &> /dev/null
test -d $cellar/jpeg-turbo && let ++count || printf "\tFailed to install jpeg-turbo\n"
printf "\tInstalling jpegoptim...\n"
test -d $cellar/jpegoptim || brew install jpegoptim &> /dev/null
test -d $cellar/jpegoptim && let ++count || printf "\tFailed to install jpegoptim\n"

# Installing pngcrush
printf "\tInstalling pngcrush...\n"
test -d $cellar/pngcrush || brew install pngcrush &> /dev/null
test -d $cellar/pngcrush && let ++count || printf "\tFailed to install pngcrush\n"

# Installing python
printf "\tInstalling ca-certificates...\n"
test -d $cellar/ca-certificates || brew install ca-certificates &> /dev/null
test -d $cellar/ca-certificates && let ++count || printf "\tFailed to install ca-certificates\n"
printf "\tInstalling gdbm...\n"
test -d $cellar/gdbm || brew install gdbm &> /dev/null
test -d $cellar/gdbm && let ++count || printf "\tFailed to install gdbm\n"
printf "\tInstalling mpdecimal...\n"
test -d $cellar/mpdecimal || brew install mpdecimal &> /dev/null
test -d $cellar/mpdecimal && let ++count || printf "\tFailed to install mpdecimal\n"
printf "\tInstalling openssl@1.1...\n"
test -d $cellar/openssl@1.1 || brew install openssl@1.1 &> /dev/null
test -d $cellar/openssl@1.1 && let ++count || printf "\tFailed to install openssl@1.1\n"
printf "\tInstalling pkg-config...\n"
test -d $cellar/pkg-config || brew install pkg-config &> /dev/null
test -d $cellar/pkg-config && let ++count || printf "\tFailed to install pkg-config\n"
printf "\tInstalling readline...\n"
test -d $cellar/readline || brew install readline &> /dev/null
test -d $cellar/readline && let ++count || printf "\tFailed to install readline\n"
printf "\tInstalling sqlite...\n"
test -d $cellar/sqlite || brew install sqlite &> /dev/null
test -d $cellar/sqlite && let ++count || printf "\tFailed to install sqlite\n"
printf "\tInstalling python@3.10...\n"
test -d $cellar/python@3.10 || brew install python@3.10 &> /dev/null
test -d $cellar/python@3.10 && let ++count || printf "\tFailed to install python@3.10\n"

# Installing rustup-init
printf "\tInstalling rustup-init...\n"
test -d $cellar/rustup-init || brew install rustup-init &> /dev/null
test -d $cellar/rustup-init && let ++count || printf "\tFailed to install rustup-init\n"

# Installing tealdeer
printf "\tInstalling tealdeer...\n"
test -d $cellar/tealdeer || brew install tealdeer &> /dev/null
test -d $cellar/tealdeer && let ++count || printf "\tFailed to install tealdeer\n"

# Installing tree
printf "\tInstalling tree...\n"
test -d $cellar/tree || brew install tree &> /dev/null
test -d $cellar/tree && let ++count || printf "\tFailed to install tree\n"

# Printing end message
printf "\e[1;32m"
printf "Installed $count Packages\n"
printf "\e[0m"
