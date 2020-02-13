; [bits 16] / [bits 32] tells compiler to use 16 or 32 bit instructions

[org 0x7c00]
    mov bp, 0x9000 ; set stack
    mov sp, bp
    mov bx, MSG_REAL_MODE
    call print ; written after bios messages

    call switch_to_pm
    jmp $ ; <-- never executed

%include "../boot_sect_functions/boot_sect_print.asm"
%include "../32bit-gdt/32bit-gdt.asm"
%include "../32bit-print/32bit-print.asm"
%include "./32bit-switch.asm"


[bits 32]
BEGIN_PM:
    mov ebx, MSG_PROT_MODE
    call print_string_pm ; written in top left corner
    jmp $


MSG_REAL_MODE db "Started in 16-bit real mode", 0
MSG_PROT_MODE db "Loaded in 32-bit protected mode", 0

; bootsector
times 510-($-$$) db 0
dw 0xaa55