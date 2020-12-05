#include "types.h"
#include "user.h"

#define STDIN 0
#define CHILDPROC 0
#define STDERR 1
#define STDOUT 2
#define MAXARGS 11
#define ARGSIZE 100

void* memcpy(void *dst, const void *src, uint n);
char * strdup (const char *s);
int isBuiltIn(char* cmd);
int executeBuiltIn(char** myargv, char**path);
char* getToken(int* ptr, char* string, char* delimiter, char* status);
void splitString(char* string, char* delimiter, char** res);
int executeCmd(char** myargv);
void parseArgs(char* toParse, char** buf);
int getcmd(char *buf);
char** allocateArgv();
void cleanup(char** argv);
char error_message[30] = "An error has occurred\n";

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
  memset(buf, 0, 100);
  int currIndex = 0;
  char* nullTerm = "\0\0";
  char* null = "\0";
  int isNull;
  int isDelimiter;
  char currStr[2];
  if ((*ptr)>strlen(string)){
    *status=0;
    memcpy(buf, nullTerm, 2 );
    return buf;
  }

  memcpy(currStr, &string[*ptr+currIndex], 1 );
  memcpy(currStr+1, null, 1 );
  isNull = strcmpbool(currStr, nullTerm);
  isDelimiter = strcmpbool(currStr, delimiter);

  while (!isDelimiter && !isNull ){
    memcpy(buf+currIndex, &string[*ptr+currIndex], 1 );
    currIndex++;
    memcpy(currStr, &string[*ptr+currIndex], 1 );
    memcpy(currStr+1, null, 1 );
    isDelimiter = strcmpbool(currStr, delimiter);
    isNull = strcmpbool(currStr, nullTerm);
  }

  memcpy(buf+currIndex+1, null, 1);
  *ptr = *ptr+currIndex+1;
  return buf;
}
/*
char* prepend(char* toPrepend, char* strchr){
  malloc(sizeof(char)*(sizeof(toPrepend)+sizeof(strchr));

}*/
void splitString(char* string, char* delimiter, char** res){
  int ptr = 0;
  char* refString = strdup(string);
  int i = 0;
  char status = 1;
  char* temp;

  while(status){
    temp = getToken(&ptr, refString, delimiter, &status);
    if (status){
      strcpy(res[i], temp);
    }else{
      memset(res[i], 0, ARGSIZE);
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


//where I stopped - parsing involves having each pointer in buff point to the 
//appropriate location in toparse, NOT copying or allocating new data
//This means that part of this is modifying toparse to null terminate after/
//at each delimiter
void parseArgs(char* toParse, char** buff){
  char* whiteSpace = " ";
  splitString(toParse, whiteSpace, buff);
}

//shamelessly ripped from sh.c  
int getcmd(char *buf){
  printf(STDOUT, "> ");
  memset(buf, 0, ARGSIZE);
  gets(buf, ARGSIZE);
  if(buf[0] == 0) // EOF
    return -1;
  buf[strlen(buf)-1] = 0;
  return 0;
}

void printlegalmemory(char* bruh, int size){
  printf(STDOUT, "memory at loc: \n");
  int i;
  for(i=0;i<size;i++){
    printf(STDOUT, "%x ", bruh+i);
  }
  printf(STDOUT, "\n\n");
}

char** allocateArgv(){
  int i;
  char** argv = (char **)malloc(MAXARGS*sizeof(char*));
  return argv;
}

void cleanup(char** argv){
  int j;
  char nullVal = 0;
  for(j=0;j<MAXARGS;j++){
    memset(argv[j],nullVal,ARGSIZE*sizeof(char));
  }
}