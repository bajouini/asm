#include <unistd.h>
#include <stdio.h>
#include <string.h>
#include <errno.h>

extern ssize_t ft_write(int fd, const void *buf, size_t count);

int main() {
    const char *msg = "Hello, ft_write!\n";

    // Test 1 : écriture sur stdout
    errno = 0;
    ssize_t ret = ft_write(1, msg, strlen(msg));
    printf("ft_write returned: %zd (errno: %d, message: %s)\n",
           ret, errno, strerror(errno));

    // Test 2 : écriture sur un fd invalide
    errno = 0;
    ret = ft_write(-1, msg, strlen(msg));
    printf("ft_write returned: %zd (errno: %d, message: %s)\n",
           ret, errno, strerror(errno));

    return 0;
}
