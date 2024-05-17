TITLE screen2n.asm
dosseg
.model small
.stack
.code

start:
    mov ax, @data     ; Load the data segment address into AX
    mov ds, ax        ; Set DS to point to the data segment

    mov ax, 03h       ; Set video mode to 80x25 color text
    int 10h           ; Call BIOS video interrupt

    ; Draw the first rectangle with color 40h (black background, white text)
    mov ax, 0b800h    ; Load the address of the video memory into AX
    mov es, ax        ; Set ES to point to the video memory
    mov ah, 06h       ; BIOS function to scroll window up
    mov cl, 00h       ; Column start position (0)
    mov ch, 00h       ; Row start position (0)
    mov dl, 4fh       ; Column end position (79)
    mov dh, 15h       ; Row end position (20)
    mov bh, 40h       ; Attribute (black background, white text)
    int 10h           ; Call BIOS video interrupt

    ; Draw the second rectangle with color 20h (black background, light green text)
    mov ah, 06h       ; BIOS function to scroll window up
    mov cl, 00h       ; Column start position (0)
    mov ch, 0dh       ; Row start position (13)
    mov dl, 19h       ; Column end position (25)
    mov dh, 15h       ; Row end position (20)
    mov bh, 20h       ; Attribute (black background, light green text)
    int 10h           ; Call BIOS video interrupt

    ; Draw the third rectangle with color 10h (black background, light cyan text)
    mov ah, 06h       ; BIOS function to scroll window up
    mov cl, 35h       ; Column start position (53)
    mov ch, 0dh       ; Row start position (13)
    mov dl, 4fh       ; Column end position (79)
    mov dh, 15h       ; Row end position (20)
    mov bh, 10h       ; Attribute (black background, light cyan text)
    int 10h           ; Call BIOS video interrupt

    ; Delay before exiting to keep the rectangles visible
    mov cx, 0FFFFh    ; Set up delay loop counter
delay_loop:
    dec cx            ; Decrement CX
    jnz delay_loop    ; Loop until CX is zero

    ; Exit the program
    mov ax, 4c00h     ; DOS function to terminate with return code 0
    int 21h           ; Call DOS interrupt

end start
