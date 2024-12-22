global ft_strlen

section .text

; size_t ft_strlen(const char *s)
; Arguments : 
;   rdi = s (pointeur sur la chaîne de caractères)
; Retour :
;   rax = longueur de la chaîne (sans compter le '\0')

ft_strlen:
    xor rax, rax        ; rax servira de compteur (initialisé à 0)
    
strlen_loop_start:
    cmp byte [rdi], 0    ; Compare le caractère pointé par rdi à '\0'
    je strlen_loop_end   ; Si c'est '\0', on a atteint la fin de la chaîne

    inc rax              ; Incrémente le compteur de longueur
    inc rdi              ; Avance le pointeur sur le caractère suivant
    jmp strlen_loop_start

strlen_loop_end:
    ret                  ; Retourne la longueur dans rax
