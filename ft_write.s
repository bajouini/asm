global  ft_write
extern  __errno_location

section .text

; ssize_t ft_write(int fd, const void *buf, size_t count)
; Arguments (calling convention System V AMD64):
; rdi = fd
; rsi = buf
; rdx = count

ft_write:
    ; On met le numéro du syscall dans rax
    mov rax, 1            ; write = 1
    syscall                ; appel système

    ; Après le syscall :
    ; - Si rax >= 0 : succès, rax contient le nombre d’octets écrits
    ; - Si rax < 0 : échec, rax contient -errno

    cmp rax, 0
    jge .end              ; si rax >= 0, on a réussi, on retourne directement

    ; Ici, rax < 0, donc il s’agit d’une erreur
    ; On met l’erreur positive dans errno
    ; rax contient -errno, on le rend positif :
    neg rax               ; rax = -(-errno) = errno code positif
    mov rdi, rax          ; on met errno code dans rdi pour l’appeler avec __errno_location
    call __errno_location wrt ..plt ; renvoie un pointeur vers errno
    mov [rax], edi        ; on met errno code dans *errno
    mov rax, -1           ; write doit retourner -1 en cas d’erreur

.end:
    ret
