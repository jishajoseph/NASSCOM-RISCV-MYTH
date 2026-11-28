#include <stdio.h>
extern int load(int start, int end);
int main(void)
{
    int count = 9;
    int result = load(0, count + 1);
    printf("sum from 1 to %d is %d\n", count, result);
    return 0;
}
