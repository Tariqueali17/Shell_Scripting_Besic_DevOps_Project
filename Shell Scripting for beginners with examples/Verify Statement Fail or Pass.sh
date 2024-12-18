#!/bin/bash
# Author: Tarique Ali
# Date: 20-11-2024
# Version: v1
set -e  # Exit immediately if a command exits with a non-zero status

# Your script commands here
echo "Running my script..."

# Check the exit status
if [ $? -eq 0 ]; then
    echo "Script executed successfully."
else
    echo "Script failed."
fi

#Explanation:
#if [ $? -eq 0 ]: This checks the exit status of the last executed command.
#0 means success.
#Non-zero means failure.
