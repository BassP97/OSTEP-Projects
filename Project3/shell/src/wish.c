#include "types.h"
#include "wishUtils.c"

#define STDIN 0
#define CHILDPROC 0
#define STDERR 1
#define STDOUT 2

int runWish(char **myargv, char** path, int argvSize, int argSize);

int main(int argc, char *argv[]){
    char* path[20];
    path[0] = "/bin/";
    uint maxArgs = 10;
    uint argSize = 100;
    char** myargv = allocateArgv(maxArgs+1, argSize);
    runWish(myargv, path, maxArgs+1, argSize);
    return 0;
}

int runWish(char **myargv, char** path, int argvSize, int argSize){
    while(getcmd(myargv[0], argSize)>=0){
        parseArgs(myargv[0], myargv, argvSize);
        if (isBuiltIn(myargv[0])){
            if (strcmpbool(myargv[0],"exit")==0){
                exit();
            }
            executeBuiltIn(myargv, path);
        }
        executeCmd(myargv);
        cleanup(myargv, argvSize, argSize);
    }
    return 0;
}