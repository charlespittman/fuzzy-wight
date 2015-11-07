#include <stdio.h>

int main( int argc, char *argv[])
{
  // go through each string in argv

  int i = 0;
  while(i < argc) {
    printf("arg %d: %s\n", i, argv[i]);
    i++;
  }

  // let's make our own array of strings
  char *states[] = {
    "California", "Oregon",
    "Washington", "Texas"
  };

  int num_states = 4;

  i = 0;
  while(i < num_states) {
    printf("state %d: %s\n", i, states[i]);
    i++;
  }

  /** Extra credit. **/

  /* Make them count backward with decrementer. */
  i = argc - 1;  // indexes are always 0-based
  while(i >= 0) {
    printf("arg %d: %s\n", i, argv[i]);
    i--;
  }

  i = num_states - 1;  // indexes are always 0-based
  while(i >= 0) {
    printf("state %d: %s\n", i, states[i]);
    i--;
  }

  /* Use while to copy argv into states.  Make sure it doesn't fail if there
     are too many elements in argv. */
  i = 0;
  while(i < num_states) {
    if(argv[i] != NULL) states[i] = argv[i];
    printf("state %d: %s\n", i, states[i]);
    i++;
  }
  /* The above gives weird results if no arguments are given on the command
   * line:
   * state 0: ./ex11
   * state 1: Oregon
   * state 2: XDG_SEAT=seat0
   * state 3: LC_COLLATE=POSIX
   */

  return 0;
}
