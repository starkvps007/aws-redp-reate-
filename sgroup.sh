# Create a security group named 'test'
aws ec2 create-security-group --group-name test --description "Security group for RDP access" --output text

# Get the security group ID of the newly created security group
SECURITY_GROUP_ID=$(aws ec2 describe-security-groups --group-names test --query 'SecurityGroups[0].GroupId' --output text)

# Add inbound rule to allow RDP (port 3389) from any IP (0.0.0.0/0)
aws ec2 authorize-security-group-ingress --group-id $SECURITY_GROUP_ID --protocol tcp --port 3389 --cidr 0.0.0.0/0

# Add inbound rule to allow all TCP ports (0-65535) from any IP (0.0.0.0/0)
aws ec2 authorize-security-group-ingress --group-id $SECURITY_GROUP_ID --protocol tcp --port 0-65535 --cidr 0.0.0.0/0

# Add outbound rule to allow all traffic (all TCP ports) to any IP (0.0.0.0/0)
aws ec2 authorize-security-group-egress --group-id $SECURITY_GROUP_ID --protocol tcp --port 0-65535 --cidr 0.0.0.0/0

echo "Security group 'test' created with inbound and outbound rules allowing all TCP ports and RDP (3389)."
