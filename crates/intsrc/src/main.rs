mod constant;
mod process;
use evalexpr::eval_boolean;
use std::{env, fs};

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
    if fs::metadata(&file).is_err() {
        println!("The file \"{}\" does not exist.", file);
        println!("Please make sure the file exists and try again.");
        return;
    }

    // Checking to see if the expression is valid
    if !valid_expression(&expr) {
        println!("The expression \"{}\" is not valid.", expr);
        println!(
            "Please remember to use \"{}\" as the variable.",
            constant::VAR
        );
        return;
    }

    // Processing the file
    process::process(&expr, &file);
}

/**
 * This function checks to see if the expression is valid by replacing all instances of x with 0 and then *
 * attempting to evaluate.
 */
fn valid_expression(expr: &str) -> bool {
    // Variable declarations
    let copy: String = expr.to_owned();
    let replace: String = copy.replace(constant::VAR, "0");

    // Attempting to evaluate the expression
    eval_boolean(&replace).is_ok()
}
