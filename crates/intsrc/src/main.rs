// Author: Sayeem2004
use evalexpr::eval_boolean;
use regex::Regex;
use std::{env, fs};

/**
 * This is the character that represents the variable in the expression.
 */
const VAR: char = 'x';

/**
 * This program takes an expression and a file as input and outputs lines that contain integers that satisfy
 * the expression.
 */
pub fn main() {
    // Variable declarations
    let args: Vec<String> = env::args().collect();

    // Checking to see if there are enough arguments
    if args.len() != 3 {
        println!("Incorrect number of arguments");
        println!("Correct usage: intsrc \"<expression>\" <file>");
        return;
    }
    let expr: String = args[1].clone();
    let file: String = args[2].clone();

    // Checking to see if the file exists
    if !fs::metadata(&file).is_ok() {
        println!("The file \"{}\" does not exist.", file);
        println!("Please make sure the file exists and try again.");
        return;
    }

    // Checking to see if the expression is valid
    if !valid_expression(&expr) {
        println!("The expression \"{}\" is not valid.", expr);
        println!("Please remember to use \"{}\" as the variable.", VAR);
        return;
    }

    // Processing the file
    process(&expr, &file);
}

/**
 * This function checks to see if the expression is valid by replacing all instances of x with 0 and then *
 * attempting to evaluate.
 */
fn valid_expression(expr: &String) -> bool {
    // Variable declarations
    let copy: String = expr.clone();
    let replace: String = copy.replace(VAR, "0");

    // Attempting to evaluate the expression
    match eval_boolean(&replace) {
        Ok(_) => true,
        Err(_) => false,
    }
}

/**
 * This function processes the file and prints the lines that contain integers that satisfy the expression.
 */
fn process(expr: &String, file: &String) {
    // Variable declarations
    let contents: String = fs::read_to_string(file).unwrap();
    let lines: Vec<&str> = contents.split("\n").collect();
    let size: usize = lines.len().to_string().len();

    // Processing each line
    for (i, line) in lines.into_iter().enumerate() {
        let nums: Vec<i64> = extract(line);

        // Checking to see if the numbers satisfy the expression
        for num in nums {
            let replace: String = expr.replace(VAR, &num.to_string());

            // Printing the line and line number if the expression is true
            match eval_boolean(&replace) {
                Ok(b) => {
                    if b {
                        println!("{}: {}", format!("{:0w$}", i, w = size), line);
                        break;
                    }
                }
                Err(_) => (),
            }
        }

        // Printing the line and line number if the expression is true
        match eval_boolean(expr) {
            Ok(b) => {
                if b {
                    println!("{}: {}", format!("{:0w$}", i, w = size), line);
                }
            }
            Err(_) => (),
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
    let split: Vec<&str> = trim2.split(" ").collect();

    // Extracting the numbers
    for num in split {
        match num.parse::<i64>() {
            Ok(n) => nums.push(n),
            Err(_) => (),
        }
    }

    // Returning the numbers
    nums
}
