#!/bin/bash

###----------- for triplet combination ------------------###
loop_times=$((RANDOM%1000))
toss=0

declare -A triplet

while (( $toss<=$loop_times ))
do
   value=$((RANDOM%2))$((RANDOM%2))$((RANDOM%2))
   case $value in
      111) ((triplet[HHH]++))
            ((toss++));;
      110) ((triplet[HHT]++))
            ((toss++));;
      101) ((triplet[HTH]++))
            ((toss++));;
      011) ((triplet[THH]++))
            ((toss++));;
      001) ((triplet[TTH]++))
            ((toss++));;
      100) ((triplet[HTT]++))
            ((toss++));;
      000) ((triplet[TTT]++))
            ((toss++));;
      *) ((triplet[THT]++))
            ((toss++));;
      esac
done

echo "Number of times coin flipped is $loop_times"

declare -A triplet_percentage

for i in ${!triplet[@]}
do
   triplet_percentage[percentage$i]=`awk "BEGIN {print ((${triplet[$i]}*100)/$loop_times)}"`
done

for i in ${!triplet[@]}
do
   echo $i ":" ${triplet[$i]}
done
for i in ${!triplet_percentage[@]}
do
   echo $i ":" ${triplet_percentage[$i]}
done

echo "$( printf "%s\n" "${triplet_percentage[@]}" | sort -n )"
