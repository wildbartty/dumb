#include <stdlib.h>
int main () {
char* x = NULL;
int * y = NULL;
int z = 0x30;
y = &z;
x = y;
printf("%s", x);

}
