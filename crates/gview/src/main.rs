mod constant;
mod model;
mod view;

pub fn main() {
    println!("main.rs");
    println!("{}", constant::WEIGHT);
    model::model();
    view::view();
}
