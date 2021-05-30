static CRATE: &str = "startswith";

fn main() {
    if let Some(haystack) = std::env::args().nth(1) {
        if let Some(needle) = std::env::args().nth(2) {
            match haystack.starts_with(&needle) {
                true => {
                    let new_haystack = haystack.clone().strip_prefix(&needle).unwrap().to_owned();
                    println!("{}", new_haystack);
                    exit!(0);
                }
                false => {
                    eprintln!("{}: {}: not found in '{}'", CRATE, needle, haystack);
                    exit!(1);
                }
            }
        }
        eprintln!("{}: no prefix found!", CRATE);
        exit!(1);
    }
    exit!(1);
}

#[macro_export]
macro_rules! exit {
    ($code:expr) => {
        std::process::exit($code)
    };
}
