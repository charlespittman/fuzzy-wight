#include <stdio.h>
#include <stdlib.h>

#include <readline/readline.h>
#include <readline/history.h>

#include "mpc.h"

int main() {

  /* Create some parsers */
  mpc_parser_t* Number = mpc_new("number");
  mpc_parser_t* Operator = mpc_new("operator");
  mpc_parser_t* Expr = mpc_new("expr");
  mpc_parser_t* Lispy = mpc_new("lispy");

  /* Define the parsers */
  mpca_lang(MPCA_LANG_DEFAULT,
            "number : /-?[0-9]+/;                                       \
             operator : '+' | '-' | '*' | '/';                          \
             expr : <number> | '(' <operator> <expr>+ ')';              \
             lispy : /^/ <operator> <expr>+ /$/;                        \
            ",
            Number, Operator, Expr, Lispy);

  /* Print version and exit information */
  puts("Lispy Version 0.0.0.0.2");
  puts("Press Ctrl+c to exit");

  while (1) {
    char* input = readline("lispy> ");
    add_history(input);

    /* Try to parse user input */
    mpc_result_t r;
    if (mpc_parse("<stdin>", input, Lispy, &r)) {
      /* On success print the AST */
      mpc_ast_print(r.output);
      mpc_ast_delete(r.output);
    } else {
      /* Otherwise print the error */
      mpc_err_print(r.error);
      mpc_err_delete(r.error);
    }

    free(input);
  }

  /* Undefine and delete the parsers */
  mpc_cleanup(4, Number, Operator, Expr, Lispy);

  return 0;
}
