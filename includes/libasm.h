#ifndef LIBASM_H
# define LIBASM_H

# include <unistd.h>
# include <stdio.h>
# include <stdlib.h>
# include <string.h>
# include <sys/errno.h>
# include <fcntl.h>
# include <stdbool.h>

size_t		ft_strlen(const char *s);
size_t		ft_write(int fd, const void *buf, size_t nbyte);
size_t		ft_read(int fildes, void *buf, size_t nbyte);
char *		ft_strcpy(char * dst, const char * src);
int			ft_strcmp(const char *s1, const char *s2);

#endif