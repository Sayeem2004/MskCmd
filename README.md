# MskCmd

MskCmd is a set of command line tools/shortcuts written by me to make my life easier. It is specific to MacOS and Zsh and is written in Rust. Installation and usage instructions are below.

# Installation

`git clone git@github.com:Sayeem2004/MskCmd.git;` Clones the repository.

`cd MskCmd; make install;` Builds the project and replaces the old shell scripts if they exist.

`make remove;` Cleans the project and removes shell scripts from zsh.

# Usage

1. `tally` Counts the number of lines in the given directory and sorts them by extension type.

2. `sshload` Loads in ssh identities from apple keychain.

3. `pngcrush-all` Compresses and overwrites all png images in a folder.

4. `jpgcrush-all` Compresses and overwrites all jpg images in a folder.

5. `intsrc [expression] [file]` Prints the lines in a file that contain integers that satisfy the given expression.
