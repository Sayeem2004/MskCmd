# Author: Sayeem2004
# $1 = REPO_PATH
# $2 = CRATE_PATH
# $3 = FUNCTION_PATH
# $4 = SCRIPT_PATH

# Printing start message
printf "\e[1;32m"
printf "\tInstalling Brew Packages...\n"
printf "\e[0m"

# Installing homebrew.
if ! brew -v &> /dev/null; then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# Package count
let count=0

# Installing bat
printf "\t\tInstalling bat...\n"
brew list bat &> /dev/null || brew install bat &> /dev/null
brew list bat &> /dev/null && let ++count || printf "\t\tFailed to install bat\n"

# Installing gcc
printf "\t\tInstalling cmake...\n"
brew list cmake &> /dev/null || brew install cmake &> /dev/null
brew list cmake &> /dev/null && let ++count || printf "\t\tFailed to install cmake\n"
printf "\t\tInstalling lz4...\n"
brew list lz4 &> /dev/null || brew install lz4 &> /dev/null
brew list lz4 &> /dev/null && let ++count || printf "\t\tFailed to install lz4\n"
printf "\t\tInstalling texinfo...\n"
brew list texinfo &> /dev/null || brew install texinfo &> /dev/null
brew list texinfo &> /dev/null && let ++count || printf "\t\tFailed to install texinfo\n"
printf "\t\tInstalling xz...\n"
brew list xz &> /dev/null || brew install xz &> /dev/null
brew list xz &> /dev/null && let ++count || printf "\t\tFailed to install xz\n"
printf "\t\tInstalling gmp...\n"
brew list gmp &> /dev/null || brew install gmp &> /dev/null
brew list gmp &> /dev/null && let ++count || printf "\t\tFailed to install gmp\n"
printf "\t\tInstalling isl...\n"
brew list isl &> /dev/null || brew install isl &> /dev/null
brew list isl &> /dev/null && let ++count || printf "\t\tFailed to install isl\n"
printf "\t\tInstalling libmpc...\n"
brew list libmpc &> /dev/null || brew install libmpc &> /dev/null
brew list libmpc &> /dev/null && let ++count || printf "\t\tFailed to install libmpc\n"
printf "\t\tInstalling mpfr...\n"
brew list mpfr &> /dev/null || brew install mpfr &> /dev/null
brew list mpfr &> /dev/null && let ++count || printf "\t\tFailed to install mpfr\n"
printf "\t\tInstalling zstd...\n"
brew list zstd &> /dev/null || brew install zstd &> /dev/null
brew list zstd &> /dev/null && let ++count || printf "\t\tFailed to install zstd\n"
printf "\t\tInstalling gcc...\n"
brew list gcc &> /dev/null || brew install gcc &> /dev/null
brew list gcc &> /dev/null && let ++count || printf "\t\tFailed to install gcc\n"

# Installing jpegoptim
printf "\t\tInstalling jpeg-turbo...\n"
brew list jpeg-turbo &> /dev/null || brew install jpeg-turbo &> /dev/null
brew list jpeg-turbo &> /dev/null && let ++count || printf "\t\tFailed to install jpeg-turbo\n"
printf "\t\tInstalling jpegoptim...\n"
brew list jpegoptim &> /dev/null || brew install jpegoptim &> /dev/null
brew list jpegoptim &> /dev/null && let ++count || printf "\t\tFailed to install jpegoptim\n"

# Installing pngcrush
printf "\t\tInstalling pngcrush...\n"
brew list pngcrush &> /dev/null || brew install pngcrush &> /dev/null
brew list pngcrush &> /dev/null && let ++count || printf "\t\tFailed to install pngcrush\n"

# Installing python
printf "\t\tInstalling ca-certificates...\n"
brew list ca-certificates &> /dev/null || brew install ca-certificates &> /dev/null
brew list ca-certificates &> /dev/null && let ++count || printf "\t\tFailed to install ca-certificates\n"
printf "\t\tInstalling gdbm...\n"
brew list gdbm &> /dev/null || brew install gdbm &> /dev/null
brew list gdbm &> /dev/null && let ++count || printf "\t\tFailed to install gdbm\n"
printf "\t\tInstalling mpdecimal...\n"
brew list mpdecimal &> /dev/null || brew install mpdecimal &> /dev/null
brew list mpdecimal &> /dev/null && let ++count || printf "\t\tFailed to install mpdecimal\n"
printf "\t\tInstalling openssl@1.1...\n"
brew list openssl@1.1 &> /dev/null || brew install openssl@1.1 &> /dev/null
brew list openssl@1.1 &> /dev/null && let ++count || printf "\t\tFailed to install openssl@1.1\n"
printf "\t\tInstalling pkg-config...\n"
brew list pkg-config &> /dev/null || brew install pkg-config &> /dev/null
brew list pkg-config &> /dev/null && let ++count || printf "\t\tFailed to install pkg-config\n"
printf "\t\tInstalling readline...\n"
brew list readline &> /dev/null || brew install readline &> /dev/null
brew list readline &> /dev/null && let ++count || printf "\t\tFailed to install readline\n"
printf "\t\tInstalling sqlite...\n"
brew list sqlite &> /dev/null || brew install sqlite &> /dev/null
brew list sqlite &> /dev/null && let ++count || printf "\t\tFailed to install sqlite\n"
printf "\t\tInstalling python...\n"
brew list python &> /dev/null || brew install python &> /dev/null
brew list python &> /dev/null && let ++count || printf "\t\tFailed to install python\n"

# Installing rustup-init
printf "\t\tInstalling rustup-init...\n"
brew list rustup-init &> /dev/null || brew install rustup-init &> /dev/null
brew list rustup-init &> /dev/null && let ++count || printf "\t\tFailed to install rustup-init\n"

# Installing tealdeer
printf "\t\tInstalling tealdeer...\n"
brew list tealdeer &> /dev/null || brew install tealdeer &> /dev/null
brew list tealdeer &> /dev/null && let ++count || printf "\t\tFailed to install tealdeer\n"

# Installing tree
printf "\t\tInstalling tree...\n"
brew list tree &> /dev/null || brew install tree &> /dev/null
brew list tree &> /dev/null && let ++count || printf "\t\tFailed to install tree\n"

# Printing end message
printf "\e[1;32m"
printf "\tInstalled $count Packages\n"
printf "\e[0m"
