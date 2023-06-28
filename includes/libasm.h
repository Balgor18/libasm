#ifndef LIBASM_H
# define LIBASM_H

# include <unistd.h>
# include <stdio.h>
# include <stdlib.h>
# include <string.h>
# include <sys/errno.h>
# include <fcntl.h>

size_t		ft_strlen(const char *s);
size_t		ft_write(int fd, const void *buf, size_t nbyte);
size_t		ft_read(int fildes, void *buf, size_t nbyte);

#endif