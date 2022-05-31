#include <stdio.h>
#include <time.h>

#include "funcs.h"

#define N 1e+6
#define MY_TIME(func) do                                                \
{                                                                       \
    clock_t t;                                         \
    t = clock();                                     \
    for (int i = 0; i < N; i++)                                         \
        func(5.0, 3.0);                                                 \
    t = clock() - t;                                      \
                                                                      \
    printf("%s: %lf nsec\n", #func, ((double)t)/CLOCKS_PER_SEC * 1e+9 / N);       \
} while (0);


int main()
{
    MY_TIME(c_add32);
    MY_TIME(asm_add32);
    printf("\n");

    MY_TIME(c_mul32);
    MY_TIME(asm_mul32);
    printf("\n");

    MY_TIME(c_add64);
    MY_TIME(asm_add64)
    printf("\n");

    MY_TIME(c_mul64);
    MY_TIME(asm_mul64)
    printf("\n");

    MY_TIME(c_add80);
    MY_TIME(asm_add80)
    printf("\n");

    MY_TIME(c_mul80);
    MY_TIME(asm_mul80)
    printf("\n");

    printf("pi = %le; sin(pi) = %Le; sin(pi/2) = %Le\n", PI_1, asm_sin(PI_1), asm_sin(PI_1 / 2));
    printf("pi = %le; sin(pi) = %Le; sin(pi/2) = %Le\n", PI_2, asm_sin(PI_2), asm_sin(PI_2 / 2));
    printf("pi = %Le; sin(pi) = %Le; sin(pi/2) = %Le\n", asm_pi(), asm_sin(asm_pi()), asm_sin(asm_pi() / 2));//
    return 0;
}


float c_add32(float a, float b){return a + b;}
float c_mul32(float a, float b){return a * b;}
double c_add64(double a, double b){return a + b;}
double c_mul64(double a, double b){return a * b;}
long double c_add80(long double a, long double b){return a + b;}
long double c_mul80(long double a, long double b){return a * b;}
//
float asm_add32(float a, float b)
{
    float c; 
    asm(
        ".intel_syntax noprefix\n\t"
        "fld %1\n\t"                    
        "fld %2\n\t"                    
        "faddp\n\t"                     
        "fstp %0\n\t"                   
        : "=&m"(c)
        : "m"(a),"m"(b)
    );
    return c;
}
float asm_mul32(float a, float b)
{
    float c; 
    asm(
        ".intel_syntax noprefix\n\t"
        "fld %1\n\t"                    
        "fld %2\n\t"                    
        "fmulp\n\t"                     
        "fstp %0\n\t"                   
        : "=&m"(c)
        : "m"(a),"m"(b)
    );
    return c;
}

double asm_add64(double a, double b)
{
    double c; 
    asm(
        ".intel_syntax noprefix\n\t"
        "fld %1\n\t"                    
        "fld %2\n\t"                    
        "faddp\n\t"                     
        "fstp %0\n\t"                   
        : "=&m"(c)
        : "m"(a),"m"(b)
    );
    return c;
}

double asm_mul64(double a, double b)
{
    double c; 
    asm(
        ".intel_syntax noprefix\n\t"
        "fld %1\n\t"                    
        "fld %2\n\t"                    
        "fmulp\n\t"                     
        "fstp %0\n\t"                   
        : "=&m"(c)
        : "m"(a),"m"(b)
    );
    return c;
}

long double asm_add80(long double a, long double b)
{
    long double c; 
    asm(
        ".intel_syntax noprefix\n\t"
        "fld %1\n\t"                    
        "fld %2\n\t"                    
        "faddp\n\t"                     
        "fstp %0\n\t"                   
        : "=&m"(c)
        : "m"(a),"m"(b)
    );
    return c;
}

long double asm_mul80(long double a, long double b)
{
    long double c; 
    asm(
        ".intel_syntax noprefix\n\t"
        "fld %1\n\t"                    
        "fld %2\n\t"                    
        "fmulp\n\t"                     
        "fstp %0\n\t"                   
        : "=&m"(c)
        : "m"(a),"m"(b)
    );
    return c;
}


long double asm_sin(long double a) 
{
    long double s;

    asm(
        ".intel_syntax noprefix\n\t"
        "fld %1\n\t" 
        "fsin\n\t"
        "fstp %0\n\t"
        :"=&m"(s)
        :"m"(a)
    );

    return s;
}

long double asm_pi() 
{
    long double p;

    asm(
        ".intel_syntax noprefix\n\t"
        "fldpi\n\t"
        "fstp %0\n\t"
        :"=&m"(p)
    );

    return p;
}