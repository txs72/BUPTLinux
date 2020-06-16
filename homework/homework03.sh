#!/bin/bash
# Author  : Captain
# Date    : May 22, 2017
# Purpose : Ouptput the top n words in a given English text file
#
if [ $# -ne 2 -a $# -ne 1 ]; then
	echo "usage: `basename $0` [n] Input_File"
	echo
	exit
fi

if [ $# -eq 1 ]; then
	I_TOP=10
	I_FILE=$1
fi

if [ $# -eq 2 ]; then
	I_TOP=$1
	I_FILE=$2
fi

tr -sc 'A-Za-z' '[\012*]' < $I_FILE | \
tee debug.txt | \
tr 'A-Z' 'a-z' | \
sort | \
uniq -c | \
sort -k1 -n -r | \
head -$I_TOP | nl



