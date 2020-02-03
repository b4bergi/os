disk_load:
    pusha
    push dx

    mov ah, 0x02 ;function: 0x02 = "read"
    mov al, dh ; sectors to read: 0x01 - 0x80
    mov cl, 0x02 ; sector: 0x01 - 0x11

    mov ch, 0x00