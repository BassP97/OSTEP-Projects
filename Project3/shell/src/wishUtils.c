/* Duplicate S, returning an identical malloc'd string.  
 * Shamelessly stolen from the C standard library source
 * Some checks (namely that our new pointer isn't null)
 * have been removed - just don't pass in bad stuff, and 
 * there won't be any problems :)
*/
#include "types.h"
#include "user.h"

// yes I know it's just a wrapper for memmove, but this is 
// more C-like
void* memcpy(void *dst, const void *src, uint n)
{
  return memmove(dst, src, n);
}

char * strdup (const char *s)
{
  int len = strlen(s) + 1;
  void *new = malloc (len);
  return (char *) memcpy (new, s, len);
}

//stolen from sh.c  
int getcmd(char *buf, int nbuf)
{
  memset(buf, 0, nbuf);
  gets(buf, nbuf);
  if(buf[0] == 0) // EOF
    return -1;
  buf[strlen(buf)-1] = 0;
  return 0;
}