use crate::constant::EXP;
use crate::graph::{Node, Graph};

/**
 * A struct representing a (x, y) vector on the screen.
 */
#[derive(Debug, Clone)]
pub struct Vector {
    /**
     * The x-coordinate of the point.
     */
    x: f64,

    /**
     * The y-coordinate of the point.
     */
    y: f64,
}

impl Vector {
    /**
     * Constructor for a point with the given x and y coordinates.
     */
    pub fn new(x: f64, y: f64) -> Vector {
        Vector { x, y }
    }

    /**
     * Getter method for the x-coordinate of the point.
     */
    pub fn x(&self) -> f64 {
        self.x
    }

    /**
     * Getter method for the y-coordinate of the point.
     */
    pub fn y(&self) -> f64 {
        self.y
    }
}

/**
 * A struct representing a vertex on the screen.
 */
#[derive(Debug, Clone)]
pub struct Vertex {
    /**
     * The position of the vertex.
     */
    position: Vector,

    /**
     * The velocity of the vertex.
     */
    velocity: Vector,

    /**
     * The color of the vertex in hexadecimal format.
     */
    color: String,

    /**
     * The node that the vertex represents.
     */
    node: Node,
}

impl Vertex {
    /**
     * Constructor for a vertex with the given position, velocity, color, and node.
     */
    pub fn new(position: Vector, velocity: Vector, color: String, node: Node) -> Vertex {
        Vertex {
            position,
            velocity,
            color,
            node,
        }
    }

    /**
     * Getter method for the position of the vertex.
     */
    pub fn position(&self) -> &Vector {
        &self.position
    }

    /**
     * Getter method for the velocity of the vertex.
     */
    pub fn velocity(&self) -> &Vector {
        &self.velocity
    }

    /**
     * Getter method for the color of the vertex.
     */
    pub fn color(&self) -> &String {
        &self.color
    }

    /**
     * Getter method for the node that the vertex represents.
     */
    pub fn node(&self) -> &Node {
        &self.node
    }

    /**
     * Returns the radius of the vertex.
     */
    pub fn radius(&self) -> f64 {
        self.node().weight().powf(EXP)
    }
}

/**
 * A struct representing an edge on the screen.
 */
#[derive(Debug, Clone)]
pub struct Edge {
    /**
     * The start vertex of the edge.
     */
    start: &Vertex,

    /**
     * The end vertex of the edge.
     */
    end: &Vertex,
}

impl Edge {
    /**
     * Constructor for an edge with the given start and end vertices.
     */
    pub fn new(start: &Vertex, end: &Vertex) -> Edge {
        Edge { start, end }
    }

    /**
     * Getter method for the start vertex of the edge.
     */
    pub fn start(&self) -> &Vertex {
        self.start
    }

    /**
     * Getter method for the end vertex of the edge.
     */
    pub fn end(&self) -> &Vertex {
        self.end
    }
}

/**
 * A struct representing a grid on the screen.
 */
#[derive(Debug, Clone)]
pub struct Grid {
    /**
     * The vertices of the grid.
     */
    vertices: Vec<Vertex>,

    /**
     * The edges of the grid.
     */
    edges: Vec<Edge>,

    /**
     * The width of the grid.
     */
    width: f64,

    /**
     * The height of the grid.
     */
    height: f64,
}

impl Grid {
    /**
     * Constructor for a grid from a given graph.
     */
    pub fn new(graph: Graph) -> Grid {
        let mut vertices = Vec::new();
        let mut edges = Vec::new();

        for node in graph.nodes() {
            vertices.push(Vertex::new(
                Vector::new(0.0, 0.0),
                Vector::new(0.0, 0.0),
                String::from("#000000"),
                node.clone(),
            ));
        }

        for edge in graph.edges() {
            edges.push(Edge::new(
                &vertices[edge.start().id() as usize],
                &vertices[edge.end().id() as usize],
            ));
        }

        Grid {
            vertices,
            edges,
            width: 0.0,
            height: 0.0,
        }
    }

    /**
     * Getter method for the vertices of the grid.
     */
    pub fn vertices(&self) -> &Vec<Vertex> {
        &self.vertices
    }

    /**
     * Getter method for the edges of the grid.
     */
    pub fn edges(&self) -> &Vec<Edge> {
        &self.edges
    }
}
