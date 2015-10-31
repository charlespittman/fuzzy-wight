#include <stdio.h>
#include <stdlib.h>

#include <readline/readline.h>
#include <readline/history.h>

int main() {
  /* Print version and exit information */
  puts("Lispy Version 0.0.0.0.1");
  puts("Press Ctrl+c to exit");

  while (1) {
    char* input = readline("lispy> ");
    add_history(input);
    printf("No you're a %s\n", input);
    free(input);
  }

  return 0;
}
