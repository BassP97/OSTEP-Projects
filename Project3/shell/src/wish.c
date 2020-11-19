#include "types.h"
#include "wishUtils.c"

#define STDIN 0
#define CHILDPROC 0
#define STDOUT 1
#define STDERR 2

int main(int argc, char *argv[]){
    char* myargv[20];
    uint maxCmdSize = 100;
    myargv[0] = malloc(maxCmdSize);
    myargv[1] = "\0";
    while(getcmd(myargv[0], maxCmdSize)>=0){
        if (fork() == CHILDPROC){
            exec(myargv[0], myargv);
            printf(STDERR, "exec %sfailed\n", myargv[0]);
        }
        wait();
    }
    printf(STDOUT, "done! ", myargv[0]);
    free(myargv[0]);
    return 0;
}