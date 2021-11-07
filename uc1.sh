#!/bin/bash

echo "This is a coin flip simulator"

value=$((RANDOM%2))

if (( $value==1 ))
then
	echo "The winner is heads"
else
	echo "The winner is tails"
fi
