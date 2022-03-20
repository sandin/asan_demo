// WARNING: THIS FILE IS USED FOR TESTING ONLY, *DO NOT* USE IT IN A PRODUCTION ENVIRONMENT
#ifndef LDS_ASAN_SAMPLE_H
#define LDS_ASAN_SAMPLE_H

#include <cstdlib>

int asan_sample_use_after_free() {
    char* x = (char*)malloc(10 * sizeof(char));
    free(x);
    return x[5]; // BOOM
}

int asan_sample_heap_out_of_bounds() {
    char* x = (char*)malloc(10 * sizeof(char));
    memset(x, 0, 10);
    int res = x[10 * 10];
    free(x);
    return res;
}

static int global_array[100] = { -1 };
int asan_sample_global_out_of_bounds() {
    return global_array[100 + 10];
}

#endif //LDS_ASAN_SAMPLE_H
