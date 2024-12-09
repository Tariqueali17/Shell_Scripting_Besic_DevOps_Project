#!/bin/bash

# Author: Tarique Ali
# Date: 20-11-2024
# Version: v1
# This script outputs numbers from 1 to 100 that are divisible by 3 or 5 but not by 15

for i in {1..100}; do
  if [ $(expr $i % 3) -eq 0 ] || [ $(expr $i % 5) -eq 0 ] && [ $(expr $i % 15) -ne 0 ]; then 
    echo $i
  fi
done


-------------------------------------------------------------------------
Explanan
Sure! Here's an explanation of the logic behind printing numbers from 1 to 100 that are divisible by 3 or 5 but not by 15:

### Question Explanation

**Objective:**  
The goal is to find and print numbers between 1 and 100 that meet specific divisibility conditions: they should be divisible by either 3 or 5, but not by 15.

 Combined Logic:
- A number \( n \) meets the criteria if:
  - It is divisible by 3 **or** 5 **and** not divisible by 15.

 Implementation Steps:
1. **Loop Through Numbers:** Use a loop to iterate through each number from 1 to 100.
2. **Check Conditions:**
   - For each number, check if it is divisible by 3 or 5 using the modulus operator.
   - Additionally, check that it is not divisible by 15.
3. **Print the Number:** If the conditions are met, print the number.

Example:
- For the number 9:
  - \( 9 \mod 3 = 0 \) (divisible by 3)
  - \( 9 \mod 5 \neq 0 \) (not divisible by 5)
  - \( 9 \mod 15 \neq 0 \) (not divisible by 15)
  - Result: **Print 9**

- For the number 15:
  - \( 15 \mod 3 = 0 \) (divisible by 3)
  - \( 15 \mod 5 = 0 \) (divisible by 5)
  - \( 15 \mod 15 = 0 \) (divisible by 15)
  - Result: **Do not print 15**

By following this logic, the script will effectively filter and display the desired numbers from 1 to 100 based on the given conditions.
