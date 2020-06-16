#!/bin/bash
# Program:
# This program prints a 9*9 table on your screen.
# History:
# 2017/05/12 Captain First release

function mul
{
	local x=$1
	local y=$2
	return $((x * y))
}

echo
echo "Let's rock!"
echo

for ((i = 1; i <= 9; i++))
do
	if [ $i == 5 ]
	then
		echo "----------------:(----------------"
	else
		for ((j = 1; j <= 9; j++))
		do
			mul $i $j
			result=$?
			echo -n $result
			if [ $result -gt 9 ]
			then
				echo -n "  "
			else
				echo -n "   "
			fi
		done
		echo
	fi
done

echo
echo "That's all."
echo
