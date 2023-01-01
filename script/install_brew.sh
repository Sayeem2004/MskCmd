# Installing homebrew.
if ! brew -v &> /dev/null; then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# Installing gcc
brew list cmake &> /dev/null || brew install cmake
brew list lz4 &> /dev/null || brew install lz4
brew list texinfo &> /dev/null || brew install texinfo
brew list xz &> /dev/null || brew install xz
brew list gmp &> /dev/null || brew install gmp
brew list isl &> /dev/null || brew install isl
brew list libmpc &> /dev/null || brew install libmpc
brew list mpfr &> /dev/null || brew install mpfr
brew list zstd &> /dev/null || brew install zstd
brew list gcc &> /dev/null || brew install gcc

# Installing jpegoptim
brew list jpeg-turbo &> /dev/null || brew install jpeg-turbo
brew list jpegoptim &> /dev/null || brew install jpegoptim

# Installing pngcrush
brew list pngcrush &> /dev/null || brew install pngcrush

# Installing python
brew list gdbm &> /dev/null || brew install gdbm
brew list mpdecimal &> /dev/null || brew install mpdecimal
brew list openssl@1.1 &> /dev/null || brew install openssl@1.1
brew list pkg-config &> /dev/null || brew install pkg-config
brew list readline &> /dev/null || brew install readline
brew list sqlite &> /dev/null || brew install sqlite
brew list xz &> /dev/null || brew install xz
brew list python &> /dev/null || brew install python

# Installing rustup-init
brew list rustup-init &> /dev/null || brew install rustup-init

# Installing tree
brew list tree &> /dev/null || brew install tree
