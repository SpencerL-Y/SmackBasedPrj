#include <stdlib.h>


int main()
{
    union {
        void *p0;
        struct {
            char c[2];
            void *p1;
            void *p2;
        } str;
    } data;
    data.p0 = malloc(37U);
    data.str.p2 = &data;
    free(data.p0);
    return 0;
}
