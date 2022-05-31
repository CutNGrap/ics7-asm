#include <stdio.h>
#include <time.h>

#include "funcs.h"

#define N 1e+6
#define MY_TIME(func) do                                                \
{                                                                       \
    clock_t t;                                         \
    t = clock();                                     \
    for (int i = 0; i < N; i++)                                         \
        func(&a, &b);                                                 \
    t = clock() - t;                                      \
                                                                      \
    printf("%s: %lf nsec\n", #func, ((double)t)/CLOCKS_PER_SEC * 1e+9 / N);       \
} while (0);

void print_vector(vector_t *a)
{
    printf("%f %f %f\n", a->arr[0], a->arr[1], a->arr[2]);
}

float c_scal_mul(vector_t *a, vector_t *b)
{
    return a->arr[0] * b->arr[0] + a->arr[1] * b->arr[1] + a->arr[2] * b->arr[2];
}

float asm_scal_mul(vector_t *a, vector_t *b)
{
    float res = 0.0;
    asm
    (
        ".intel_syntax noprefix \n\t"
        "movaps xmm0, %1 \n \t"    
        "movaps xmm1, %2 \n \t"    
        "mulps xmm0, xmm1 \n \t"           // Параллельное умножение четырех пар float       
        "movhlps xmm1, xmm0 \n \t"               // Копирует старшие 64 бита источника в младшие 64 бита приемника
        "addps xmm0, xmm1 \n \t"            //Параллельное сложение четырех пар float
        "movaps xmm1, xmm0 \n \t"
        "shufps xmm0, xmm0, 1 \n \t"        //В младшие два числа приемника помещает 2 из четырех чисел, находившихся в приемнике
        "addps xmm0, xmm1 \n \t"
        "movss %0, xmm0 \n \t"              //Копирует младшие 64 бита из источника в приемник
        : "=m"(res)
        : "m"(a->arr),"m"(b->arr)
    );
    return res;
}

int main()
{
    vector_t a = {1.0, 1.0, 6.0};
    vector_t b = {1.0, 3.0, 6.0};

    MY_TIME(c_scal_mul);
    MY_TIME(asm_scal_mul);
    printf("%f\n", c_scal_mul(&a, &b));
    printf("%f\n", asm_scal_mul(&a, &b));

    return 0;
}

