; db --> define byte
; dw --> define word
; dd --> definde double word


gdt_start:
    dd 0x0
    dd 0x0

;GDT for code segment base: 0x00000000, length: 0xfffff
gdt_code:
    dw 0xffff ;segment length, bits 0-15
    dw 0x0 ; segment base, bist 0-15
    db 0x0 ; segemnt base, bist 16-23
    db 10011010b ; flags: 8 bits
    db 11001111b ; flags: 4 bits + segment length bits 16-19
    db 0x0 ; segment base: bist 24-31

;GDT for data segment
gdt_data:
    dw 0xffff
    dw 0x0
    db 0x0
    db 10010010b
    db 11001111b
    db 0x0

gdt_end:

;GDT descriptro:
    dw gdt_end -gdt_start -1 ; size 16 bit
    dd gdt_start

;constants
CODE_SEG equ gdt_code - gdt_start
DATA_SEG equ gdt_data -  gdt_start