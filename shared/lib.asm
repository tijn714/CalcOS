clear_screen:
    mov ah, 0x06      ; function 0x06: scroll window up
    mov al, 0x00      ; clear entire screen
    mov cx, 0x00      ; upper left corner row and column
    mov dx, 0x184F    ; lower right corner row and column (80x25 text mode)
    int 0x10
    ret