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
                let mut res = ip.chars();
                let mut curr = res.next().unwrap();
                let mut num_chrs = 1;
                for chr in res{
                    if chr != curr && chr != ' '{
                        let to_push = char::from_digit(num_chrs,10).unwrap();
                        res_vect.push(to_push);
                        res_vect.push(curr);
                        curr = chr;
                        num_chrs = 1;
                    }else{
                        num_chrs+=1;
                    }
                }
                let to_push = char::from_digit(num_chrs,10).unwrap();
                res_vect.push(to_push);
                res_vect.push(curr);
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