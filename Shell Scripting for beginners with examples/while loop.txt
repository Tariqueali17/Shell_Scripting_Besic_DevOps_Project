#!/bin/bash
# Author: Tarique Ali
# Date: 20-11-2024
# Version: v1
# While loop example: Loop while condition is true

i=1
while [ $i -le 5 ]
do
    echo "Iteration number: $i"
    ((i++))  # Increment i
done
