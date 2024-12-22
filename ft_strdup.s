global  ft_strdup
extern  ft_strlen
extern  ft_strcpy
extern  malloc

section .text

; char *ft_strdup(const char *s)
; Entrée : rdi = s (pointeur sur la chaîne source)
; Sortie : rax = pointeur sur la copie allouée, ou NULL si échec

ft_strdup:
    ; On sauvegarde s dans rsi pour pouvoir le réutiliser après ft_strlen
    mov rsi, rdi          ; rsi = s

    ; Appel ft_strlen(s) : attend s dans rdi
    ; rdi = s est déjà bon
    call ft_strlen        ; rax = longueur de s sans le '\0'
    
    add rax, 1            ; On ajoute 1 pour le caractère de fin '\0'
    mov rdi, rax          ; Prépare l'argument pour malloc (taille = longueur + 1)
    call malloc wrt ..plt ; Appel malloc via PLT, nécessaire pour PIE

    test rax, rax         ; Vérifie si malloc a retourné NULL
    je .alloc_fail

    ; Si on arrive ici, malloc a réussi
    ; rax = pointeur alloué (dest)
    ; rsi = s (source) est resté intact
    ; On doit copier s dans dest
    ; ft_strcpy(dest, src) : rdi = dest, rsi = src
    mov rdi, rax          ; rdi = dest
    ; rsi = s déjà en place
    call ft_strcpy        ; Copie s dans dest
    ret                   ; rax contient dest (retour de ft_strcpy)

.alloc_fail:
    xor rax, rax          ; rax = 0 pour retourner NULL
    ret
