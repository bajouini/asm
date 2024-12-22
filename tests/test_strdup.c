#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <errno.h>

extern char *ft_strdup(const char *s);

int main() {
    const char *original = "Hello, strdup!";
    char *copy = ft_strdup(original);
    if (copy) {
        printf("Original: %s\nCopy: %s\n", original, copy);
        free(copy);
    } else {
        printf("ft_strdup failed\n");
    }

    // Test avec une chaîne vide
    copy = ft_strdup("");
    if (copy) {
        printf("Empty string duplicated: \"%s\"\n", copy);
        free(copy);
    }

    return 0;
}
