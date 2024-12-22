global ft_strcmp

section .text

; int ft_strcmp(const char *s1, const char *s2)
; Arguments :
;   rdi = s1
;   rsi = s2
; Retour :
;   rax < 0 si s1 < s2
;   rax = 0 si s1 == s2
;   rax > 0 si s1 > s2

ft_strcmp:
    ; Pas besoin d'initialisation particulière, 
    ; mais on peut s'assurer que rax = 0 au cas où.
    xor rax, rax

loop_start:
    movzx rcx, byte [rsi] ; rcx = (unsigned char)*s2
    movzx rdx, byte [rdi] ; rdx = (unsigned char)*s1

    cmp rcx, rdx          ; Compare les deux caractères
    jne diff              ; Si différents, on calcule la différence

    test rcx, rcx         ; Vérifie si rcx est 0 (donc s2[i] == '\0')
    je end                ; Si c'est '\0', alors s1[i] == s2[i] == '\0', elles sont égales

    ; Sinon, on n'a pas atteint la fin, et les caractères sont égaux
    ; On avance les pointeurs pour comparer le suivant
    inc rsi
    inc rdi
    jmp loop_start

diff:
    ; Ici, rcx != rdx, on retourne (s1[i] - s2[i])
    ; Actuellement, rdx = s1[i], rcx = s2[i].
    ; strcmp(s1, s2) doit renvoyer (unsigned char)*s1 - (unsigned char)*s2
    sub rdx, rcx          ; rdx = rdx - rcx = s1[i] - s2[i]
    mov rax, rdx          ; Place le résultat dans rax
    ret

end:
    ; Si on sort par 'end', c'est que les chaînes sont identiques jusqu'au '\0'
    ; strcmp renvoie alors 0.
    ret
