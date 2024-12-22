global ft_strcpy

section .text

; char *ft_strcpy(char *dest, const char *src)
; rdi = dest
; rsi = src
; Retour : rax = dest

ft_strcpy:
    mov rcx, rdi        ; On sauvegarde l'adresse initiale de dest dans rcx

strcpy_loop_start:
    cmp byte [rsi], 0    ; Compare le caractère source courant à '\0'
    je strcpy_loop_end    ; Si '\0', on quitte la boucle

    mov dl, [rsi]         ; On charge le caractère de src dans dl (8 bits)
    mov [rdi], dl         ; On écrit ce caractère dans dest
    inc rsi               ; Avance src
    inc rdi               ; Avance dest
    jmp strcpy_loop_start

strcpy_loop_end:
    mov byte [rdi], 0      ; Ajout du '\0' final
    mov rax, rcx           ; On remet l'adresse initiale de dest dans rax pour le retour
    ret
