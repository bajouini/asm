global  ft_read
extern  __errno_location

section .text

; ssize_t ft_read(int fd, void *buf, size_t count)
; Arguments (System V AMD64):
; rdi = fd
; rsi = buf
; rdx = count

; Retour :
;  - Si succès : rax = nombre d'octets lus (>= 0)
;  - Si erreur : rax = -1 et errno est mis à jour

ft_read:
    mov rax, 0         ; numéro du syscall pour read
    syscall             ; appel système

    cmp rax, 0
    jge .end            ; si rax >= 0, pas d'erreur, on sort directement

    ; Ici, rax < 0 => erreur
    neg rax             ; rax = -(-errno) = errno (valeur positive)
    mov rdi, rax        ; prépare l'argument pour __errno_location
    call __errno_location wrt ..plt
    mov [rax], edi      ; *errno = errno code
    mov rax, -1         ; retourne -1 comme la fonction read standard
.end:
    ret
