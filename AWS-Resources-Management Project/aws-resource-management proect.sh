#!/bin/bash
# Author: Tarique Ali
# Date: 20-11-2024
# Version: v0.2
# Usage: ./aws-resource-list.sh (It will ask you to add region and select service to see AWS resources)
# This Script will list all the resources in the AWS account and count them.

  figlet -c  "T A R I Q" 
  echo "" 
  figlet -c "D E V O P S   T E A M"
  echo "+----+-----------------------------+"
  echo "| This Script Written By Tarique  |"
  echo "| Version v0.2  |"
  echo "+----+----------------------------+"
# Function to check if AWS CLI is installed
check_aws_cli_installed() {
  # This function checks if the AWS CLI is installed by using the `command -v` command
  # which looks for the executable in the system's PATH. If AWS CLI is not found, it 
  # prompts the user to install it and exits the script.
  if ! command -v aws &> /dev/null
  then
    echo "AWS CLI is not installed. Please install AWS CLI first."
    echo "You can download it from: https://aws.amazon.com/cli/"
    exit 1
  fi
}

# Function to check if AWS CLI is configured
check_aws_cli_configured() {
  # This function checks if the AWS CLI is properly configured. It uses the `aws sts get-caller-identity`
  # command, which returns details about the IAM user associated with the AWS credentials. If the AWS CLI
  # is not configured, the script prompts the user to configure it using `aws configure`.
  if ! aws sts get-caller-identity &> /dev/null
  then
    echo "AWS CLI is installed, but it seems it is not configured."
    echo "Please configure the AWS CLI using the command:"
    echo "aws configure"
    exit 1
  fi
}

# Function to prompt the user for a region
get_region() {
  # This function prompts the user to input an AWS region (e.g., us-east-1). It checks if the region
  # is already set via the AWS_DEFAULT_REGION environment variable. If not, it prompts the user.
  echo "Please enter the AWS region (e.g., us-east-1):"
  read region
  export AWS_DEFAULT_REGION=$region
}

# Function to prompt the user for a service to list
get_service() {
  # This function displays a list of AWS services in a table format for the user to choose from.
  # The services include EC2, S3, Lambda, RDS, IAM, DynamoDB, EC2 Volumes, and Security Groups.
  # The user is then prompted to enter the number corresponding to the service they want to check.
  echo "Select the service you want to list resources for:"
  echo "+----+------------------------+"
  echo "| No | Service                |"
  echo "+----+------------------------+"
  echo "| 1  | EC2 Instances          |"
  echo "| 2  | S3 Buckets             |"
  echo "| 3  | Lambda Functions       |"
  echo "| 4  | RDS Instances          |"
  echo "| 5  | IAM Users              |"
  echo "| 6  | DynamoDB Tables        |"
  echo "| 7  | EC2 Volumes            |"
  echo "| 8  | Security Groups        |"
  echo "| 9  | All resources          |"
  echo "+----+------------------------+"
  read -p "Enter the number corresponding to the service: " choice
}

# Function to count and list EC2 instances
list_ec2_instances() {
  # This function lists all EC2 instances in the AWS region specified by `$AWS_DEFAULT_REGION`.
  # It uses the AWS CLI `aws ec2 describe-instances` command to get the instance IDs.
  # After fetching the instance IDs, it counts the number of instances using `wc -l`.
  # If there are no instances, it displays a message indicating that the service is not being used.
  echo "=============================================="
  echo "EC2 Instances in region $AWS_DEFAULT_REGION"
  echo "=============================================="
  result=$(aws ec2 describe-instances --query 'Reservations[*].Instances[*].InstanceId' --output text)
  count=$(echo "$result" | wc -l)
  if [[ -z "$result" ]]; then
    echo "Hello AWS user, you're not using this service."
  else
    echo "$result" | column -t  # Format the list output into a neat table
    echo "Total EC2 Instances running: $count"  # Display the count of EC2 instances
  fi
}

# Function to count and list S3 buckets
list_s3_buckets() {
  # This function lists all S3 buckets in the AWS account using the `aws s3 ls` command.
  # It counts the number of buckets using `wc -l`. If there are no buckets, a message is shown.
  echo "=============================="
  echo "S3 Buckets in the Account"
  echo "=============================="
  result=$(aws s3 ls)
  count=$(echo "$result" | wc -l)
  if [[ -z "$result" ]]; then
    echo "Hello AWS user, you're not using this service."
  else
    echo "$result" | column -t  # Format the list output into a neat table
    echo "Total S3 Buckets: $count"  # Display the count of S3 buckets
  fi
}

# Function to count and list Lambda functions
list_lambda_functions() {
  # This function lists all Lambda functions in the AWS account using the `aws lambda list-functions` command.
  # It counts the number of functions using `wc -l`. If no functions exist, a message is shown.
  echo "===================================="
  echo "Lambda Functions in the Account"
  echo "===================================="
  result=$(aws lambda list-functions --query 'Functions[*].FunctionName' --output text)
  count=$(echo "$result" | wc -l)
  if [[ -z "$result" ]]; then
    echo "Hello AWS user, you're not using this service."
  else
    echo "$result" | column -t  # Format the list output into a neat table
    echo "Total Lambda Functions: $count"  # Display the count of Lambda functions
  fi
}

