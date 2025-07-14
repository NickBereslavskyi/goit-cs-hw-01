org 0x100               ; Вказуємо, що це програма .COM

section .data
    a db 5              ; a = 5
    b db 3              ; b = 3
    c db 2              ; c = 2
    resultMsg db 'Result: $'  ; Повідомлення перед числом

section .text
_start:
    mov al, [b]         ; AL = b
    sub al, [c]         ; AL = b - c
    add al, [a]         ; AL = b - c + a

    ; Перетворення числа в ASCII символ (працює для однозначних чисел)
    add al, 30h         ; Перетворення в ASCII

    ; Виведення рядка "Result: "
    mov ah, 09h
    lea dx, resultMsg
    int 21h

    ; Виведення результату
    mov dl, al
    mov ah, 02h
    int 21h

    ; Завершення програми
    mov ax, 4C00h
    int 21h
