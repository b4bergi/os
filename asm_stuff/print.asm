print:
    pusha

start:
    mov al, [bx] ; bx = start adress of string
    cmp al, 0
    je done ; jump to end if 0

    mov ah, 0x0e
    int 0x10

    add bx, 1
    jmp start
done:
    call print_new_line
    popa
    ret

print_new_line:
    mov al, 0x0a ; newline character
    int 0x10
    mov al, 0x0d; carriage return
    int 0x10
    ret;