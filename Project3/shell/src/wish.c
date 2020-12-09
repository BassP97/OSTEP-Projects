#include "types.h"
#include "wishUtils.c"

#define STDIN 0
#define CHILDPROC 0
#define STDERR 1
#define STDOUT 2
#define MAXARGS 11
#define TOTALSIZE 1000

int runWish(char **myargv, char** path);

int main(int argc, char *argv[]){
    char* path[20];
    path[0] = "/bin/";
    char** myargv = allocateArgv();
    runWish(myargv, path);
    return 0;
}

int runWish(char **myargv, char** path){
    char* readBuff = malloc(TOTALSIZE);
    while(getcmd(readBuff)>=0){
        parseArgs(readBuff, myargv);
        if (isBuiltIn(myargv[0])){
            if (strcmpbool(myargv[0],"exit")){
                free(readBuff);
                free(myargv);
                exit();
            }
            executeBuiltIn(myargv, path);
        }
        executeCmd(myargv);
        cleanup(myargv);
    }
    free(readBuff);
    free(myargv);
    return 0;
}