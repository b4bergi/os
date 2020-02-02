[org 0x7c00]
mov ah, 0x0e

mov bx, teststring
call print

jmp $

%include "print.asm"

teststring:
    db 'Hello World!', 0

times 510 - ($-$$) db 0
dw 0xaa55 

