
#include "libasm.h"
# define LEN(x) printf("%s = %ld | real (%ld)\n", x, ft_strlen(x), strlen(x));

int main(void){
    printf("Test strlen\n");
    LEN("Test");
    LEN("12345678iukhjgfd");
    LEN("4rtuyhjngbfdvfsdfthgfbf");
    LEN("12erteyhfbdvs\r\t");
    LEN("");
    LEN("Il\0 n'y a rien");

    return EXIT_SUCCESS;
}