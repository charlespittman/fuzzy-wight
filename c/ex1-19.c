/* write reverse(s) that reverses string s, and use it to reverse input line-by-line */
#include <stdio.h>
#define MAXLINE 1000

int m_getline(char line[], int maxline);
void copy(char to[], char from[]);

/* print longest input line */
main()
{
  int len;               /* length of current line length */
  int max;               /* length of longest line so far */
  char line[MAXLINE];    /* current input line */
  char longest[MAXLINE]; /* longest line so far */

  max = 0;
  while ((len = m_getline(line, MAXLINE)) > 0)
    if (len > max) {
      max = len;
      copy(longest, line);
    }
  if ( max > 0) /* there was a line */
    printf("%s", longest);
  return 0;

}

/* m_getline: read a line into s, return length */
int m_getline(char s[], int lim)
{
  int c, i;

  for (i=0; i<lim-1 && (c=getchar())!=EOF && c!='\n'; ++i)
    s[i] = c;
  if (c == '\n') {
    s[i] = c;
    ++i;
  }
  s[i] = '\0';
  return i;
}

/* copy: copy 'from' into 'to'; assume to is bid enough */
void copy(char to[], char from[])
{
  int i;

  i = 0;
  while ((to[i] = from[i]) != '\0')
    ++i;
}
