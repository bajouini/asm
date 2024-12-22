#include <unistd.h>
#include <stdio.h>
#include <string.h>
#include <errno.h>

extern ssize_t ft_read(int fd, void *buf, size_t count);

int main() {
    char buf[50];
    ssize_t ret;

    // Test 1 : lire depuis stdin (taper quelque chose dans le terminal)
    errno = 0;
    ret = ft_read(0, buf, 49);
    if (ret >= 0) {
        buf[ret] = '\0';
        printf("Read %zd bytes: \"%s\"\n", ret, buf);
    } else {
        printf("ft_read returned: %zd (errno: %d, message: %s)\n", ret, errno, strerror(errno));
    }

    // Test 2 : lire depuis un fd invalide
    errno = 0;
    ret = ft_read(-1, buf, 10);
    printf("ft_read returned: %zd (errno: %d, message: %s)\n", ret, errno, strerror(errno));

    return 0;
}
