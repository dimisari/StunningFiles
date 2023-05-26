#!/bin/bash

tmps="../Templates"

case $1 in
  Makefile) cp Files/5Makefile $1;;
  *) case "${1##*.}" in
       c)   cp $tmps/1.c $1;vim $1;;
       sh)  cp $tmps/2.sh $1;chmod 700 $1;vim $1;;
       hs)  cp $tmps/3.hs $1;vim $1;;
       py)  cp $tmps/4.py $1;chmod 700 $1;vim $1;;
       ltx)
         cp -r $tmps/Latex $1; tex=$1/${1%%.*}.tex; mv $1/code.tex $tex;
         vim $tex;;
       *) echo "template for the extention ${1##*.} not supported"
     esac
esac
