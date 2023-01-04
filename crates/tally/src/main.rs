mod constant;
mod process;
use std::{env, fs, path::Path};

/**
 * This program takes a directory as an argument and prints the number of lines in each file type.
 */
pub fn main() {
    // Variable declarations
    let args: Vec<String> = env::args().collect();

    // Checking to see if there are too many arguments
    if args.len() > 2 {
        println!("Incorrect number of arguments");
        println!("Correct usage: tally [directory]");
        return;
    }

    // Setting path to appropriate value
    let path: &Path = if args.len() == 1 {
        Path::new(".")
    } else {
        Path::new(&args[1])
    };

    // Changing directory if possible
    let path_string: String = path.to_str().unwrap_or(".").to_string();
    if fs::metadata(path).is_ok() {
        assert!(env::set_current_dir(path).is_ok());
    } else {
        println!("The directory \"{}\" does not exist", path_string);
        return;
    }

    // Processing the directory
    process::process();
}
