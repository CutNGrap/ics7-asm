#include <stdio.h>
#include <string.h>


extern void my_copy(char *dst, char *src, int len);

int main()
{
    setbuf(stdout, NULL);

    char before[150] = {'0'}, *middle = before + 10, *after = middle + 10;
    char string[] = "My_test string for asm";
    int len = 0;

    __asm__(
        ".intel_syntax noprefix\n\t" // текст asm вставки
        "mov ecx, 0\n\t" // поместить в ecx максимальное 32-разрядное число
        "not ecx\n\t"

        "mov al, 0\n\t"
        "lea rdi, [%1]\n\t" // поместить в di 1-ый параметр - указатель на начало string
        "repne scasb\n\t" //Сравнить байт по адресу ES:DI с AL
        "not ecx\n\t"
        "dec ecx\n\t"
        "mov eax, ecx\n\t"
        "mov %0, eax\n\t" // поместить в 0-ой параметр (len) длину из eax
        : "=r" (len)                // список выходных параметров
        : "r" (string)              // список входных параметров
        : "ecx", "eax", "al", "rdi" // список разрушаемых регистров
    );

    printf("ASM length: %d\nC length: %d\n\n", len, strlen(string));

    char *copy;

    copy = string;
    my_copy(copy, string, len + 1);
    printf("Copy equal:\nORIGINAL: %s\n    COPY: %s\n\n", string, copy);

    my_copy(middle, string, len + 1);
    printf("Copy no cross:\nORIGINAL: %s\n    COPY: %s\n\n", string, middle);

    printf("Copy before:\nORIGINAL: %s\n",middle);
    my_copy(before, middle, len + 1);
    printf("    COPY: %s\n\n", before);

    printf("Copy after:\nORIGINAL: %s\n",middle);
    my_copy(after, middle, len + 1);
    printf("    COPY: %s\n\n", after);



    return 0;
}