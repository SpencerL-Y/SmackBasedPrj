#include <stdlib.h>
typedef struct {
    void *lo;
    void *hi;
} TData;

int main(){
    TData data;
    TData* pdata = &data;

    TData c;
    pdata->lo = malloc(16);
    pdata->hi = malloc(24);
    return 0;
}