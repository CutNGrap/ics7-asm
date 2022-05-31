#ifndef FUNCS_H
#define FUNCS_H

#define PI_1 3.14
#define PI_2 3.141596

float c_add32(float a, float b);
float c_mul32(float a, float b);
double c_add64(double a, double b);
double c_mul64(double a, double b);
long double c_add80(long double a, long double b);
long double c_mul80(long double a, long double b);

float asm_add32(float a, float b);
float asm_mul32(float a, float b);
double asm_add64(double a, double b);
double asm_mul64(double a, double b);
long double asm_add80(long double a, long double b);
long double asm_mul80(long double a, long double b);

long double asm_sin(long double a);
long double asm_pi();

#endif //FUNCS_H