# Function to count and list RDS instances
list_rds_instances() {
  # This function lists all RDS instances in the AWS account using the `aws rds describe-db-instances` command.
  # It counts the number of instances using `wc -l`. If no instances exist, a message is displayed.
  echo "================================="
  echo "RDS Instances in the Account"
  echo "================================="
  result=$(aws rds describe-db-instances --query 'DBInstances[*].DBInstanceIdentifier' --output text)
  count=$(echo "$result" | wc -l)
  if [[ -z "$result" ]]; then
    echo "Hello AWS user, you're not using this service."
  else
    echo "$result" | column -t  # Format the list output into a neat table
    echo "Total RDS Instances: $count"  # Display the count of RDS instances
  fi
}

# Function to count and list IAM users
list_iam_users() {
  # This function lists all IAM users in the AWS account using the `aws iam list-users` command.
  # It counts the number of users using `wc -l`. If no users exist, a message is shown.
  echo "=============================="
  echo "IAM Users in the Account"
  echo "=============================="
  result=$(aws iam list-users --query 'Users[*].UserName' --output text)
  count=$(echo "$result" | wc -l)
  if [[ -z "$result" ]]; then
    echo "Hello AWS user, you're not using this service."
  else
    echo "$result" | column -t  # Format the list output into a neat table
    echo "Total IAM Users: $count"  # Display the count of IAM users
  fi
}

# Function to count and list DynamoDB tables
list_dynamodb_tables() {
  # This function lists all DynamoDB tables in the AWS account using the `aws dynamodb list-tables` command.
  # It counts the number of tables using `wc -l`. If no tables exist, a message is shown.
  echo "===================================="
  echo "DynamoDB Tables in the Account"
  echo "===================================="
  result=$(aws dynamodb list-tables --output text)
  count=$(echo "$result" | wc -l)
  if [[ -z "$result" ]]; then
    echo "Hello AWS user, you're not using this service."
  else
    echo "$result" | column -t  # Format the list output into a neat table
    echo "Total DynamoDB Tables: $count"  # Display the count of DynamoDB tables
  fi
}

# Function to count and list EC2 Volumes
list_ec2_volumes() {
  # This function lists all EC2 volumes in the specified AWS region using the `aws ec2 describe-volumes` command.
  # It counts the number of volumes using `wc -l`. If no volumes exist, a message is shown.
  echo "================================="
  echo "EC2 Volumes in region $AWS_DEFAULT_REGION"
  echo "================================="
  result=$(aws ec2 describe-volumes --query 'Volumes[*].VolumeId' --output text)
  count=$(echo "$result" | wc -l)
  if [[ -z "$result" ]]; then
    echo "Hello AWS user, you're not using this service."
  else
    echo "$result" | column -t  # Format the list output into a neat table
    echo "Total EC2 Volumes: $count"  # Display the count of EC2 volumes
  fi
}

# Function to count and list Security Groups
list_security_groups() {
  # This function lists all Security Groups in the specified AWS region using the `aws ec2 describe-security-groups` command.
  # It counts the number of security groups using `wc -l`. If no groups exist, a message is shown.
  echo "====================================="
  echo "Security Groups in region $AWS_DEFAULT_REGION"
  echo "====================================="
  result=$(aws ec2 describe-security-groups --query 'SecurityGroups[*].GroupName' --output text)
  count=$(echo "$result" | wc -l)
  if [[ -z "$result" ]]; then
    echo "Hello AWS user, you're not using this service."
  else
    echo "$result" | column -t  # Format the list output into a neat table
    echo "Total Security Groups: $count"  # Display the count of security groups
  fi
}

# Main function to handle service selection
handle_service_selection() {
  # This function processes the user's selection, calling the appropriate function based on the user's choice.
  case $choice in
    1)
      list_ec2_instances
      ;;
    2)
      list_s3_buckets
      ;;
    3)
      list_lambda_functions
      ;;
    4)
      list_rds_instances
      ;;
    5)
      list_iam_users
      ;;
    6)
      list_dynamodb_tables
      ;;
    7)
      list_ec2_volumes
      ;;
    8)
      list_security_groups
      ;;
    9)
      # If the user selects option 9, all services are listed
      list_ec2_instances
      list_s3_buckets
      list_lambda_functions
      list_rds_instances
      list_iam_users
      list_dynamodb_tables
      list_ec2_volumes
      list_security_groups
      ;;
    *)
      echo "Invalid choice. Please try again."  # If an invalid choice is entered, prompt the user again
      ;;
  esac
}

# Check if AWS CLI is installed
check_aws_cli_installed

# Check if AWS CLI is configured
check_aws_cli_configured

# Prompt for region if not already configured
if [ -z "$AWS_DEFAULT_REGION" ]; then
  get_region
fi

# Ask the user for the service they want to list
get_service

# Handle the user's selection
handle_service_selection
