# ZSH

This is an installer for my personal ZSH configuration. It is specific to MacOS M1 and is written in Shell Script and Rust. It is a work in progress and is not intended for public use. Installation and removal instructions are provided below.

# Installation

`git clone git@github.com:Sayeem2004/ZSH.git; cd ZSH;` Clones and enters the repository.

`make install;` Installs the project and all dependencies.

## Specifics

### Brew

Installs `brew` if it is not already installed.

Uses `brew` to install the following packages.

```txt
gcc:                GNU compiler collection for C and C++
|-- gmp:            (Dependency)
|-- isl:            (Dependency)
|-- libmpc:         (Dependency)
|-- mpfr:           (Dependency)
|-- |-- texinfo:    (Dependency)
|-- zstd:           (Dependency)
|-- |-- cmake       (Dependency)
|-- |-- lz4         (Dependency)
|-- |-- xz          (Dependency)

jpegoptim:          Utility to optimize JPEG files
|-- jpeg-turbo:     (Dependency)

pngcrush:           Utility to optimize PNG files

python:             Python programming language
|-- gdbm:           (Dependency)
|-- mpdecimal:      (Dependency)
|-- openssl@1.1:    (Dependency)
|-- pkg-config:     (Dependency)
|-- readline:       (Dependency)
|-- sqlite:         (Dependency)
|-- xz:             (Dependency)

rustup-init:        Rust toolchain installer

tree:               Display directories as trees
```

### Coding

### Function

Creates the `~/.zsh_functions` directory, adds it to the `fpath` variable, and then adds the following functions to the directory.

These functions are loaded automatically when the shell is started through the `~/.zshrc` file.

```txt
`tally`: Counts the number of lines in the given directory and sorts them by extension type.

`sshload`: Loads in ssh identities from apple keychain.

`pngcrush-all`: Compresses and overwrites all png images in a folder.

`jpgcrush-all`: Compresses and overwrites all jpg images in a folder.

`intsrc [expression] [file]`: Prints the lines in a file that contain integers that satisfy the given expression.
```

# Removal

Automatic removal is not yet supported but the instructions for manual removal are provided below.

## Specifics

### Brew

The full list of packages installed by `brew` is provided below. Use the following command to remove them.

`brew uninstall [package]` Uninstalls the specified package.

```txt
gcc:                GNU compiler collection for C and C++
|-- gmp:            (Dependency)
|-- isl:            (Dependency)
|-- libmpc:         (Dependency)
|-- mpfr:           (Dependency)
|-- |-- texinfo:    (Dependency)
|-- zstd:           (Dependency)
|-- |-- cmake       (Dependency)
|-- |-- lz4         (Dependency)
|-- |-- xz          (Dependency)

jpegoptim:          Utility to optimize JPEG files
|-- jpeg-turbo:     (Dependency)

pngcrush:           Utility to optimize PNG files

python:             Python programming language
|-- gdbm:           (Dependency)
|-- mpdecimal:      (Dependency)
|-- openssl@1.1:    (Dependency)
|-- pkg-config:     (Dependency)
|-- readline:       (Dependency)
|-- sqlite:         (Dependency)
|-- xz:             (Dependency)

rustup-init:        Rust toolchain installer

tree:               Display directories as trees
```

### Coding

### Functions

To remove all functions go to the `~/.zshrc` file and remove the following lines. Then delete the `~/.zsh_functions` directory.

```txt
# MskCmd Utilities
fpath=(~/.msk_cmd $fpath)
autoload -U $fpath[1]/*(.:t)
```

To remove a specific function, go to the `~/.zsh_functions` directory and remove the corresponding file. The list of functions is provided below.

```txt
`tally`: Counts the number of lines in the given directory and sorts them by extension type.

`sshload`: Loads in ssh identities from apple keychain.

`pngcrush-all`: Compresses and overwrites all png images in a folder.

`jpgcrush-all`: Compresses and overwrites all jpg images in a folder.

`intsrc [expression] [file]`: Prints the lines in a file that contain integers that satisfy the given expression.
```
