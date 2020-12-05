#include "types.h"
#include "wishUtils.c"

#define STDIN 0
#define CHILDPROC 0
#define STDERR 1
#define STDOUT 2
#define MAXARGS 11
#define ARGSIZE 100

int runWish(char **myargv, char** path);

int main(int argc, char *argv[]){
    char* path[20];
    path[0] = "/bin/";
    char** myargv = allocateArgv();
    runWish(myargv, path);
    return 0;
}

int runWish(char **myargv, char** path){
    while(getcmd(myargv[0])>=0){
        parseArgs(myargv[0], myargv);
        if (isBuiltIn(myargv[0])){
            if (strcmpbool(myargv[0],"exit")){
                exit();
            }
            executeBuiltIn(myargv, path);
        }
        executeCmd(myargv);
        cleanup(myargv);
    }
    return 0;
}