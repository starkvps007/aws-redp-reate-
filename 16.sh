#!/bin/bash

# Step 1: Get the AWS region
AWS_REGION=$(echo $AWS_REGION)
echo "AWS Region: $AWS_REGION"

# Step 2: Set the corresponding AMI ID based on the region
case $AWS_REGION in
    us-east-1)
        AMI_ID="ami-0d0e8b294f5fa3e60"
        ;;
    us-east-2)
        AMI_ID="ami-0de61e36f02e53313"
        ;;
    us-west-1)
        AMI_ID="ami-0235d6a9d9cd95338"
        ;;
    us-west-2)
        AMI_ID="ami-009906028fff46de2"
        ;;
    ap-south-1)
        AMI_ID="ami-0a63b322ce5ba80c9"
        ;;
    ap-northeast-3)
        AMI_ID="ami-05568e512b7219bd6"
        ;;
    ap-northeast-2)
        AMI_ID="ami-0ca913f2eb86682d3"
        ;;
    ap-southeast-1)
        AMI_ID="ami-07f1af27836b587d3"
        ;;
    ap-southeast-2)
        AMI_ID="ami-0d9fa9def05704a02"
        ;;
    ap-northeast-1)
        AMI_ID="ami-032985d75659a9d00"
        ;;
    ca-central-1)
        AMI_ID="ami-05571727af3fbbfd8"
        ;;
    eu-central-1)
        AMI_ID="ami-0c0a94268ee762436"
        ;;
    eu-west-1)
        AMI_ID="ami-00043ddaae3842b8c"
        ;;
    eu-west-2)
        AMI_ID="ami-0a5bc3380750d6551"
        ;;
    eu-west-3)
        AMI_ID="ami-0f86e4f2f0ee6d61f"
        ;;
    eu-north-1)
        AMI_ID="ami-0bd648f1a2627a01d"
        ;;
    sa-east-1)
        AMI_ID="ami-0616c77a49f8bd791"
        ;;
    *)
        echo "Unsupported region: $AWS_REGION"
        exit 1
        ;;
esac

echo "AMI ID for region $AWS_REGION: $AMI_ID"

# Step 3: Set key pair name as 'test.pem'
KEY_NAME="test"  # Key name will be 'test'
echo "Using key pair: $KEY_NAME.pem"

# Step 4: Launch EC2 instances using the specified AMI, instance type, and security group
INSTANCE_TYPE="t3.xlarge"  # The instance type
SECURITY_GROUP="test"  # Security group name is 'test'

# Generate a random profile name for tagging the instances
PROFILE_NAME="RandomProfileName-$(date +%Y%m%d%H%M%S)"

echo "Creating instances with the AMI: $AMI_ID..."

aws ec2 run-instances \
    --image-id "$AMI_ID" \
    --count 8 \
    --instance-type "$INSTANCE_TYPE" \
    --key-name "$KEY_NAME" \
    --security-groups "$SECURITY_GROUP" \
    --tag-specifications "ResourceType=instance,Tags=[{Key=Name,Value=$PROFILE_NAME}]"

echo "8 instances created successfully with the AMI: $AMI_ID, the instance type: $INSTANCE_TYPE, the security group: $SECURITY_GROUP, and key pair: $KEY_NAME.pem."
