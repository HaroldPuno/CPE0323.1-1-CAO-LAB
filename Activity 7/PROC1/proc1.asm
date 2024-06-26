TITLE proc1.asm
.model small
.stack 100h
.data
.code

main proc
    mov ax, @data
    mov ds, ax
    xor al, al
    mov cx, 16
lp1:
    push ax
    call out1hex
    call pcrlf
    pop ax
    inc al
    loop lp1
    mov ax, 4c00h
    int 21h
main endp

Out1hex proc
    and al, 0fh
    cmp al, 9
    ja ischar
    add al, 30h
    jmp printit
ischar:
    add al, 37h
printit:
    mov dl, al
    mov ah, 2
    int 21h
    ret
Out1hex endp

Pcrlf proc
    mov dl, 0ah
    mov ah, 2
    int 21h
    mov dl, 0dh
    mov ah, 2
    int 21h
    ret
Pcrlf endp

end main