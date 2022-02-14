#include <stdio.h>
#include <stdlib.h>

extern int basic_run();

int pos = 0, vpos = 0;
const int TmpBufSz = 16, PrintWidth = 75, Comma = 15, SemiColon = 3;

void print_string(const char *s) {
    while (*s) {
        while (*s && (pos < 75)) {
            putchar(*s++);
            ++pos;
        }
    }
}

void print_number(double n) {
    char buffer[TmpBufSz];
    snprintf(buffer, TmpBufSz, " %.6g", n);
    print_string(buffer);
}

void print_newline() {
    putchar('\n');
    pos = 0;
    ++vpos;
}

void print_comma() {
    putchar(' ');
    while (++pos % Comma) {
        putchar(' ');
    }
    if ((pos + Comma) > PrintWidth) {
        putchar('\n');
        pos = 0;
        ++vpos;
    }
}

void print_semicolon() {
    putchar(' ');
    while (++pos % SemiColon) {
        putchar(' ');
    }
    if ((pos + Comma) > PrintWidth) {
        putchar('\n');
        pos = 0;
        ++vpos;
    }
}

void read_number(double *n) {
    char buffer[TmpBufSz];
    print_newline();
    print_string("? ");
    fgets(buffer, TmpBufSz, stdin);
    sscanf(buffer, "%lf", n);
}

void read_string(char *s, size_t n) {
    fgets(s, n, stdin);
    char *p = s;
    while (*p >= ' ') {
        ++p;
    }
    *p = '\0';
}

double random_lcg() {
    static unsigned int x = 1 << 19; // X(n+1) = (aX(n)+c) mod m
    x = (1103515245 * x + 12345) % (1u << 31);
    return x * 1.0 / (1u << 31);
}

void runtime_error(int err, int line) {
    switch (err) {
        case 1:
            print_string("OUT OF DATA");
            break;
        case 2:
            print_string("ALREADY IN GOSUB");
            break;
        case 3:
            print_string("NOT IN GOSUB");
            break;
        case 4:
            print_string("INDEX OUT OF BOUNDS");
            break;
        case 5:
            print_string("NESTED ARRAY EXPRESSION");
            break;
        default:
            print_string("RUNTIME ERROR");
            break;
    }
    if (line != -1) {
        print_string(" AT LINE");
        print_number(line);
    }
    print_newline();
    exit(err);
}

int main() {
    return basic_run();
}
