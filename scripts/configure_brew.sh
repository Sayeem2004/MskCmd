# Author: Sayeem2004

# Installing homebrew.
if ! brew -v &> /dev/null; then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# Package counter
count=0

# Installing gcc
echo "    Installing cmake..."
brew list cmake &> /dev/null || brew install cmake &> /dev/null
brew list cmake &> /dev/null && let ++count || echo "    Failed to install cmake."

echo "    Installing lz4..."
brew list lz4 &> /dev/null || brew install lz4 &> /dev/null
brew list lz4 &> /dev/null && let ++count || echo "    Failed to install lz4."

echo "    Installing texinfo..."
brew list texinfo &> /dev/null || brew install texinfo &> /dev/null
brew list texinfo &> /dev/null && let ++count || echo "    Failed to install texinfo."

echo "    Installing xz..."
brew list xz &> /dev/null || brew install xz &> /dev/null
brew list xz &> /dev/null && let ++count || echo "    Failed to install xz."

echo "    Installing gmp..."
brew list gmp &> /dev/null || brew install gmp &> /dev/null
brew list gmp &> /dev/null && let ++count || echo "    Failed to install gmp."

echo "    Installing isl..."
brew list isl &> /dev/null || brew install isl &> /dev/null
brew list isl &> /dev/null && let ++count || echo "    Failed to install isl."

echo "    Installing libmpc..."
brew list libmpc &> /dev/null || brew install libmpc &> /dev/null
brew list libmpc &> /dev/null && let ++count || echo "    Failed to install libmpc."

echo "    Installing mpfr..."
brew list mpfr &> /dev/null || brew install mpfr &> /dev/null
brew list mpfr &> /dev/null && let ++count || echo "    Failed to install mpfr."

echo "    Installing zstd..."
brew list zstd &> /dev/null || brew install zstd &> /dev/null
brew list zstd &> /dev/null && let ++count || echo "    Failed to install zstd."

echo "    Installing gcc..."
brew list gcc &> /dev/null || brew install gcc &> /dev/null
brew list gcc &> /dev/null && let ++count || echo "    Failed to install gcc."

# Installing jpegoptim
echo "    Installing jpeg-turbo..."
brew list jpeg-turbo &> /dev/null || brew install jpeg-turbo &> /dev/null
brew list jpeg-turbo &> /dev/null && let ++count || echo "    Failed to install jpeg-turbo."

echo "    Installing jpegoptim..."
brew list jpegoptim &> /dev/null || brew install jpegoptim &> /dev/null
brew list jpegoptim &> /dev/null && let ++count || echo "    Failed to install jpegoptim."

# Installing pngcrush
echo "    Installing pngcrush..."
brew list pngcrush &> /dev/null || brew install pngcrush &> /dev/null
brew list pngcrush &> /dev/null && let ++count || echo "    Failed to install pngcrush."

# Installing python
echo "    Installing ca-certificates..."
brew list ca-certificates &> /dev/null || brew install ca-certificates &> /dev/null
brew list ca-certificates &> /dev/null && let ++count || echo "    Failed to install ca-certificates."

echo "    Installing gdbm..."
brew list gdbm &> /dev/null || brew install gdbm &> /dev/null
brew list gdbm &> /dev/null && let ++count || echo "    Failed to install gdbm."

echo "    Installing mpdecimal..."
brew list mpdecimal &> /dev/null || brew install mpdecimal &> /dev/null
brew list mpdecimal &> /dev/null && let ++count || echo "    Failed to install mpdecimal."

echo "    Installing openssl@1.1..."
brew list openssl@1.1 &> /dev/null || brew install openssl@1.1 &> /dev/null
brew list openssl@1.1 &> /dev/null && let ++count || echo "    Failed to install openssel@1.1"

echo "    Installing pkg-config..."
brew list pkg-config &> /dev/null || brew install pkg-config &> /dev/null
brew list pkg-config &> /dev/null && let ++count || echo "    Failed to install pkg-config."

echo "    Installing readline..."
brew list readline &> /dev/null || brew install readline &> /dev/null
brew list readline &> /dev/null && let ++count || echo "    Failed to install readline."

echo "    Installing sqlite..."
brew list sqlite &> /dev/null || brew install sqlite &> /dev/null
brew list sqlite &> /dev/null && let ++count || echo "    Failed to install sqlite."

echo "    Installing python..."
brew list python &> /dev/null || brew install python &> /dev/null
brew list python &> /dev/null && let ++count || echo "    Failed to install python."

# Installing rustup-init
echo "    Installing rustup-init..."
brew list rustup-init &> /dev/null || brew install rustup-init &> /dev/null
brew list rustup-init &> /dev/null && let ++count || echo "    Failed to install rustup-init."

# Installing tealdeer
echo "    Installing tealdeer..."
brew list tealdeer &> /dev/null || brew install tealdeer &> /dev/null
brew list tealdeer &> /dev/null && let ++count || echo "    Failed to install tealdeer."

# Installing tree
echo "    Installing tree..."
brew list tree &> /dev/null || brew install tree &> /dev/null
brew list tree &> /dev/null && let ++count || echo "    Failed to install tree."

# Printing package count
echo "Installed $count packages"
