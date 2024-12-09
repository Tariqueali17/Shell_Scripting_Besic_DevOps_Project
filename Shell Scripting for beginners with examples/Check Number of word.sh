#!/bin/bash
# Author: Tarique Ali
# Date: 20-11-2024
# Version: v1
#Write a script to print number of "S" in Pakistan
x=Pakistan
#grep -o (-o means only )
count=$(grep -o "s" <<< "$x" | wc -l)      # wc -l (word counts)
echo "Number of S in Pakistan : $count"
