use crate::constant::WEIGHT;
use crate::graph::{Graph, Node};
use std::fs::{self, Metadata};
use std::os::unix::prelude::MetadataExt;
use walkdir::WalkDir;

/**
 * Processes the given paths into a list of graphs.
 */
pub fn process(paths: &Vec<String>, delim: &String) -> Vec<Graph> {
    // Variable declaration
    let mut graphs: Vec<Graph> = Vec::new();

    // Iterating through the given paths and processing them into graphs
    for path in paths {
        let md: Metadata = fs::metadata(path).unwrap();
        if md.is_file() {
            process_file(path, delim, &mut graphs);
        } else if md.is_dir() {
            process_dir(path, &mut graphs);
        }
    }

    // Returning the list of graphs
    graphs
}

/**
 * Processes the given file into a graph and adds it to the given list.
 */
pub fn process_file(path: &String, delim: &String, graphs: &mut Vec<Graph>) {
    // Variable declarations
    let contents: String = fs::read_to_string(path).unwrap_or(String::new());
    let lines: Vec<&str> = contents.split("\n").collect();
    let mut nodes: Vec<Node> = Vec::new();
    let mut edges: Vec<(usize, usize)> = Vec::new();

    // Iterating through the lines
    for (i, line) in lines.iter().enumerate() {
        // Splitting the line into parts
        let parts: Vec<&str> = line.split(delim).collect();
        if parts.len() != 2 {
            continue;
        }

        // Creating the nodes
        let node1: Node = Node::new(parts[0].to_string(), WEIGHT, 2 * i);
        let node2: Node = Node::new(parts[1].to_string(), WEIGHT, 2 * i + 1);

        // Adding the nodes to the current list
        edges.push((node1.index(), node2.index()));
        nodes.push(node1);
        nodes.push(node2);
    }

    // Creating and adding the graph to the list
    let graph: Graph = Graph::new(nodes, edges);
    graphs.push(graph);
}

/**
 * Processes the given directory into a list of graphs and adds them to the given list.
 */
pub fn process_dir(path: &String, graphs: &mut Vec<Graph>) {
    // Variable declarations
    let mut nodes: Vec<Node> = Vec::new();
    let mut edges: Vec<(usize, usize)> = Vec::new();
    let mut queue: Vec<Node> = Vec::new();

    // Iterating through the files in the directory
    for entry in WalkDir::new(path).into_iter().filter_map(|e| e.ok()) {
        // Getting metadata
        let md: Metadata = entry.metadata().unwrap();
        let depth: usize = entry.depth();
        let name: String = entry.file_name().to_string_lossy().to_string();

        // Creating the node
        let node: Node = Node::new(name, (md.size() / 1000) as f64, nodes.len());
        nodes.push(node.clone());

        // Updating the queue as needed
        while queue.len() > depth {
            queue.pop();
        }

        // Adding edges to the current list
        if !queue.is_empty() {
            let parent: &Node = queue.last().unwrap();
            edges.push((parent.index(), node.index()));
        }

        // Adding the node to the queue
        if md.is_dir() {
            queue.push(node);
        }
    }

    // Creating and adding the graph to the list
    let graph: Graph = Graph::new(nodes, edges);
    graphs.push(graph);
}
