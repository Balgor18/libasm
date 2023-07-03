
#include "libasm.h"

# define STOP_BAR "################################\n"
# define BUFFER_SIZE 15
# define LEN(x) printf("%s = %ld | real (%ld)\n", x, ft_strlen(x), strlen(x));
# define WRITE(x, str, len) printf("%s = %ld | real (%ld)\n", str, ft_write(x, str, len), write(x, str, len));
# define STRCMP(s1, s2) printf("%s\n%s\nme = %d | real = %d\n", s1, s2, ft_strcmp(s1, s2), strcmp(s1, s2));
# define STRDUP(s1, s2) printf("%s\n%s\nAddr me = %p | addr real = %pp\n", s1, s2, s1, s2);

void	test_strlen()
{
	LEN("Test");
	LEN("12345678iukhjgfd");
	LEN("4rtuyhjngbfdvfsdfthgfbf");
	LEN("12erteyhfbdvs\r\t");
	LEN("");
	LEN("Il\0 n'y a rien");
}

void	test_write()
{
	WRITE(1, "Hey", strlen("Hey"));
	WRITE(1, "", strlen(""));
	WRITE(2, "Kekw", strlen("kekw"));
}

bool	test_read(char *filename)
{
		int fd = open(filename, O_RDONLY);
	if (fd == -1){
		dprintf(2, "File not found\n");
		return false;
	}
	char str[BUFFER_SIZE + 1];
	
	str[BUFFER_SIZE] = '\0';
	int ret = ft_read(fd, str, BUFFER_SIZE);
	close(fd);
	if (ret == -1)
		perror("");
	printf("ret %d, %s\n", ret, str);
	return true;
}

void	test_strcpy(char *dest, char *src)
{
	char *cpy = strcpy(dest, src);
	printf("Real %s\n", cpy);

	cpy = ft_strcpy(dest, src);
	printf("me %s\n", cpy);

}

void	test_strcmp()
{
	STRCMP("Kekw", "Kekz");
	STRCMP("Abcdeg", "Abcdef");
	STRCMP("Salut", "Salut1");
}

int main(void){
	printf(STOP_BAR"Test strlen\n");
	test_strlen();
	printf(STOP_BAR"Test write\n");
	test_write();

	printf(STOP_BAR"Test read\n");
	if (!test_read("Makefile"))
		return EXIT_FAILURE;
	if (!test_read("/dev/null"))
		return EXIT_FAILURE;
	printf(STOP_BAR"Test strcpy\n");

	char dest[100] = "Hello everybody\0";
	char src[100] = "World\0";
	test_strcpy(dest, src);

	printf(STOP_BAR"Test strcmp\n");
	test_strcmp();

	printf(STOP_BAR"Test strdup\n");
	char *test2 = "Yolo everyone";
	char *test = ft_strdup(test2);
	STRDUP(test, test2)
	free(test);
	return EXIT_SUCCESS;
}