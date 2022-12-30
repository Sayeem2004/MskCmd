# MskCmd

MskCmd is a set of command line tools written by me to make my life easier. It is specific to MacOS and Zsh and is written in Rust. Installation and usage instructions are below.

# Installation

`git clone git@github.com:Sayeem2004/MskCmd.git;` Clones the repository.

`cd MskCmd; make;` Builds the project and replaces the old shell scripts if they exist.

# Usage

`mskcmd` Lists all current commands and their descriptions.

`tally` Counts the number of lines in the given directory and sorts them by extension type

`intsrc [->|->=|-==|-!=|-<=|-<] [int] [file]` Prints the lines in a file that contain integers that satisfy the given condition.
