
#include "libasm.h"

# define LEN(x) printf("%s = %ld | real (%ld)\n", x, ft_strlen(x), strlen(x));
# define WRITE(x, str, len) printf("%s = %ld | real (%ld)\n", str, ft_write(x, str, len), write(x, str, len));

int main(void){
	printf("Test strlen\n");
	LEN("Test");
	LEN("12345678iukhjgfd");
	LEN("4rtuyhjngbfdvfsdfthgfbf");
	LEN("12erteyhfbdvs\r\t");
	LEN("");
	LEN("Il\0 n'y a rien");

	printf("Test write\n");
	WRITE(1, "Hey", strlen("Hey"));
	WRITE(1, "", strlen(""));
	WRITE(2, "Kekw", strlen("kekw"));

	return EXIT_SUCCESS;
}