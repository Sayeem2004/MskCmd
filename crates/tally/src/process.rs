use crate::constant;
use std::{collections::HashMap, fs, time::Instant};
use walkdir::WalkDir;

/**
 * This function processes all files and prints the number of lines of each file type.
 */
pub fn process() {
    // Variable declarations
    let start: Instant = Instant::now();
    let mut prev: u64 = 0;
    let dict: HashMap<String, usize> = iterate(&start, &mut prev);

    // Finding max length of extension
    let mut mx_key_total: usize = 0;
    let mut mx_key_prog: usize = 0;
    let mut mx_line_total: usize = 0;
    let mut mx_line_prog: usize = 0;
    find_max(
        &mut mx_key_total,
        &mut mx_key_prog,
        &mut mx_line_total,
        &mut mx_line_prog,
        &dict,
        &start,
        &mut prev,
    );

    // Sorting and formatting lines to print
    let mut total: Vec<String> = Vec::new();
    let mut prog: Vec<String> = Vec::new();
    format_and_sort(
        &mut total,
        &mut prog,
        &dict,
        mx_key_total,
        mx_key_prog,
        mx_line_total,
        mx_line_prog,
        &start,
        &mut prev,
    );

    // Printing lines
    print_lines(
        &total,
        &prog,
        mx_key_total,
        mx_key_prog,
        mx_line_total,
        mx_line_prog,
    );
}

/**
 * This function iterates through all files and directories and returns a dictionary of file types and the
 * number of lines.
 */
fn iterate(start: &Instant, prev: &mut u64) -> HashMap<String, usize> {
    // Variable declaration
    let mut dict: HashMap<String, usize> = HashMap::new();
    println!("Time elapsed: {:0w$} seconds", prev, w = constant::PAD);

    // Iterating through all files and directories
    for entry in WalkDir::new(".").into_iter().filter_map(|e| e.ok()) {
        // Checking to see if it is a file
        if entry.file_type().is_file() {
            // Reading file and getting extension and lines
            let file: String =
                fs::read_to_string(entry.path()).unwrap_or_else(|_| String::from(""));
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
        if curr > *prev {
            println!("Time elapsed: {:0w$} seconds", curr, w = constant::PAD);
            *prev = curr;
        }
    }

    // Returning dictionary
    dict
}

/**
 * This function finds the max length of the keys and values in the dictionary.
 */
fn find_max(
    mx_key_total: &mut usize,
    mx_key_prog: &mut usize,
    mx_line_total: &mut usize,
    mx_line_prog: &mut usize,
    dict: &HashMap<String, usize>,
    start: &Instant,
    prev: &mut u64,
) {
    // Iterating through dictionary
    for (key, value) in dict.iter() {
        // Updating max length of total extensions
        (*mx_key_total) = (*mx_key_total).clamp(key.len(), constant::SIZE);
        (*mx_line_total) = (*mx_line_total).clamp(value.to_string().len(), constant::SIZE);

        // Updating max length of programming language extensions
        if is_lang(key) {
            (*mx_key_prog) = (*mx_key_prog).clamp(key.len(), constant::SIZE);
            (*mx_line_prog) = (*mx_line_prog).clamp(value.to_string().len(), constant::SIZE);
        }

        // Printing time elapsed
        let curr: u64 = start.elapsed().as_secs();
        if curr > *prev {
            println!("Time elapsed: {:0w$} seconds", curr, w = constant::PAD);
            *prev = curr;
        }
    }
}

/**
 * This function formats and sorts the lines to print.
 */
#[allow(clippy::too_many_arguments)]
fn format_and_sort(
    total: &mut Vec<String>,
    prog: &mut Vec<String>,
    dict: &HashMap<String, usize>,
    mx_key_total: usize,
    mx_key_prog: usize,
    mx_line_total: usize,
    mx_line_prog: usize,
    start: &Instant,
    prev: &mut u64,
) {
    // Iterating through dictionary
    for (key, _value) in dict.iter() {
        // Formatting key and value
        let mut key_clone: String = key.clone();
        let mut value: String = _value.to_string();
        key_clone.truncate(mx_key_total);
        value.truncate(mx_line_total);
        let mut value_clone: usize = value.parse::<usize>().unwrap();

        // Adding to total
        total.push(format!(
            "{:w1$} : {:0w2$}",
            key_clone,
            value_clone,
            w1 = mx_key_total,
            w2 = mx_line_total
        ));

        // Programming language case
        if is_lang(key) {
            // Formatting key and value
            key_clone.truncate(mx_key_prog);
            value.truncate(mx_line_prog);
            value_clone = value.parse::<usize>().unwrap();

            // Adding to programming languages
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
        if curr > *prev {
            println!("Time elapsed: {:0w$} seconds", curr, w = constant::PAD);
            *prev = curr;
        }
    }

    // Sorting lines
    total.sort();
    prog.sort();
}

fn print_lines(
    total: &[String],
    prog: &[String],
    mx_key_total: usize,
    mx_key_prog: usize,
    mx_line_total: usize,
    mx_line_prog: usize,
) {
    // Getting terminal size
    let (width, _height) = termion::terminal_size().unwrap();
    let skip_total: usize = (width as usize) / (mx_key_total + mx_line_total + 5 + constant::GAP);
    let skip_prog: usize = (width as usize) / (mx_key_prog + mx_line_prog + 5 + constant::GAP);
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
        print!("|{}|{}", line, " ".repeat(constant::GAP));

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
fn is_lang(extension: &String) -> bool {
    // Checking if extension is in list
    for lang in constant::LANGS {
        if extension == &String::from(lang) {
            return true;
        }
    }

    // Default return value
    false
}
