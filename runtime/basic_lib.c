#include <math.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stdbool.h>

extern int basic_run();

struct Dims {
    unsigned rows;
    unsigned cols;
};

struct Mat {
    struct Dims *dim;
    struct Dims *mat;
    double *data;
};

struct Data {
    unsigned data_p;
    unsigned data_m;
    unsigned data_p_s;
    unsigned data_m_s;
    const double data[];
};

unsigned pos = 0, vpos = 0;
const unsigned TmpBufSz = 256, PrintWidth = 75, Comma = 15, SemiColon = 3, MaxString = 255;

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
    snprintf(buffer, TmpBufSz, "% .6g", n);
    print_string(buffer);
}

void print_integer(int i) {
    char buffer[TmpBufSz];
    snprintf(buffer, TmpBufSz, "%d", i);
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
    ++pos;
    if ((pos + Comma) > PrintWidth) {
        putchar('\n');
        pos = 0;
        ++vpos;
    }
}

void print_tab(unsigned tab) {
    while(pos < tab && pos < PrintWidth) {
        putchar(' ');
        ++pos;
    }
}

void runtime_error(int err, short line) {
    switch (err) {
        case 1:
            print_string("OUT OF DATA");
            break;
        case 2:
            print_string("END WITHIN GOSUB/FN");
            break;
        case 3:
            print_string("NOT WITHIN GOSUB/FN");
            break;
        case 4:
            print_string("INDEX OUT OF BOUNDS");
            break;
        case 5:
            print_string("NESTED ARRAY EXPRESSION");
            break;
        case 6:
            print_string("DIM TOO SMALL");
            break;
        case 7:
            print_string("BAD MATRIX SIZE");
            break;
        case 10:
            print_string("STRING TOO LONG");
            break;
        case 11:
            print_string("ON GOTO OUT OF RANGE");
            break;
        case 12:
            print_string("UNINITIALIZED STRING");
            break;
        default:
            print_string("RUNTIME ERROR");
            break;
    }
    if (line != -1) {
        print_string(" IN ");
        print_integer(line);
    }
    print_newline();
    exit(err);
}

void mat_print(double *d, unsigned sz, bool packed, short l) {
    unsigned n = *d;
    if (n > sz) {
        runtime_error(7, l);
    }
    for (unsigned s = 0; s != n; ++s) {
        print_number(*++d);
        if (packed) {
            print_semicolon();
        }
        else {
            print_comma();
        }
    }
    if (pos) {
        print_newline();
    }
}

void mat_print2(struct Mat *m, bool packed) {
    double *d = m->data + m->dim->cols + 1;
    print_newline();
    for (unsigned r = 0; r != m->mat->rows; ++r) {
        for (unsigned c = 0; c != m->mat->cols; ++c) {
            print_number(*(d + c + 1));
            if ((c + 1) < m->mat->cols) {
                if (packed) {
                    print_semicolon();
                }
                else {
                    print_comma();
                }
            }
        }
        if (pos && m->mat->cols > 1) {
            print_newline();
        }
        else {
            if (packed) {
                print_semicolon();
            }
            else {
                print_comma();
            }
        }
        d += m->dim->cols + 1;
    }
    if (pos && m->mat->cols == 1) {
        print_newline();
    }
}

void mat_print_str(char **str, bool packed) {
    while (*++str) {
        print_string(*str);
        if (packed) {
            print_semicolon();
        }
        else {
            print_comma();
        }
    }
    if (pos) {
        print_newline();
    }
}

void mat_read(double *d, unsigned sz, struct Data *rd, short l) {
    *d = sz;
    for (unsigned s = 0; s != sz; ++s) {
        if (rd->data_p == rd->data_m) {
            runtime_error(1, l);
        }
        *(++d) = rd->data[(rd->data_p)++];
    }
}

