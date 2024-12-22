#include <stdio.h>
#include <string.h>

extern size_t ft_strlen(const char *str);

int main() {
    const char *test_cases[] = {
        "Hello, World!",
        "",
        "42",
        "abcdefghijklmnopqrstuvwxyz",
        "1234567890",
        "Test with special chars: !@#$%^&*()",
        NULL
    };

    printf("Testing ft_strlen:\n");

    for (int i = 0; test_cases[i] != NULL; i++) {
        const char *str = test_cases[i];
        printf("Test case %d: \"%s\"\n", i + 1, str);
        printf("strlen:     %zu\n", strlen(str));
        printf("ft_strlen:  %zu\n", ft_strlen(str));
        printf("\n");
    }

    return 0;
}