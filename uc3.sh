#!/bin/bash 

loop_times=$((RANDOM%1000))
toss=0

declare -A singlet

while (( $toss<=$loop_times ))
do
	value=$((RANDOM%2))$((RANDOM%2))
	case $value in
		11) ((singlet[HH]++))
				((toss++));;
		10) ((singlet[HT]++))
				((toss++));;
		00) ((singlet[TT]++))
				((toss++));;
		*) ((singlet[TH]++))
				((toss++))
		esac
done

echo "Number of times coin flipped is $loop_times"

for i in ${!singlet[@]}
do
	echo $i ":" ${singlet[$i]}
	percentage=`awk "BEGIN {print ((${singlet[$i]}*100)/$loop_times)}"`
	echo $i " winning percentage is " $percentage
done


