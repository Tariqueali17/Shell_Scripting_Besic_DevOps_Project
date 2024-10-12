#!/bin/bash

# Author: Tarique and DevOps Team
# Version: v0.0.1

# Script to check the active status of EC2 instances and S3 buckets

# Check if the required number of arguments are passed
if [ $# -ne 2 ]; then
    echo "Usage: ./resource_status.sh <aws_region> <resource.type>"
    echo "Example: ./resource_status.sh us-east-1 ec2"
    exit 1
fi

# Assign the arguments to variables
aws_region=$1
resource_type=$2

# Check if the AWS CLI is installed
if ! command -v aws &> /dev/null; then
    echo "AWS CLI is not installed. Please install the AWS CLI and try again."
    exit 1
fi

# Check if the AWS CLI is configured
if [ ! -d ~/.aws ]; then
    echo "AWS CLI is not configured. Please configure the AWS CLI and try again."
    exit 1
fi

# Check resource status based on the type
case $resource_type in
    ec2)
        echo "Checking EC2 Instances in $aws_region..."
        aws ec2 describe-instances --region $aws_region --query "Reservations[].Instances[].[InstanceId, State.Name]" --output table
        ;;
    s3)
        echo "Checking S3 Buckets in $aws_region..."
        aws s3api list-buckets --query "Buckets[].Name" --output table
        ;;
    *)
        echo "Invalid resource type. Please enter a valid type (ec2 or s3)."
        exit 1
        ;;
esac
