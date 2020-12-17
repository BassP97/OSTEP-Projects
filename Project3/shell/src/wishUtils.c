#include "types.h"
#include "user.h"

#define STDIN 0
#define CHILDPROC 0
#define STDERR 1
#define STDOUT 2
#define MAXARGS 11
#define TOTALSIZE 1000

void* memcpy(void *dst, const void *src, uint n);
char * strdup (const char *s);
int isBuiltIn(char* cmd);
int executeBuiltIn(char** myargv, char**path);
char* getToken(int* ptr, char* string, char* refString, char* delimiter, char* status);
void splitString(char* string, char* delimiter, char** res);
int executeCmd(char** myargv);
void parseArgs(char* toParse, char** buf);
int getcmd(char *buf);
char** allocateArgv();
void cleanup(char** argv, int basePid);
void parallelize(char** readBuff);
char* error_message = "An error has occurred\n";

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

char* getToken(int* ptr, char* string, char* refString, char* delimiter, char* status){
  int currIndex = 0;
  char* nullTerm = "\0\0";
  char* null = "\0";
  int isNull;
  int isDelimiter;
  char currStr[2];
  char* finalAddress = &string[*ptr];
  if ((*ptr)>strlen(refString)){
    *status=0;
    return finalAddress;
  }

  memcpy(currStr, &string[*ptr+currIndex], 1 );
  memcpy(currStr+1, null, 1 );
  isNull = strcmpbool(currStr, nullTerm);
  isDelimiter = strcmpbool(currStr, delimiter);
  /*printf(STDOUT, "is it a delimiter?: %d\n", isDelimiter);
  printf(STDOUT, "is it null?: %d\n", isNull);
  printf(STDOUT, "here is the current character: %s\n", currStr);
  printf(STDOUT, "here is the final address: %x\n", finalAddress);
  */
  while (!isDelimiter && !isNull){
    currIndex++;
    memcpy(currStr, &string[*ptr+currIndex], 1);
    memcpy(currStr+1, null, 1 );
    finalAddress = &string[*ptr+currIndex];
    isDelimiter = strcmpbool(currStr, delimiter);
    isNull = strcmpbool(currStr, nullTerm);
    /*
    printf(STDOUT, "is it a delimiter?: %d\n", isDelimiter);
    printf(STDOUT, "is it null?: %d\n", isNull);
    printf(STDOUT, "here is the current character: %s\n", currStr);
    printf(STDOUT, "here is the final address: %x\n", finalAddress);
    */
  }
  //printf(STDOUT, "\n");
  finalAddress = finalAddress;
  *ptr+=currIndex;
  return finalAddress;
}

void splitString(char* string, char* delimiter, char** res){
  int ptr = 0;
  int i = 0;
  char status = 1;
  char* refString = strdup(string);
  char* temp = string;
  char* null = "\0";
  char* startOfWord;
  while(status){
    //printf(STDOUT, "\n\niteration number %d\n",i);
    //printf(STDOUT,"start of word is %x\n", temp);
    startOfWord = temp;
    temp = getToken(&ptr, string, refString, delimiter, &status);
    //printf(STDOUT,"end of word is %x\n", temp);
    if (!status){
      res[i]=0;
    }else{
      res[i] = startOfWord;
      memcpy(temp, null, 1);
    }
    /*printf(STDOUT, "word at position %d: ", i);
    printf(STDOUT, res[i]);
    printf(STDOUT, "\n");*/
    ptr+=1;
    temp+=1;
    i++;
  }
  i=0;
  //printf(STDOUT, "done splitting string\n");
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

void parseArgs(char* toParse, char** buff){
  char* whiteSpace = " ";
  splitString(toParse, whiteSpace, buff);
}

void parallelize(char** readBuf){
  int currChar = 0;
  int amChild;

  char* resBuf = malloc(TOTALSIZE);
  char* readBuff = *readBuf;
  char* baseByte = readBuff;

  while(readBuff[currChar]!=0){//while not reading null
    if(readBuff[currChar]=='&'){
      // printf(STDOUT, "hit ampersand \nhere's resbuf: ");
      memcpy(resBuf, baseByte, (&readBuff[currChar]-baseByte));//this is gross but who cares amirite
      // printf(STDOUT, resBuf);
      // printf(STDOUT, "\n");
      amChild = fork();
      if(amChild){
        // printf(STDOUT, "child, resbuf:\n");
        *readBuf = resBuf;
        free(readBuff);
        // printf(STDOUT, "here is location of readbuf in func: %x", readBuff);
        return;
      }
      // printf(STDOUT, "parent, resbuf:\n");
      // printf(STDOUT, resBuf);
      // printf(STDOUT, "\n");
      // printf(STDOUT, "here is location of readbuf in func: %x\n", readBuff);

      baseByte = &readBuff[currChar]+1;
    }
    currChar+=1;
  }
  // printf(STDOUT, "done\nhere's resbuf: ");
  memcpy(resBuf, baseByte, (&readBuff[currChar]-baseByte));//this is gross but who cares amirite
  // printf(STDOUT, resBuf);
  // printf(STDOUT, "\n");
  *readBuf = resBuf;
  free(readBuff);
  return;
}

//shamelessly ripped from sh.c  
int getcmd(char *buf){
  printf(STDOUT, "> ");
  memset(buf, 0, TOTALSIZE);
  gets(buf, TOTALSIZE);
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
  char** argv = (char **)malloc(MAXARGS*sizeof(char*));
  return argv;
}

void cleanup(char** argv, int basePid){
  for (int i=0;i<MAXARGS; i++){
    argv[i]=0;
  }
  if (getpid() != basePid){
    exit();
  }
}

void printArgAddress(char** argv){
  for (int i=0;i<MAXARGS; i++){
    printf(STDOUT, "%x ", argv[i]);
  }
}