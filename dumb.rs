use std::time::{SystemTime,Duration};

fn main () {
    let mut counter = 0;
    let start = std::time::SystemTime::now();
    for i in (0..1<<32) {
        println!("{}", i);
    }
    let elapsed = start.elapsed();
    println!("{}", elapsed.as_secs());
}
