use std::env;
use std::fs::File;
use std::io::prelude::*;
use std::io;


fn main() -> std::io::Result<()> {
    let args: Vec<String> = env::args().collect();
    let file_to_open = &args[1];
    let mut file = File::open(file_to_open)?;
    let stdout = io::stdout();
    let mut stdout = stdout.lock();
    //if only it was this easy in C!
    io::copy(&mut file, &mut stdout)?;
    Ok(())
}
