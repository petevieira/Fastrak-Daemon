#include "fastrak.h"
#include <stdint.h>
#include <time.h>
#include <string.h>
#include <pthread.h>
#include <sys/stat.h>
#include <stdio.h>
#include <ach.h>


int main(int argc, char **argv )
{

    ach_channel_t chan;
    ach_open( &chan, "fastrak", NULL );
    fastrak_c_t fastrak;
    memset( &fastrak, 0, sizeof(fastrak) );
    size_t fs;

    int numOfsensors = 4;
    
    while(1)
    {
        ach_get( &chan, &fastrak, sizeof(fastrak), &fs, NULL, ACH_O_LAST );
        for(int sensor=0; sensor<4; sensor++)
        {
            printf( "%d| %f\t%f\t%f\n",sensor+1, 
            fastrak.data[sensor][0], fastrak.data[sensor][1],fastrak.data[sensor][2] );
        }
        printf("\n");
        usleep(10000);
    }

    ach_close( &chan );
}















