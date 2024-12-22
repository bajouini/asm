NAME = libasm.a
SRC = ft_strlen.s ft_strcpy.s ft_strcmp.s ft_write.s ft_read.s ft_strdup.s
OBJ = $(SRC:.s=.o)

CC = gcc
NASM = nasm
NASM_FLAGS = -f elf64
CFLAGS = -Wall -Wextra -Werror

all: $(NAME)

$(NAME): $(OBJ)
	ar rcs $(NAME) $(OBJ)

%.o: %.s
	$(NASM) $(NASM_FLAGS) $< -o $@

clean:
	rm -f $(OBJ)

fclean: clean
	rm -f $(NAME) test_strlen test_strcpy test_strcmp test_write test_read test_strdup

re: fclean all

# Tests
strlen: $(NAME)
	$(CC) $(CFLAGS) tests/test_strlen.c $(NAME) -o test_strlen
	./test_strlen

strcpy: $(NAME)
	$(CC) $(CFLAGS) tests/test_strcpy.c $(NAME) -o test_strcpy
	./test_strcpy

strcmp: $(NAME)
	$(CC) $(CFLAGS) tests/test_strcmp.c $(NAME) -o test_strcmp
	./test_strcmp

write: $(NAME)
	$(CC) $(CFLAGS) tests/test_write.c $(NAME) -o test_write
	./test_write

read: $(NAME)
	$(CC) $(CFLAGS) tests/test_read.c $(NAME) -o test_read
	./test_read

strdup: $(NAME)
	$(CC) $(CFLAGS) tests/test_strdup.c $(NAME) -o test_strdup
	./test_strdup