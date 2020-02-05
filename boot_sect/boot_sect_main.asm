[org 0x7c00]
    mov bp, 0x8000
    mov sp, bp
    mov bx, 0x9000
    mov dh, 2 ; read 2 sectors

    call disk_load

    mov dx, [0x9000] ; first loaded word
    call print_hex

    call print_nl

    mov dx, [0x9000 + 512] ; first word from second sector
    call print_hex

    jmp $

%include "boot_sect_functions/boot_sect_print.asm"
%include "boot_sect_functions/boot_sect_print_hex.asm"
%include "boot_sect_disk.asm"

times 510 - ($-$$) db 0
dw 0xaa55

times 256 dw 0xdada ; sector 2 = 512 bytes
times 256 dw 0xface ; sector 3 = 512 bytes