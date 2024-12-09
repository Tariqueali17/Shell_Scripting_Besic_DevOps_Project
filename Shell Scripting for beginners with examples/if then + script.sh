			If-then Scripts: 


Check the variable 
01-
#!/bin/bash
# Author: Tarique Ali
# Date: 20-11-2024
# Version: v1
 
count=100 
if [ $count -eq 100 ] 
then 
echo Count is 100 
else 
echo Count is not 100 
fi 


Check if a file error.txt exist 

02-
#!/bin/bash
# Author: Tarique Ali
# Date: 20-11-2024
# Version: v1

clear 
if [ -e /home/tariq/error.txt ] 
then 
echo "File exist" 
else 
echo "File does not exist" 
fi 


Check if a variable value is met 

03-
#!/bin/bash
# Author: Tarique Ali
# Date: 20-11-2024
# Version: v1

a=`date | awk '{print $1}'` 
if [ "$a" == Mon ] 
then 
echo Today is $a 
else 
echo Today is not Monday 
fi 


Check the response and then output 
04-
#!/bin/bash
# Author: Tarique Ali
# Date: 20-11-2024
# Version: v1
 
clear 
echo 
echo "What is your name?" 
echo 
read a 
echo 
echo Hello $a sir 
echo 
echo "Do you like working in IT? (y/n)" 
read Like 
echo 
if [ "$Like" == y ] 
then 
echo You are cool 
elif [ "$Like" == n ] 
then 
echo You should try IT, it’s a good field 
echo 
fi 


Other If statements 
If the output is either Monday or Tuesday 
if [ “$a” = Monday ] || [ “$a” = Tuesday ] 

Test if the error.txt file exist and its size is greater than zero 
if test -s error.txt  
if [ $? -eq 0 ]    
if [ -e /export/home/filename ] 
if [ "$a" != "" ]    
if [ error_code != "0" ]  


Comparisons: -eq equal to for numbers 
== 
equal to for letters -ne not equal to 
!== not equal to for letters -lt less than -le less than or equal to -gt greater than -ge greater than or equal to 
If input is equal to zero (0) 
If file is there 
If variable does not match 
If file not equal to zero (0)
