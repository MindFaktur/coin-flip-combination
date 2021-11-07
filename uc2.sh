#!/bin/bash 

loop_times=$((RANDOM%1000))
numHeads=0
numTails=0

declare -A singlet
while (( $((numHeads+numTails))<=$loop_times ))
do
	if (( $((RANDOM%2))==1 ))
	then
		((singlet[H]++))
		numHeads=$((numHeads+1))
	else
		((singlet[T]++))
		numTails=$((numTails+1))
	fi
done

echo "Number of times coin flipped is $loop_times"

for i in ${!singlet[@]}
do
	echo $i ":" ${singlet[$i]}
done
percentage_heads=`awk "BEGIN {print ((${singlet[H]}*100)/$loop_times)}"`
percentage_tails=`awk "BEGIN {print ((${singlet[T]}*100)/$loop_times)}"`


echo "percentage of heads is $percentage_heads"
echo "percentage of heads is $percentage_tails"
