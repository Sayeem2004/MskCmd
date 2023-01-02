use std::{collections::HashMap, env, fs, path::Path, time::Instant};
use walkdir::WalkDir;

/**
 * The maximum number of characters shown for a file extension or number of lines.
 */
const SIZE: usize = 16;

/**
 * The number of spaces between the different file extensions.
 */
const GAP: usize = 5;

/**
 * List of recognized programming language extensions
 */
const LANGS: [&str; 26] = [
    "c", "coffee", "cpp", "cs", "css", "fxml", "gradle", "h", "hpp", "html", "ipynb", "java", "js",
    "json", "md", "nlogo", "php", "py", "rkt", "rs", "sh", "sql", "tex", "toml", "xml", "yml",
];

/**
 * This program takes a directory as an argument and prints the number of lines in each file type.
 */
pub fn main() {
    // Variable declarations
    let args: Vec<String> = env::args().collect();

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
        println!("The directory {} does not exist", path_string);
        return;
    }

    // Printing lines
    print_lines();
}

/**
 * This function prints the number of lines in each file type.
 */
pub fn print_lines() {
    // Variable declarations
    let mut dict: HashMap<String, usize> = HashMap::new();
    let start: Instant = Instant::now();
    let mut prev: u64 = 0;
    println!("Time elapsed: {} seconds", prev);

    // Iterating through all files and directories
    for entry in WalkDir::new(".").into_iter().filter_map(|e| e.ok()) {
        // Checking to see if it is a file
        if entry.file_type().is_file() {
            // Reading file and getting extension and lines
            let file: String = fs::read_to_string(entry.path()).unwrap_or_else(|_| String::from(""));
            let extension: String = entry
                .path()
                .extension()
                .unwrap_or_else(|| " ".as_ref())
                .to_str()
                .unwrap_or(" ")
                .to_string();
            let lines: usize = file.lines().count();

            // Adding to dictionary
            if dict.contains_key(&extension) {
                let current: usize = *dict.get(&extension).unwrap();
                dict.insert(extension, current + lines);
            } else {
                dict.insert(extension, lines);
            }
        }

        // Printing time elapsed
        let curr: u64 = start.elapsed().as_secs();
        if curr > prev {
            println!("Time elapsed: {} seconds", curr);
            prev = curr;
        }
    }

    // Finding max length of extension
    let mut mx_key_total: usize = 0;
    let mut mx_key_prog: usize = 0;
    let mut mx_line_total: usize = 0;
    let mut mx_line_prog: usize = 0;
    for (key, value) in dict.iter() {
        mx_key_total = mx_key_total.clamp(key.len(), SIZE);
        mx_line_total = mx_line_total.clamp(value.to_string().len(), SIZE);

        if is_lang(key) {
            mx_key_prog = mx_key_prog.clamp(key.len(), SIZE);
            mx_line_prog = mx_line_prog.clamp(value.to_string().len(), SIZE);
        }

        // Printing time elapsed
        let curr: u64 = start.elapsed().as_secs();
        if curr > prev {
            println!("Time elapsed: {} seconds", curr);
            prev = curr;
        }
    }

    // Sorting and formatting lines to print
    let mut total: Vec<String> = Vec::new();
    let mut prog: Vec<String> = Vec::new();
    for (key, _value) in dict.iter() {
        let mut key_clone: String = key.clone();
        let mut value: String = _value.to_string();

        key_clone.truncate(mx_key_total);
        value.truncate(mx_line_total);
        let mut value_clone: usize = value.parse::<usize>().unwrap();

        total.push(format!(
            "{:w1$} : {:0w2$}",
            key_clone,
            value_clone,
            w1 = mx_key_total,
            w2 = mx_line_total
        ));

        if is_lang(key) {
            key_clone.truncate(mx_key_prog);
            value.truncate(mx_line_prog);
            value_clone = value.parse::<usize>().unwrap();

            prog.push(format!(
                "{:w1$} : {:0w2$}",
                key_clone,
                value_clone,
                w1 = mx_key_prog,
                w2 = mx_line_prog
            ));
        }

        // Printing time elapsed
        let curr: u64 = start.elapsed().as_secs();
        if curr > prev {
            println!("Time elapsed: {} seconds", curr);
            prev = curr;
        }
    }
    total.sort();
    prog.sort();

    // Getting terminal size
    let (width, _height) = termion::terminal_size().unwrap();
    let skip_total: usize = (width as usize) / (mx_key_total + mx_line_total + 5 + GAP);
    let skip_prog: usize = (width as usize) / (mx_key_prog + mx_line_prog + 5 + GAP);
    let mut i: usize = 0;

    // Printing total lines
    println!("\nAll Extensions:");
    for line in total.iter() {
        print!("|{}|     ", line);

        i += 1;
        if i % skip_total == 0 {
            println!();
        }
    }
    if i % skip_total != 0 {
        println!();
    }

    // Printing programming lines
    i = 0;
    println!("\nProgramming Extensions:");
    for line in prog.iter() {
        print!("|{}|{}", line, " ".repeat(GAP));

        i += 1;
        if i % skip_prog == 0 {
            println!();
        }
    }
    if i % skip_prog != 0 {
        println!();
    }
}

/**
 * This function returns true if the extension is a programming language.
 */
pub fn is_lang(extension: &String) -> bool {
    // Checking if extension is in list
    for lang in LANGS {
        if extension == &String::from(lang) {
            return true;
        }
    }

    // Default return value
    false
}
