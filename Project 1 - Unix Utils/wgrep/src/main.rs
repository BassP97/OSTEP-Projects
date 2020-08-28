use std::fs::File;
use std::io::{self, BufRead};
use std::path::Path;
use std::env;

fn main() {
    let args: Vec<String> = env::args().collect();
    let query = &args[1];
    let file_to_search = &args[2];
    if let Ok(lines) = read_lines("./".to_owned()+&file_to_search){
        for line in lines{
            if let Ok(ip) = line{
                if ip.contains(query){
                    println!("{}",ip);
                }
            }
        }
    }
    
}

fn read_lines<P>(filename: P) -> io::Result<io::Lines<io::BufReader<File>>>
where P: AsRef<Path>, {
    let file = File::open(filename)?;
    Ok(io::BufReader::new(file).lines())
}