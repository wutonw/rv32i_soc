#ifndef EMBENCH_PORT_CTYPE_H
#define EMBENCH_PORT_CTYPE_H

/* Minimal ASCII-only ctype subset used by Embench's SLRE benchmark. */
static inline int isdigit(int character)
{
    return character >= '0' && character <= '9';
}

static inline int isspace(int character)
{
    return character == ' ' || character == '\t' || character == '\n' ||
           character == '\r' || character == '\f' || character == '\v';
}

static inline int isxdigit(int character)
{
    return isdigit(character) ||
           (character >= 'a' && character <= 'f') ||
           (character >= 'A' && character <= 'F');
}

static inline int tolower(int character)
{
    if (character >= 'A' && character <= 'Z')
        return character + ('a' - 'A');
    return character;
}

#endif
