# Project Name
PROJECT := fastrak

# Project Version
#VERSION := 20101115

# Binary Files
#BINFILES := fastrakd

# Library files
#SHAREDLIBS :=

#all: default

#CC := g++
#include /usr/share/make-common/common.1.mk

#CPPFLAGS +=  -O0
#CFLAGS += --std=gnu99 -O0

#default: $(LIBFILES) $(BINFILES)

#$(call LINKBIN, fastrakd, fastrak.o fastrakd.o, amino somatic stdc++ reflex)

#.PHONY: default clean

BINARIES := fastrakd

CFLAGS := -g --std=gnu99

all : $(BINARIES)

LIBS := -lach -lrt -lc -lm

OBJS := fastrakd.o fastrak.o daemonizer.o

fastrakd: $(OBJS)
	$(CC) $(CFLAGS) -o $@ $(OBJS) $(LIBS) 


clean:
	rm -fr *.o $(BINARIES) $(LIBS) *.o debian *.deb *.lzma
depclean: clean
	rm -fr .deps
