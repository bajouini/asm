#include <stdio.h>
#include <string.h>

extern char *ft_strcpy(char *dest, const char *src);

int main() {
    char dest[50];
    const char *test_cases[] = {
        "Hello, World!",
        "",
        "42",
        "abcdefghijklmnopqrstuvwxyz",
        "1234567890",
        "Test with special chars: !@#$%^&*()",
        NULL
    };

    printf("Testing ft_strcpy:\n");

    for (int i = 0; test_cases[i] != NULL; i++) {
        const char *src = test_cases[i];
        ft_strcpy(dest, src);
        printf("Test case %d: \"%s\"\n", i + 1, src);
        printf("strcpy:     \"%s\"\n", strcpy(dest, src));
        printf("ft_strcpy:  \"%s\"\n", dest);
        printf("\n");
    }

    return 0;
}