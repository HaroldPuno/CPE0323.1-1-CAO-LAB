TITLE password.asm
dosseg
.model small
.stack
.data
    password db "password123", "$" ; Define the correct password
    input_buffer db 11, "$"         ; Buffer to store user input (10 characters + "$")
    stars db 10 dup('*'), "$"       ; Buffer to display stars for password entry
    correct_msg db 13, 10, "Password is CORRECT!$"
    incorrect_msg db 13, 10, "Password is INCORRECT!$"
.code
main proc
    mov ax, @data
    mov ds, ax
 
    ; Prompt user to enter the password
    mov dx, offset input_prompt
    mov ah, 09h
    int 21h
 
    ; Accept user input
    mov dx, offset input_buffer
    mov ah, 0ah
    int 21h
 
    ; Display stars instead of the actual password
    mov dx, offset stars
    mov ah, 09h
    int 21h
 
    ; Check if the entered password matches the correct password
    mov si, offset password     ; Load address of correct password
    mov di, offset input_buffer ; Load address of user input
    mov cx, 10                  ; Number of characters to compare
compare_loop:
    mov al, [si]    ; Load character from correct password
    cmp al, '$'     ; Check for end of password
    je end_compare  ; Exit loop if end of password reached
    cmp al, [di]    ; Compare with user input character
    jne incorrect   ; Jump to "incorrect" label if characters don't match
    inc si          ; Move to next character in correct password
    inc di          ; Move to next character in user input
    loop compare_loop  ; Continue comparing characters
end_compare:
    cmp al, [di]    ; Check if both strings ended at the same time
    jne incorrect   ; If not, password is incorrect
    ; If control reaches here, password is correct
    mov dx, offset correct_msg
    jmp print_message
 
incorrect:
    mov dx, offset incorrect_msg
 
print_message:
    mov ah, 09h     ; Print message
    int 21h
 
    mov ax, 4c00h   ; Exit program
    int 21h
main endp
 
input_prompt db 13, 10, "Enter the password: $"
 
end main