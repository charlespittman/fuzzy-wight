#include <ctype.h>
#include <stdio.h>
#include <string.h>

// forward declarations
int can_print_it(char ch);
void print_letters(char arg[]);
void print_arguments(int argc, char *argv[]);

void print_arguments(int argc, char *argv[])
{
  int i = 0;
  for (i = 0; i < argc; i++) {
    print_letters(argv[i]);
  }
}

void print_letters(char arg[])
{
  int i = 0;
  for (i = 0; i <= strlen(arg); i++) {
    char ch = arg[i];
    if (isprint(ch)) {
      printf("'%c' == %d ", ch, ch);
    }
  }
  printf("\n");
}

int main(int argc, char *argv[])
{
  print_arguments(argc, argv);
  return 0;
}
