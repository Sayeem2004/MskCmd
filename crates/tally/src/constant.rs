/**
 * The maximum number of characters shown for a file extension or number of lines.
 */
pub const SIZE: usize = 16;

/**
 * The number of spaces between the different file extensions.
 */
pub const GAP: usize = 5;

/**
 * List of recognized programming language extensions
 */
pub const LANGS: [&str; 26] = [
    "c", "coffee", "cpp", "cs", "css", "fxml", "gradle", "h", "hpp", "html", "ipynb", "java", "js",
    "json", "md", "nlogo", "php", "py", "rkt", "rs", "sh", "sql", "tex", "toml", "xml", "yml",
];

/**
 * Size of number padding for second counting.
 */
pub const PAD: usize = 4;