void mat_read2(struct Mat *m, struct Data *rd, short l) {
    if (m->mat->rows > m->dim->rows || m->mat->cols > m->dim->cols) {
        runtime_error(6, l);
    }
    double *d = m->data + m->dim->cols + 1;
    for (unsigned r = 0; r != m->mat->rows; ++r) {
        for (unsigned c = 0; c != m->mat->cols; ++c) {
            if (rd->data_p == rd->data_m) {
                runtime_error(1, l);
            }
            *(d + c + 1) = rd->data[(rd->data_p)++];
        }
        d += m->dim->cols + 1;
    }
}

void mat_read_str(char**str, unsigned sz, struct Data *rd, short l) {
    char **data = (char **)(rd->data + rd->data_m);
    for (unsigned s = 0; s != sz; ++s) {
        if (rd->data_p_s == rd->data_m_s) {
            runtime_error(1, l);
        }
        if (*++str) {
            free((void *)(*str));
        }
        *str = strdup(data[(rd->data_p_s)++]);
    }
}

void mat_add(struct Mat *result, struct Mat *param1, struct Mat *param2, short l) {
    if (param1->mat->rows != param2->mat->rows || param1->mat->cols != param2->mat->cols) {
        runtime_error(7, l);
    }
    if (param1->mat->rows > result->dim->rows || param1->mat->cols > result->dim->cols) {
        runtime_error(6, l);
    }
    result->mat->rows = param1->mat->rows;
    result->mat->cols = param1->mat->cols;
    double *result_d = result->data + result->dim->cols + 1,
      *param1_d = param1->data + param1->dim->cols + 1,
      *param2_d = param2->data + param2->dim->cols + 1;
    for (unsigned r = 0; r != result->mat->rows; ++r) {
        for (unsigned c = 0; c != result->mat->cols; ++c) {
            *(result_d + c + 1) = *(param1_d + c + 1) + *(param2_d + c + 1);
        }
        result_d += result->dim->cols + 1;
        param1_d += param1->dim->cols + 1;
        param2_d += param2->dim->cols + 1;
    }
}

void mat_sub(struct Mat *result, struct Mat *param1, struct Mat *param2, short l) {
    if (param1->mat->rows != param2->mat->rows || param1->mat->cols != param2->mat->cols) {
        runtime_error(7, l);
    }
    if (param1->mat->rows > result->dim->rows || param1->mat->cols > result->dim->cols) {
        runtime_error(6, l);
    }
    result->mat->rows = param1->mat->rows;
    result->mat->cols = param1->mat->cols;
    double *result_d = result->data + result->dim->cols + 1,
        *param1_d = param1->data + param1->dim->cols + 1,
        *param2_d = param2->data + param2->dim->cols + 1;
    for (unsigned r = 0; r != result->mat->rows; ++r) {
        for (unsigned c = 0; c != result->mat->cols; ++c) {
            *(result_d + c + 1) = *(param1_d + c + 1) - *(param2_d + c + 1);
        }
        result_d += result->dim->cols + 1;
        param1_d += param1->dim->cols + 1;
        param2_d += param2->dim->cols + 1;
    }
}

void mat_mul(struct Mat *result, struct Mat *param1, struct Mat *param2, short l) {
    if (param1->mat->cols != param2->mat->rows) {
        runtime_error(7, l);
    }
    if (param1->mat->rows > result->dim->rows || param2->mat->cols > result->dim->cols) {
        runtime_error(6, l);
    }
    result->mat->rows = param1->mat->rows;
    result->mat->cols = param2->mat->cols;
    double *d = result->data + result->dim->cols + 1;
    for (unsigned r = 0; r != result->mat->rows; ++r) {
        for (unsigned c = 0; c != result->mat->cols; ++c) {
            *(d + c + 1) = 0.0;
            for (unsigned e = 0; e != param1->mat->cols; ++e) {
                *(d + c + 1) +=
                    *(param1->data + ((param1->dim->cols + 1) * (r + 1)) + e + 1)
                    *
                    *(param2->data + ((param2->dim->cols + 1) * (e + 1)) + c + 1);
            }
        }
        d += result->dim->cols + 1;
    }
}

