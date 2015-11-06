#include <stdio.h>

int main()
{
  puts("Hello, world.");
  putc('a', stdout);
  putc('\n', stdout);
  fputs("b\n",stdout);

  return 0;
}
