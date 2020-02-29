#![no_std] // no standard library --> no println!("Hello, world!");
#![no_main] //disable rust-level entry points

use core::panic::PanicInfo;

mod vga_buffer;

// function is called on panic:
#[panic_handler]
fn panic(_info: &PanicInfo)-> ! {
    loop{}
}

#[no_mangle]
pub extern "C" fn _start() -> ! {
    println!("Hello World{}", "!");
    loop {}
}
