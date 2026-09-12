#include <stddef.h>
#include <stdint.h>

void *memcpy(void *destination, const void *source, size_t count)
{
    unsigned char *d = (unsigned char *)destination;
    const unsigned char *s = (const unsigned char *)source;
    while (count-- != 0u)
        *d++ = *s++;
    return destination;
}

void *memmove(void *destination, const void *source, size_t count)
{
    unsigned char *d = (unsigned char *)destination;
    const unsigned char *s = (const unsigned char *)source;
    if (d < s) {
        while (count-- != 0u)
            *d++ = *s++;
    } else if (d > s) {
        d += count;
        s += count;
        while (count-- != 0u)
            *--d = *--s;
    }
    return destination;
}

void *memset(void *destination, int value, size_t count)
{
    unsigned char *d = (unsigned char *)destination;
    while (count-- != 0u)
        *d++ = (unsigned char)value;
    return destination;
}

int memcmp(const void *left, const void *right, size_t count)
{
    const unsigned char *a = (const unsigned char *)left;
    const unsigned char *b = (const unsigned char *)right;
    while (count-- != 0u) {
        if (*a != *b)
            return (int)*a - (int)*b;
        ++a;
        ++b;
    }
    return 0;
}

size_t strlen(const char *text)
{
    const char *end = text;
    while (*end != '\0')
        ++end;
    return (size_t)(end - text);
}

int strcmp(const char *left, const char *right)
{
    while (*left != '\0' && *left == *right) {
        ++left;
        ++right;
    }
    return (unsigned char)*left - (unsigned char)*right;
}

char *strchr(const char *text, int character)
{
    char wanted = (char)character;
    for (;;) {
        if (*text == wanted)
            return (char *)text;
        if (*text == '\0')
            return NULL;
        ++text;
    }
}

char *strcpy(char *destination, const char *source)
{
    char *result = destination;
    while ((*destination++ = *source++) != '\0') {
    }
    return result;
}

int abs(int value)
{
    return value < 0 ? -value : value;
}

long labs(long value)
{
    return value < 0 ? -value : value;
}

int printf(const char *format, ...)
{
    (void)format;
    return 0;
}

int puts(const char *text)
{
    (void)text;
    return 0;
}

/* WikiSort only uses sqrt() to obtain an integer block size. */
double sqrt(double input)
{
    uint32_t value = input <= 0.0 ? 0u : (uint32_t)input;
    uint32_t result = 0u;
    uint32_t bit = 1u << 30;

    while (bit > value)
        bit >>= 2;
    while (bit != 0u) {
        if (value >= result + bit) {
            value -= result + bit;
            result = (result >> 1) + bit;
        } else {
            result >>= 1;
        }
        bit >>= 2;
    }
    return (double)result;
}
