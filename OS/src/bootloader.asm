org 0x7C00         

section .text
start:
    mov ah, 0x0E   
    mov si, msg    

print_loop:
    lodsb           ; Load byte at DS:SI into AL and increment SI
    or al, al      ; Check if we reached the null terminator
    jz done         ; If zero, we are done
    int 0x10       ; Call BIOS to print character in AL
    jmp print_loop  ; Repeat

done:
    jmp done        ; Infinite loop

msg db 'Hello, World!', 0  ; Null-terminated string

times 510 - ($ - $$) db 0  ; Fill the rest of the sector with zeros
dw 0xAA55                  ; Boot signature