void mat_zer_con(struct Mat *m, bool con, short l) {
    if (m->mat->rows > m->dim->rows || m->mat->cols > m->dim->cols) {
        runtime_error(6, l);
    }
    double *d = m->data + m->dim->cols + 1;
    for (unsigned r = 0; r != m->mat->rows; ++r) {
        for (unsigned c = 0; c != m->mat->cols; ++c) {
            *(d + c + 1) = con ? 1.0 : 0.0;
        }
        d += m->dim->cols + 1;
    }
}

void mat_idn(struct Mat *m, short l) {
    if (m->mat->rows != m->mat->cols) {
        runtime_error(7, l);
    }
    if (m->mat->rows > m->dim->rows || m->mat->cols > m->dim->cols) {
        runtime_error(6, l);
    }
    double *d = m->data + m->dim->cols + 1;
    for (unsigned r = 0; r != m->mat->rows; ++r) {
        for (unsigned c = 0; c != m->mat->cols; ++c) {
            *(d + c + 1) = (r == c) ? 1.0 : 0.0;
        }
        d += m->dim->cols + 1;
    }
}

void mat_trn(struct Mat *result, struct Mat *source, short l) {
    if (source->mat->rows > result->dim->cols || source->mat->cols > result->dim->rows) {
        runtime_error(6, l);
    }
    result->mat->rows = source->mat->cols;
    result->mat->cols = source->mat->rows;
    double *d = result->data + result->dim->cols + 1;
    for (unsigned r = 0; r != result->mat->rows; ++r) {
        for (unsigned c = 0; c != result->mat->cols; ++c) {
            *(d + c + 1) = *(source->data + ((source->dim->cols + 1) * (c + 1)) + r + 1);
        }
        d += result->dim->cols + 1;
    }
}

double *mat_minor(double *mat, unsigned sz, unsigned omit_row, unsigned omit_col) {
    double *minor = malloc((sz - 1) * (sz - 1) * sizeof(double)), *d = minor;
    for (unsigned r = 0; r != sz; ++r) {
        for (unsigned c = 0; c != sz; ++c) {
            if (r != omit_row && c != omit_col) {
                *d++ = mat[r * sz + c];
            }
        }
    }
    return minor;
}

double mat_det(double *mat, unsigned sz) {
    double result = 0.0;
    switch (sz) {
        case 0:
            result = 1.0;
            break;
        case 1:
            result = mat[0];
            break;
        case 2:
            result = mat[0] * mat[3] - mat[1] * mat[2];
            break;
        default:
            {
                for (unsigned c = 0; c != sz; ++c) {
                    result += ((c % 2) ? -1.0 : 1.0) * mat[c] * mat_det(mat_minor(mat, sz, 0, c), sz - 1);
                }
                break;
            }
    }
    free(mat);
    return result;
}

void mat_inv(struct Mat *result, struct Mat *source, double *detp, short l) {
    if (source->mat->rows != source->mat->cols) {
        runtime_error(7, l);
    }
    if (source->mat->rows > result->dim->rows || source->mat->cols > result->dim->cols) {
        runtime_error(6, l);
    }
    unsigned sz = source->mat->cols;
    result->mat->rows = result->mat->cols = sz;
    double *mat = malloc(sz * sz * sizeof(double)), *d = source->data + source->dim->cols + 1;
    for (unsigned r = 0; r != sz; ++r) {
        for (unsigned c = 0; c != sz; ++c) {
            mat[r * sz + c] = *(d + c + 1);
        }
        d += source->dim->cols + 1;
    }
    double det = 0.0;
    for (unsigned c = 0; c != sz; ++c) {
        det += ((c % 2) ? -1.0 : 1.0) * mat[c] * mat_det(mat_minor(mat, sz, 0, c), sz - 1);
    }
    d = result->data + result->dim->cols + 1;
    for (unsigned r = 0; r != sz; ++r) {
        for (unsigned c = 0; c != sz; ++c) {
            *(d + c + 1) = (det == 0.0) ? 0.0 : (((c + r) % 2) ? -1.0 : 1.0) * mat_det(mat_minor(mat, sz, c, r), sz - 1) / det;
        }
        d += result->dim->cols + 1;
    }
    if (detp) {
        *detp = det;
    }
    free(mat);
}

