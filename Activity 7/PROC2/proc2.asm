TITLE proc2.asm
.model small
.stack 200h
.data
.code
main proc
	mov ax,@data
	mov ds,ax
	xor al,al
	mov cx,16 
	lp1: push ax
	call out1hex
	call pcrlf
	pop ax
	inc al
	loop lp1
	Mov ax, 4c00h
	Int 21h
 
	Main endp
 
	
 
	Pcrlf proc
 
	Mov dl,0ah 
	Mov ah,2
	Int 21h 
	Mov dl,0dh 
	Mov ah,2
	Int 21h
	Ret
 
	Pcrlf endp
 
	Out1hex proc
 
	and al, 0fh 
	Cmp al,9 
	Ja ischar
	Add al,30h 
	Jmp printit
	ischar: add al,37h 
	printit: Mov dl,al
	Mov ah,2
	Int 21h 
	Ret
 
	Out1hex endp
	End main