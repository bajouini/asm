#include <stdio.h>
#include <string.h>

extern int ft_strcmp(const char *s1, const char *s2);

int main() {
    const char *test_cases[][2] = {
        {"Hello", "Hello"},
        {"Hello", "World"},
        {"World", "Hello"},
        {"42", "42"},
        {"", ""},
        {"A", "B"},
        {"B", "A"},
        {"", "NonEmpty"},
        {"NonEmpty", ""},
        {NULL, NULL}
    };

    printf("Testing ft_strcmp:\n");

    for (int i = 0; test_cases[i][0] != NULL; i++) {
        const char *s1 = test_cases[i][0];
        const char *s2 = test_cases[i][1];
        printf("Test case %d:\n", i + 1);
        printf("s1: \"%s\", s2: \"%s\"\n", s1, s2);
        printf("strcmp:    %d\n", strcmp(s1, s2));
        printf("ft_strcmp: %d\n\n", ft_strcmp(s1, s2));
    }

    return 0;
}