void mat_scalar(struct Mat *result, struct Mat *source, double scalar, short l) {
    if (source->mat->rows > result->dim->rows || source->mat->cols > result->dim->cols) {
        runtime_error(6, l);
    }
    result->mat->rows = source->mat->rows;
    result->mat->cols = source->mat->cols;
    double *d = result->data + result->dim->cols + 1;
    for (unsigned r = 0; r != result->mat->rows; ++r) {
        for (unsigned c = 0; c != result->mat->cols; ++c) {
            *(d + c + 1) = *(source->data + ((source->dim->cols + 1) * (r + 1)) + c + 1) * scalar;
        }
        d += result->dim->cols + 1;
    }
}

void mat_zer_con_idn_dim(struct Mat *m, int t, short l) {
    m->mat->rows = m->dim->rows;
    m->mat->cols = m->dim->cols;
    switch (t) {
        case 0:
            mat_zer_con(m, false, l);
            break;
        case 1:
            mat_zer_con(m, true, l);
            break;
        case 2:
            mat_idn(m, l);
            break;
        default:
            break;
    }
}

void mat_input(double *d, unsigned *sz, double *num, short l) {
    char buffer[TmpBufSz];
    unsigned s = 0;
    print_string("? ");
    fgets(buffer, TmpBufSz, stdin);
    char *p = buffer, *next;
    while (*p >= ' ' && s <= *sz) {
        while ((next = strchr(p, ',')) != 0 && s < *sz) {
            *next = '\0';
            sscanf(p, "%lf", ++d);
            ++s;
            p = next + 1;
        }
        p += sscanf(p, "%lf", ++d);
        ++s;
        if (*p == '&' && s <= *sz) {
            print_string("? ");
            fgets(buffer, TmpBufSz, stdin);
            p = buffer;
        }
    }
    *num = s;
}

void change_from_string(unsigned char **s, double *d, unsigned sz, short l) {
    unsigned len = strlen(*s);
    if (len > sz) {
        runtime_error(6, l);
    }
    for (unsigned i = 0; i < len; ++i) {
        d[i + 1] = (*s)[i];
    }
    d[0] = len;
}

void change_to_string(unsigned char **s, double *d, unsigned sz, short l) {
    unsigned len = d[0];
    if (len > MaxString) {
        runtime_error(10, l);
    }
    if (*s) {
        free(*s);
    }
    *s = malloc(len + 1);
    for (unsigned i = 0; i < len; ++i) {
        (*s)[i] = d[i + 1];
    }
    (*s)[len] = '\0';
}

void input_number(double *n) {
    static bool prompt = true;
    char buffer[TmpBufSz];
    if (prompt) {
        print_string("? ");
    }
    char *p = buffer;
    *p = fgetc(stdin);
    while(*p != '\n' && *p != ',' && !feof(stdin)) {
        ++p;
        *p = fgetc(stdin);
    }
    prompt = (*p == '\n');
    *++p = '\0';
    sscanf(buffer, "%lf", n);
    pos = 0;
    ++vpos;
}

char *input_string() {
    char buffer[MaxString];
    char *p = fgets(buffer, MaxString, stdin);
    p = strchr(buffer, '\n');
    if (p) {
        *p = '\0';
    }
    p = buffer;
    while (*p == ' ') {
        ++p;
    }
    pos = 0;
    ++vpos;
    return strdup(p);
}

double random_lcg(unsigned seed) {
    static unsigned int x = 1 << 19; // X(n+1) = (aX(n)+c) mod m
    if (seed) {
        x = seed;
        return 0.0;
    }
    x = (1103515245 * x + 12345) % (1u << 31);
    return x * 1.0 / (1u << 31);
}

double cot(double n) {
    return cos(n) / sin(n);
}

double sgn(double n) {
    return (n > 0.0) ? 1.0 : (n < 0.0) ? -1.0 : 0.0;
}

int main() {
    return basic_run();
}
