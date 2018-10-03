
#include "types.h"      //maybe needed to use some types of variables
#include "user.h"       //functios like printf and syscalls

#define STDOUT 1        //following the standard nomenclature for xv6 output
#define N 20

void gastatempo(){
    int x, i = 0;
    for(x=0; x<112345678; x++){
        i++;
    }
    for(x=0; x<1123456; x++){
        i--;
    }
}

int rand=3;
int random(){
  rand = rand * 1664525 + 1013904223;
  if(rand<0){
    return (rand*-1);
  }
  return rand;
}

int main(){
    int pid;
    int i, raffled;
    for (i=0;i<N;i++){
            raffled=random()%2000; //ticket sorteado
            pid=fork(raffled);  
            
            if(pid==0){
                loop();
                exit();
            }
    }
    //while (wait() != -1);
   
   while(1){
        pid=wait();
        if(pid<0)break;
    } 
    
    
    
    exit();
}
