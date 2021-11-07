#!/bin/bash 

loop_times=$((RANDOM%1000))
toss=0

declare -A singlet

while (( $toss<=$loop_times ))
do
	value=$((RANDOM%2))$((RANDOM%2))$((RANDOM%2))
	case $value in
		111) ((singlet[HHH]++))
				((toss++));;
		110) ((singlet[HHT]++))
				((toss++));;
		101) ((singlet[HTH]++))
				((toss++));;
		011) ((singlet[THH]++))
				((toss++));;
		001) ((singlet[TTH]++))
				((toss++));;
		100) ((singlet[HTT]++))
				((toss++));;
		000) ((singlet[TTT]++))
				((toss++));;
		*) ((singlet[THT]++))
				((toss++));;
		esac
done

echo "Number of times coin flipped is $loop_times"

for i in ${!singlet[@]}
do
	echo $i ":" ${singlet[$i]}
	percentage=`awk "BEGIN {print ((${singlet[$i]}*100)/$loop_times)}"`
	echo $i " winning percentage is " $percentage
done
