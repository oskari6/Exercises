#include <stdio.h>

int main()
{
    //initialization
    //comparison
    //update

    int max;
    scanf("%d", &max);

    int i;
    for (; max >= 0; max = max - 2)
    {
        printf("%d\n", max);
    }

    return 0;
}