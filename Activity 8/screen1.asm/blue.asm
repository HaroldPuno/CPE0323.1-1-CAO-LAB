TITLE screen2m.asm
dosseg
.model small
.stack
.code

start:
    mov ax, 0600h       ; Set video mode 80x25 color text
    mov bh, 00eh        ; Display page 0, attribute 14h (white text on blue background)
    mov cx, 0           ; Upper left corner (row 0, column 0)
    mov dx, 184fh       ; Lower right corner (row 24, column 79)
    int 10h             ; Call BIOS video interrupt

    mov ah, 02          ; Set cursor position
    mov dh, 10          ; Row 10
    mov dl, 1           ; Column 1
    int 10h             ; Call BIOS video interrupt

    mov ah, 09          ; Display string function
    mov dx, offset Text ; Load DX with the offset of the string
    int 21h             ; Call DOS interrupt

    mov ah, 4ch         ; Exit to DOS
    int 21h             ; Call DOS interrupt
	
    Text db 'Light Blue$' ; String to be displayed, $ denotes end of string

end start