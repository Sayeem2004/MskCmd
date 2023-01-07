/**
 * A struct representing a node in a graph.
 */
#[derive(Debug, Clone)]
pub struct Node {
    /**
     * The name of the node used for labeling.
     */
    name: String,

    /**
     * The weight of the node used for the force-directed layout.
     */
    weight: f64,

    /**
     * The index of the node used in the adjacency matrix.
     */
    index: usize,
}

impl Node {
    /**
     * Constructor for a node with the given name, weight, and index.
     */
    pub fn new(name: String, weight: f64, index: usize) -> Node {
        Node {
            name,
            weight,
            index,
        }
    }

    /**
     * Getter method for the name of the node.
     */
    pub fn name(&self) -> &String {
        &self.name
    }

    /**
     * Getter method for the weight of the node.
     */
    pub fn weight(&self) -> f64 {
        self.weight
    }

    /**
     * Getter method for the index of the node.
     */
    pub fn index(&self) -> usize {
        self.index
    }
}

/**
 * A struct representing a graph.
 */
#[derive(Debug, Clone)]
pub struct Graph {
    /**
     * The list of nodes in the graph.
     */
    nodes: Vec<Node>,

    /**
     * The adjacency matrix of the graph.
     */
    adj: Vec<Vec<bool>>,
}

impl Graph {
    /**
     * Constructor for a graph with the given nodes and edges.
     */
    pub fn new(nodes: Vec<Node>, edges: Vec<(usize, usize)>) -> Graph {
        // Variable declaration
        let mut adj: Vec<Vec<bool>> = vec![vec![false; nodes.len()]; nodes.len()];

        // Adding the edges to the adjacency matrix
        for (i, j) in edges {
            adj[i][j] = true;
            adj[j][i] = true;
        }

        // Creating and returning the graph
        Graph { nodes, adj }
    }

    /**
     * Getter method for the nodes in the graph.
     */
    pub fn nodes(&self) -> &Vec<Node> {
        &self.nodes
    }

    /**
     * Getter method for the adjacency matrix of the graph.
     */
    pub fn adj(&self) -> &Vec<Vec<bool>> {
        &self.adj
    }
}
