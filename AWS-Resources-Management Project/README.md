# AWS Resource Management Script

This project contains a shell script that allows you to list and manage AWS resources in your AWS account. The script provides an easy-to-use interface to interact with multiple AWS services and provides insights into the resources available in your chosen AWS region.

## Features

- Lists and counts resources in various AWS services:
  - EC2 Instances
  - S3 Buckets
  - Lambda Functions
  - RDS Instances
  - IAM Users
  - DynamoDB Tables
  - EC2 Volumes
  - Security Groups
- Supports selecting a specific service or listing all resources.
- User-friendly interface with options for region and service selection.
- Requires AWS CLI to be installed and configured on the local machine.

## Prerequisites

- **AWS CLI**: Ensure the AWS CLI is installed and configured. If you haven't installed it yet, follow the instructions [here](https://aws.amazon.com/cli/).
- **AWS Credentials**: Make sure your AWS credentials are set up and configured with sufficient permissions to list the resources. You can configure them by running:
  
  ```
  aws configure
  ```

## Installation

1. Clone the repository:
   ```
   git clone https://github.com/Tariqueali17/Shell_Scripting_Besic_DevOps_Project.git
   ```

2. Navigate to the project directory:
   ```
   cd Shell_Scripting_Besic_DevOps_Project/
   ```
   ```
   cd AWS-Resources-Management\ Project/
   ```

4. Make the script executable:
   ```
   chmod +x aws-resource-management-project.sh
   ```

## Usage

1. Run the script:
   ```
   ./aws-resource-management.sh
   ```

2. The script will prompt you to:
   - Enter an AWS region (e.g., `us-east-1`).
   - Select the AWS service you want to list resources for (EC2, S3, Lambda, etc.).

3. After selecting a service, the script will fetch the resources and provide a count of resources in that service.

4. You can also choose to list all resources across multiple services in one go.

## Example Output

```
Please enter the AWS region (e.g., us-east-1):
us-east-1
Select the service you want to list resources for:
+----+------------------------+
| No | Service                |
+----+------------------------+
| 1  | EC2 Instances          |
| 2  | S3 Buckets             |
| 3  | Lambda Functions       |
| 4  | RDS Instances          |
| 5  | IAM Users              |
| 6  | DynamoDB Tables        |
| 7  | EC2 Volumes            |
| 8  | Security Groups        |
| 9  | All resources          |
+----+------------------------+
Enter the number corresponding to the service: 1
==============================================
EC2 Instances in region us-east-1
==============================================
i-0abcd1234efgh5678
i-0abcd1234efgh5679
Total EC2 Instances running: 2
```

## Contribution

If you would like to contribute to this project, feel free to fork the repository, make changes, and submit a pull request. Contributions are always welcome!

