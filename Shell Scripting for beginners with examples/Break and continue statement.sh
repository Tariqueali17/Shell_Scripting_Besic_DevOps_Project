#!/bin/bash
# Author: Tarique Ali
# Date: 20-11-2024
# Version: v1
#What is a difference between break and continue statements ?

for i in {1..5}
do
    if [ $i -eq 3 ]
    then
        continue  # Skip iteration when i is 3
    fi
    if [ $i -eq 4 ]
    then
        break  # Exit the loop when i is 4
    fi
    echo "Value of i is $i"
done
