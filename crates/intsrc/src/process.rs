use crate::constant;
use evalexpr::eval_boolean;
use regex::Regex;
use std::fs;

/**
 * This function processes the file and prints the lines that contain integers that satisfy the expression.
 */
pub fn process(expr: &str, file: &String) {
    // Variable declarations
    let contents: String = fs::read_to_string(file).unwrap();
    let lines: Vec<&str> = contents.split('\n').collect();
    let size: usize = lines.len().to_string().len();

    // Processing each line
    for (i, line) in lines.into_iter().enumerate() {
        let nums: Vec<i64> = extract(line);

        // Checking to see if the numbers satisfy the expression
        for num in nums {
            let replace: String = expr.replace(constant::VAR, &num.to_string());

            // Printing the line and line number if the expression is true
            if let Ok(b) = eval_boolean(&replace) {
                if b {
                    println!("{:0w$}: {}", i, line, w = size);
                }
            }
        }

        // Printing the line and line number if the expression is true
        if let Ok(b) = eval_boolean(expr) {
            if b {
                println!("{:0w$}: {}", i, line, w = size);
            }
        }
    }
}

/**
 * This function extracts the integers from a line.
 */
fn extract(line: &str) -> Vec<i64> {
    // Variable declarations
    let mut nums: Vec<i64> = Vec::new();
    let re1: Regex = Regex::new("[^0-9]").unwrap();
    let re2: Regex = Regex::new(" +").unwrap();

    // Trimming the line
    let trim1 = re1.replace_all(line, " ");
    let trim2 = re2.replace_all(&trim1, " ");
    let split: Vec<&str> = trim2.split(' ').collect();

    // Extracting the numbers
    for num in split {
        if let Ok(n) = num.parse::<i64>() {
            nums.push(n);
        }
    }

    // Returning the numbers
    nums
}
