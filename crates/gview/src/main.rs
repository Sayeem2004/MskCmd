mod constant;
mod graph;
mod grid;
mod model;
mod view;
mod visual;
use graph::Graph;
use grid::Grid;
use std::{env, fs};

/**
 * This program takes in a list of paths representing directory or files of edges and displays them visually
 * as graphs using a force-directed layout.
 */
pub fn main() {
    // Variable declaration
    let args: Vec<String> = env::args().collect();
    let mut paths: Vec<String> = Vec::new();
    let mut delim: String = constant::DELIM.to_string();

    // Iterating through arguments and processing them
    for arg in &args {
        if arg.starts_with("--delim=") {
            let sub: &str = &arg[8..];
            delim = sub.to_string();
        } else {
            paths.push(arg.clone());
        }
    }

    // Making sure that the given paths are valid
    for path in &paths {
        if fs::metadata(path).is_err() {
            println!("The path \"{}\" does not exist.", path);
            println!("Please make sure the path exists and try again.");
            return;
        }
    }

    // Processing the given paths
    let graphs: Vec<Graph> = model::process(&paths, &delim);

    // Processing the given graphs into grids
    // let grids: Vec<Grid> = visual::process(graphs);

    // Displaying the grids
    // view::display(grids);
}
