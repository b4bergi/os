disk_load:
    pusha
    push dx

    mov ah, 0x02 ;function: 0x02 = "read"
    mov al, dh ; sectors to read: 0x01 - 0x80
    mov cl, 0x02 ; sector: 0x01 - 0x11

    mov ch, 0x00
    mov dh, 0x00

    int 0x13 ; bios interrupt
    jc disk_error ; if error

    pop dx
    cmp al, dh 
    jne sectors_error
    popa
    ret

disk_error:
    mov bx, disk_error
    call print
    call print_nl
    mov dh, ah ; ah is error code
    call print_hex
    jmp disk_loop

sectors_error:
    mov bx, SECTORS_ERROR
    call print

disk_loop:
    jmp $


DISK_ERROR: db "Disk read error", 0
SECTORS_ERROR: db "Incorrect number of sectors read", 0