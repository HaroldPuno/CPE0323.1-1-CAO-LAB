TITLE screen1b.asm
.model small
.stack
.data
.code
start:

mov ax, 0600h
mov bh, 00eh
mov cx, 0
mov dx, 0184fh
int 10h

mov ah, 02
mov bh, 0
mov dh, 10
mov bh, 0ch
int 10h

mov ah, 02
mov dl, 'T'
int 21h

mov ah, 02
mov dl, 'I'
int 21h

mov ah, 02
mov dl, 'P'
int 21h

mov ah, 4ch
int 21h
      end start