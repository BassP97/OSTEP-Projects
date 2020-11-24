#include "types.h"
#include "user.h"

#define STDIN 0
#define CHILDPROC 0
#define STDERR 1
#define STDOUT 2

void* memcpy(void *dst, const void *src, uint n);
char * strdup (const char *s);
int isBuiltIn(char* cmd);
int executeBuiltIn(char** myargv, char**path);
char* getToken(int* ptr, char* string, char* delimiter, char* status);
void splitString(char* string, char* delimiter, char*** res);
int executeCmd(char** myargv);
void parseArgs(char* toParse, char*** buf, int buflen);
int getcmd(char *buf, int nbuf);
void allocateArgv(char*** argv, int argvSize, int argSize);
void cleanup(char*** argv, int argvSize);


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

int isBuiltIn(char* cmd){
  return(strcmpbool(cmd, "cd") || strcmpbool(cmd,"path") ||  strcmpbool(cmd, "exit"));
}

int executeBuiltIn(char** myargv, char**path){
  if (strcmpbool(myargv[0], "cd") && !(strcmp(myargv[1], "\0"))){
    printf(STDOUT,"oh my, how embarassing!");
  } else if(strcmpbool(myargv[0], "path") && !(strcmpbool(myargv[1], "\0"))){
    printf(STDOUT,"oh my, how embarassing!");
  } 
  return 0;
}

char* getToken(int* ptr, char* string, char* delimiter, char* status){
  char* buf = malloc(100);
  int currIndex = 0;
  char* nullTerm = "\0\0";
  char* null = "\0";
  char* quote = "\"";
  int isNull;
  int isDelimiter;
  int quoteOpen;
  int isQuote;

  if ((*ptr)>strlen(string)){
    *status=0;
    memcpy(buf, nullTerm, 2 );
    return buf;
  }

  char currStr[2];
  memcpy(currStr, &string[*ptr+currIndex], 1 );
  memcpy(currStr+1, null, 1 );
  isNull = strcmpbool(currStr, nullTerm);
  isDelimiter = strcmpbool(currStr, delimiter);
  quoteOpen = strcmpbool(currStr, quote);

  while ((!isDelimiter || !isNull){
    memcpy(buf+currIndex, &string[*ptr+currIndex], 1 );
    currIndex++;
    memcpy(currStr, &string[*ptr+currIndex], 1 );
    memcpy(currStr+1, null, 1 );
    if (!quoteOpen){
      isDelimiter = strcmpbool(currStr, delimiter);
    }
    isNull = strcmpbool(currStr, nullTerm);
    isQuote = strcmpbool(currStr, quote);
    if (isQuote){
      quoteOpen = !quoteOpen;
    }
  }

  memcpy(buf+currIndex+1, null, 1);
  *ptr = *ptr+currIndex+1;
  return buf;
}

void splitString(char* string, char* delimiter, char*** res){
  int ptr = 0;
  char* refString = strdup(string);
  int i = 0;
  char status = 1;
  char* temp;

  while(status){
    temp = getToken(&ptr, refString, delimiter, &status);
    if (status){
      strcpy(*res[i], temp);
    }else{
      *res[i]="\0";
    }
    free(temp);
    i++;
  }
  i=0;
  free(refString);
}

int executeCmd(char** myargv){
  if (fork() == CHILDPROC){
    exec(myargv[0], myargv);
    printf(STDERR, "exec %s failed :( \n", myargv[0]);
  }
  wait();
  return 0;
}

void parseArgs(char* toParse, char*** buff, int buflen){
  char* whiteSpace = " ";
  splitString(toParse, whiteSpace, buff);
  printf(STDOUT, "split string:\n");
  int i=0;
  while(!strcmpbool(*buff[i], "\0")){
    printf(STDOUT, "at line %d, we have \"%s\"\n", i, *buff[i]);
    i++;
  }
  printf(STDOUT,"%s\n", *buff[0]);
}

//shamelessly ripped from sh.c  
int getcmd(char *buf, int nbuf){
  printf(STDOUT, "> ");
  memset(buf, 0, nbuf);
  gets(buf, nbuf);
  if(buf[0] == 0) // EOF
    return -1;
  buf[strlen(buf)-1] = 0;
  return 0;
}

void allocateArgv(char*** argv, int argvSize, int argSize){
  int i;
  //means it'll take up about 1k of ram, which isn't great but w/e, it works lol
  *argv = malloc(argvSize);
  for(i=0;i<argvSize;i++){
    *argv[i] = malloc(argSize);  
  }
}

void cleanup(char*** argv, int argvSize){
  int i;
  for(i=0;i<argvSize;i++){
    free(*argv[i]);
  }
  free(*argv);
}