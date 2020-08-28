use std::fs::File;
use std::io::{self, BufRead};
use std::path::Path;
use std::env;
use std::char;

fn main() {
    let args: Vec<String> = env::args().collect();
    let file_to_search = &args[1];
    let mut res_vect = Vec::new();
    if let Ok(lines) = read_lines("./".to_owned()+&file_to_search){
        for line in lines{
            if let Ok(ip) = line{
                let res: Vec<char> = ip.chars().collect();
                for x in (0..res.len()).step_by(2){
                    let curr_number_chr = res[x];
                    let curr_number = char::to_digit(curr_number_chr,10).unwrap();
                    let curr_chr = res[x+1];
                    for _i in 0..curr_number{
                        res_vect.push(curr_chr);
                    }
                }
            }
        }
    }
    let ret: String = res_vect.into_iter().collect();
    println!("{}",ret);
}

fn read_lines<P>(filename: P) -> io::Result<io::Lines<io::BufReader<File>>>
where P: AsRef<Path>, {
    let file = File::open(filename)?;
    Ok(io::BufReader::new(file).lines())
}